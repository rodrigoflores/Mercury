# Mercury

Markdown library in Erlang. 

For now, it is only working on OSX Lion. 

## Dependencies

* Erlang nif library
* [Tanoku's Sundown](https://github.com/tanoku/sundown) (which is already included as a gitmodule)

## Installing

```console
git clone git://github.com/rodrigoflores/Mercury.git
cd Mercury
git submodule update --init
make
```

## To load in an Erlang app

We included an example in `erlang-example/markdown.erl` file. So, go to this directory, and open an erlang shell and type this:

```erlang
> c(markdown).
> markdown:to_html(<<"# An awesome title">>).
```

If everything is working, it should return: `<<"<h1>An awesome title</h1>">>`

## To do

Pull requests are welcome :)

* How do I put markdown.so globally so only a `erlang:load_nif('markdown',1)` is enough to load it?
* Make it work on Linux environments;
* Make it work on Windows environments.

## License

See LICENSE file.
