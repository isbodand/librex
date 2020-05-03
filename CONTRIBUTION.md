# Contribution guidelines

All contributions are welcome, from the most trivial typo-fix, 
to reimplementing half the system for an average of 1 ms speedup.

## Code-style

I don't, sadly, have a compiled list of code-style requirements nor have I
a Clang-Format file. 
Thus, I do not enforce strict formatting requirements of the code.
However, a quick list of requirements that all code contributions must meet
is compiled in the following list.

 - Spaces instead of tabs: 
 I do not intend to take part in the holy war, but I have to take a side,
 unless I want to use some unicode witchery, which I don't.
 The code uses spaces in such a way that it is context sensitive:
 The average indentation is **4** spaces, but in lambdas and at namespace-scope
 the indentation is **2** spaces, furthermore, continuation indent is **5**
 spaces.
 The context-sensitive indentation level is not required to be met, if you cannot,
 however, spaces are required.
 Side-note: If you happen to know a way to tell Clang-Format to do this,
 and are willing to inform me about it, I am more than happy to switch to Clang-Format.
 
 - Naming scheme is, mostly, stdlib-style:  
 All identifiers use snake_case. Exceptions are:
   - Template parameters and enumerators, which are PascalCase.
   - Global variables, god forbid, are PascalCase with a leading `g`.
   - Macro definitions are SCREAMING_SNAKE_CASE with a leading project
   name, for example for librex: `INFO_LIBREX`. Do note that everything 
   I started is an Info* project, even if its name does not directly include 
   Info, like librex.  
 
 - Further naming conventions are:
   - Private members variables have a leading `_`.
   - Getters are not prefixed with anything, and if setting is not supported
   they return a const reference, unless the type is trivially copiable. If 
   setting is supported a non-const overload exists which returns a non-const
   reference.
  Example:
```c++
enum funenum {
    FirstThingy,
    SecondThingy,
    Yes,
    No
};

void fun(int);
#define INFO_LIBREX_NOTHING

int gFunkyBehavior = 1;

template<class Type>
using id = Type;

struct foo {
    int triv() const noexcept { return _triv; }
    int& triv() noexcept { return _triv; }
    
    const bar& big() const noexcept { return _big; }
    bar& big() noexcept { return _big; }
private:
    int _triv;
    bar _big;
};
```

 - Struct is preferred over class, with public members in the front 
 but class-level ordering is not-enforced.
 
 - If type is not a template, implementation of all non-defaulted member functions
 is required to be in a source file, unless there exists a strong reason not to.
 
 - Header includes are grouped with comments:
 For standard library under the comment `//stdlib`, 
 project files under `//project`, 
 everything else under their project name.
 Ordering is stdlib, dependency-projects, then project.

## Changelog

Changelog is to be updated by any PR that changes the code, with an appropriate
version bump as defined in `Changelog.md`.

Any contributor has the right to give a new release a codename if they contribute as
such as the version changes with a *minor*. If they do not wish to live with this
right, just create the PR without a name, and I'll give a codename which you can 
push to the PR which I'll then accept.

## Code-Ownership

The repository is licensed under BSD 3-Clause with the copyright of bodand.
A contributor may opt to license their new files under their own copyright,
which is applied by pasting the BSD 3-Clause license in the beginning such
as it is done for other project files but with a different copyright.

If such right is evoked the file is then accepted as copyrighted work of the
licensing contributor, which is used as an in-repo dependency by the repository.

The list of contributors is to be listed publicly, the second there exists more than
my sole self.

## Dependencies

Unless truly and absolutely necessary do not introduce new dependencies to the project.
If you wish to do so, you are welcome to, but the PR is going to get a harsh looking
at to judge the new dependency's necessity.

Dependencies must be compatible with the BSD license. Any version, we can even deal
with the old BSD's 4th point.
For example: BSD 4-Clause, BSD 3-Clause, BSD 2-Clause, BSD 0-Clause, zlib, Boost 1.0 and MIT. 
Do note that the GPL/AGPL does not meet this requirement, and I have literally no idea
what the LGPL allows, so unless someone can clearly explain, that doesn't count either.

This does not apply to in-repo dependencies created by new subprojects or licensing
files.
