def valid_script?(file)
  valid_syntax?(File.read(file))
end

def valid_syntax?(code)
  RubyVM::InstructionSequence.compile(code)
  true
rescue SyntaxError
  false
end

require 'minitest/autorun'

class TestValidSyntax < Minitest::Test
  def setup
    @file = File.open('my_test_file.rb', 'w')
  end

  def teardown
    File.delete('my_test_file.rb')
  end

  def test_valid_syntax_is_true_when_file_has_valid_syntax
    assert_equal true, valid_syntax?('def method; end')
  end

  def test_valid_syntax_is_false_when_file_has_invalid_syntax
    assert_equal false, valid_syntax?('def method; fed')
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
