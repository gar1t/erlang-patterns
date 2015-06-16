gen:
	rm -f site/*.html
	lpad-gen

clean:
	rm -rf site

serve: gen
	cd site && python -m SimpleHTTPServer

publish: gen
	s3cmd sync -P --no-mime-magic --delete-removed site/* s3://www.erlangpatterns.org
