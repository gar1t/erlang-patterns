-module(index).

data(_) ->
    #{project        => {eterm,    "project.config"},
      site           => {eterm,    "site.config"},
      snippets       => {markdown, "snippets/*.md"},
      contributing   => {markdown, "CONTRIBUTING.md"},
      methodology    => {markdown, "METHODOLOGY.md"},
      patterns       => {markdown, "patterns/*.md"}}.

site(Data) ->
    #{"site/index.html"        => {template, "template/index.html"},
      "site/methodology.html"  => {template, "template/methodology.html"},
      "site/patterns.html"     => {template, "template/patterns.html"},
      "site/contributing.html" => {template, "template/contributing.html"},
      "site/{{pattern|basename}}.html" =>
                                  {template_map, "template/pattern.html",
                                   {pattern, plist:value(patterns, Data)}},
      "site/css"               => {dir, "template/css"},
      "site/js"                => {dir, "template/js"},
      "site/images"            => {dir, "template/images"}}.

recent_patterns(Patterns) ->
    Patterns.
