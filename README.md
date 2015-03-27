# Erlang Patterns

Please see [http://erlangpatterns.org](http://erlangpatterns.org) for
the published site.

The site content is generated using
[Lambda Pad](http://lambdapad.io). See **Building** below for more
information on building the site.

## Contributing to the Patterns

Refer to [CONTRIBUTING.md](CONTRIBUTING.md) for the project
contribution policy.

If you want to add a pattern, simply add a file to the `patterns`
directory that follows the conventions of the other pattern documents
in that directory.

To modify a pattern, simply edit the applicable file.

Please submit a pull request to the project to apply your changes.

Currently erlangpatterns.org is updated manually by the project
administrator using the master branch of this repository.

If you'd like to ask a question or raise an issue about a pattern,
please use the project's
[issue tracking system](https://github.com/gar1t/erlang-patterns/issues).

## Building

You don't have to build the project to contribute, however you must
build it to preview your changes within the context of the whole site.

Use the instructions below to build the site using LambdaPad.

### Install Lambda Pad

You need to first install Lambda Pad.

```
git clone https://github.com/gar1t/lambdapad.git
cd lambdapad
make
```

Add the Lambda Pad `bin` directory to you path.

### Clone Your Fork of the Project

```
git clone https://github.com/YOUR-FORK
cd erlang-patterns
make
```

## View the Presentation

You can view the presentation by simply opening the file:

`erlang-patterns/site/index.html`

Or by running:

```
make serve
```

and opening [http://localhost:8000](http://localhost:8000)
