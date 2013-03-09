# Iteration

[Website](http://rubyworks.github.com/iteration) /
[Development](http://github.com/rubyworks/iteration)

[![Build Status](https://secure.travis-ci.org/rubyworks/iteration.png)](http://travis-ci.org/rubyworks/iteration)
[![Gem Version](https://badge.fury.io/rb/iteration.png)](http://badge.fury.io/rb/iteration)


## DESCRIPTION

Have you ever wanted to know if an iteration was the last,
or the first, or what iteration results came before the
current? Well, now you can!

Iteration is a class that encapsulate a step in an each loop.
It can be used to query infromation about an iteration easily.


## FEATURES

* Query sate of each iteration.
* Supports look-ahead features on Arrays.


## SYNOPSIS

Iterate over each element of array using an iteration object.

    [1,2,3].each_iteration do |it|
      p it.index
      p it.value
      p it.first?
      p it.last?
      p it.prior
      p it.after
    end

on each successive iteration produces:

    0          1          2
    1          2          3
    true       false      false
    false      false      true
    []         [1]        [1,2]
    [2,3]      [3]        []


## HOW TO INSTALL

To install with RubyGems simply open a console and type:

    gem install iteration

Local installation requires Setup.rb (gem install setup),
then download the tarball package and type:

    tar -xvzf iteration-1.0.0.tgz
    cd iteration-1.0.0.tgz
    sudo setup.rb all

Windows users use 'ruby setup.rb all'.


## COPYRIGHTS

Copyright (c) 2009 Rubyworks

This program is ditributed unser the terms of the *BSD-2-Clause* license.

See LICENSE.txt file for details.

