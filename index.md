% uze, modules for zsh

# What is uze?

I wrote zsh scripts and libraries for more than 15 years now and i'm very opiniated
about what a minimal `~/.zshenv` could be.

* zsh options to be set to make code more reliable and maintainable
  (complaining as soon as something is wrong, reduce quoting hell, provide
  poor man namespaces, ...)
* use POD as documentation system so modules could be documented as well as
  a perl module (see the [WIP uze documentation](https://github.com/zsh-uze/uze) )

* helpers that need to be written once and forever
* way to write, document, test and share the code
  (inspired by the perl syntax and conventions)


[uze.zsh](https://raw.githubusercontent.com/zsh-uze/uze/master/lib/uze.zsh)
is here to be sourced in your `~/.zshenv` or your script so those best practices
are available. Now you can write zsh this way: 
([mir test suite](https://github.com/eiro/uze/blob/master/t/00_mir_load.zsh))

    uze mir
    uze devel/TAP :all

    mir_is_loaded () {
	for expected ( mir/ed mir/dump ) {
	    got="$( shush2 whence -wam $expected )"
	    [[ ${got%: *} == $expected ]]
	    ok "$expected is ready to use" ||
		note "got $got"
	}
    }

    prove mir_is_loaded

Perl has [CPAN](http://www.metacpan.org),
Python has [Pypi](https://pypi.python.org/pypi),
Lua has [rocks](https://luarocks.org/),
Javascript has [npm](https://www.npmjs.com/),
Lilypond has [lyp](https://github.com/noteflakes/lyp),
it's time for zsh to have something similar. you can see [modules using uze](//modules.html).


# Installation

source [uze.zsh](https://raw.githubusercontent.com/zsh-uze/uze/master/lib/uze.zsh)
from your `~/.zshenv`.

# Zsh, seriously? 

For some historical reasons, zsh comes with flaws and conventions are there to 
make those flaws less annoying. zsh is still relevant for a lot of tasks as it is
a dynamic langage comming with lot of features.

* distributed (over ssh)
* parallel (over pipes and fifo)
* extensible with any programming langage as any command can be run from zsh
* with some functional programming features
    * symbols can carry command names
    * piping is the easiest way to create closures
    * everything is stateless in a pipe
* comming with the most productive REPL ever, daily used by most of unix users

# Modules you must know about

## testing

see [devel-tap repo](http://github.com/zsh-uze/devel-tap) and
[test anything protocol](https://testanything.org/).

Testing is very important as your zsh scripts relies on incompatible
tools which silently misbehave at runtime (GNU core utils, BSD tools, 9base ...).

It is also recommended to install `devel/TAP` so you can write
test suites for your 

* a TAP generator to write test suites
* add helpers to embrace some good practices (perl inspired when possible)
  (yada yada operator, `die`, `warn`, ...)

* it is recommended to install and use the `devel/TAP` module to test your 
  programs and modules. see

