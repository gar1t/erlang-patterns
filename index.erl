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

%%===================================================================
%% Custom tag - example
%%
%% Reads example source code for use in fenced markdown examples.
%%
%% For example:
%%
%% ```erlang
%% {% example file="accumulator.erl" lines="5-10" %}
%% ```
%%===================================================================

example(Vars) ->
    read_file_lines(example_file(Vars), example_lines(Vars)).

example_file(Vars) ->
    Name = plist:value(file, Vars),
    Path = example_file_path(Name),
    handle_file_open(file:open(Path, [read]), Path).

example_file_path(Name) ->
    filename:join([lpad_session:root(), "examples", Name]).

handle_file_open({ok, F}, _File) -> F;
handle_file_open({error, Err}, File) ->
    error({file_open, Err, File}).

example_lines(Vars) ->
    parse_lines(plist:value(lines, Vars)).

parse_lines(Lines) ->
    Pattern = "^([0-9]+)-([0-9]+)$",
    Opts = [{capture, all_but_first, list}],
    handle_lines_match(re:run(Lines, Pattern, Opts), Lines).

handle_lines_match({match, [Start, Stop]}, _Lines) ->
    {list_to_integer(Start), list_to_integer(Stop)};
handle_lines_match(nomatch, Lines) ->
    error({lines, Lines}).

read_file_lines(In, {Start, Stop}) ->
    file_seek(In, Start - 1),
    Lines = file_acc_lines(In, (Stop - Start + 1)),
    file:close(In),
    Lines.

file_seek(In, Count) -> file_seek(In, 0, Count).

file_seek(In, Cur, Stop) when Cur < Stop ->
    io:get_line(In, ""),
    file_seek(In, Cur + 1, Stop);
file_seek(_In, _Cur, _Stop) ->
    ok.

file_acc_lines(In, Count) -> file_acc_lines(In, 0, Count, []).

file_acc_lines(In, Cur, Count, Acc) when Cur < Count ->
    Line = io:get_line(In, ""),
    file_acc_lines(In, Cur + 1, Count, [Line|Acc]);
file_acc_lines(_In, _Cur, _Count, [Last|Rest]) ->
    lists:reverse([strip_trailing_cr(Last)|Rest]).

strip_trailing_cr(Line) ->
    lists:sublist(Line, length(Line) - 1).

%%===================================================================
%% Code as Verbatim
%%
%% Erlang code samples might land with '{{' or '}}' which will
%% be treated as template markup. This filter wraps code blocks
%% with {% verbatim %}
%%===================================================================

code_as_verbatim(Html) ->
    re:replace(
      re:replace(Html, "<code ?", "{% verbatim %}<code ", [global]),
      "</code>", "</code>{% endverbatim %}", [global]).
