require 'minitest/autorun'

class TestValidScript < Minitest::Test
  def setup
    @file = File.open('my_test_file.rb', 'w')
  end

  def teardown
    File.delete('my_test_file.rb')
  end

  def test_valid_script_is_true_when_script_contains_valid_ruby
    @file.write('def method; end')

    assert_equal true, valid_script?('my_test_file.rb')
  end

  def test_valid_script_is_false_when_script_contains_invalid_ruby
    @file.write('def method; fed')

    assert_equal false, valid_script?('my_test_file.rb')
  end
end

#
# Checks whether the file passed in contains valid Ruby code.
#
# @param filename [String] The file to be checked
#
# @returns +true+ if the file has valid, +false+ otherwise.
#
# @note It _must not_ spawn a new process
# @note It _must not_ evaluate the code to do the check
#
def valid_script?(filename)
  #
  # This is what we want to implement in this 20 minutes.
  #
end
