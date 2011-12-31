if RUBY_VERSION < "1.9"
  require 'enumerator'
end

module Enumerable

  # Iteration encapsulates a step in an each loop.
  #
  class Iteration

    attr_reader :enum, :index, :value, :prior

    def initialize(enum)
      @enum  = enum
      @index = 0
      @value = nil
      @prior = []
    end

    def first?
      index == 0
    end

    def last?
      index+1 == enum.size
    end

    def after
      enum.slice(index+1..-1)
    end

  #private

    # TODO: For Ruby 1.9 make private and use fcall.
    #
    def __step__(value, &block)
      @value = value
      block.call
      @index += 1
      @prior << value
    end

    #def next_iteration
    #  @index += 1
    #  @prior << value
    #  @after.shift if enum.respond_to?(:shift)
    #end
  end #class Iteration

  # This adds #iteration and #with_iteration methods
  # to Enumerator.
  #
  # TODO: How to access the underlying object of enumeration?
  # We need it to provide #size and #slice if possible.
  #
  class Enumerator

    def iteration #:yield:
      it = Iteration.new(self)
      each do |e|
        it.__step__(e){ yield(it) }
      end
    end

    def with_iteration(&block)
      it = Iteration.new(self)
      each do |e|
        it.__step__(e){ yield(e,it) }
      end
    end

  end #class Enumerator

end

#
class Array #:nodoc:

  # Iterate over each element of array using an iteration object.
  #
  #   [1,2,3].each_iteration do |it|
  #     p it.index
  #     p it.value
  #     p it.first?
  #     p it.last?
  #     p it.prior
  #     p it.after
  #   end
  #
  # on each successive iteration produces:
  #
  #   0          1          2
  #   1          2          3
  #   true       false      false
  #   false      false      true
  #   []         [1]        [1,2]
  #   [2,3]      [3]        []
  #
  # CREDIT: Trans

  def each_iteration(&block)
    if block_given?
      it = Iteration.new(self)
      each do |e|
        it.__step__(e){ yield(it) }
      end
    else
      return Enumerable::Enumerator.new(self, :each_iteration)
    end
  end

  # Same as #each_iteration, but provides both the iterated
  # element and the iteration.
  #
  def each_with_iteration(&block)
    if block_given?
      it = Iteration.new(self)
      each do |e|
        it.__step__(e){ yield(e, it) }
      end
    else
      return Enumerable::Enumerator.new(self, :each_iteration)
    end
  end

end

