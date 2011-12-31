require 'microtest'
require 'ae/legacy'

require 'iteration'

class TestArray < MicroTest::TestCase
  include AE::Legacy::Assertions

  def test_each_iteration
    a = [1,2,3]
    r = [ [1, 0, true , false, []   , [2,3]],
          [2, 1, false, false, [1]  , [3]  ],
          [3, 2, false, true,  [1,2], []   ] ]
    i = 0

    a.each_iteration do |it|
      value, index, first, last, prior, after = *r[i]
      assert_equal(value, it.value)
      assert_equal(index, it.index)
      assert_equal(first, it.first?)
      assert_equal(last, it.last?)
      assert_equal(prior, it.prior)
      assert_equal(after, it.after)
      i+=1
    end
  end

end


class TestEnumerator < MicroTest::TestCase
  include AE::Legacy::Assertions

  def test_iteration
    e = [1,2,3].to_enum(:each)
    r = [ [1, 0, true , false, []   , [2,3]],
          [2, 1, false, false, [1]  , [3]  ],
          [3, 2, false, true,  [1,2], []   ] ]
    i = 0

    e.iteration do |it|
      value, index, first, last, prior, after = *r[i]
      assert_equal(value, it.value)
      assert_equal(index, it.index)
      assert_equal(first, it.first?)
      #assert_equal(last, it.last?)  # TODO: when enumerators can report underlying object.
      assert_equal(prior, it.prior)
      #assert_equal(after, it.after)
      i+=1
    end
  end

end

