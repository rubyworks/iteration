# HISTORY

## 1.1.1 / 2013-03-10

This release fixes a bug in #each_with_iteration. When no
block was given, the enumerator returned was for `#each_iteration`
instead of `#each_with_iteration`.

Changes:

* Return corrert enumerator for #each_with_iteration.


## 1.1.0 / 2012-12-31

This release move the Iteration class to the toplevel
namespace.

Changes:

* Move Iteration to toplevel.
* Modernize build configuration.


## 1.0.0 / 2009-07-18

This is the initial release of Iteration.

Changes:

* Happy Birthday!

