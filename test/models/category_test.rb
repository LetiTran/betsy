require "test_helper"

describe Category do
  let(:category) { Category.new name: "candy" }

  it 'must have a name' do
    category.name = nil
    category.valid?.must_equal false
  end

  it 'must have at least one character' do
    category.name = ""
    category.valid?.must_equal false
  end

  it 'cannot have more than 25 characters' do
    category.name = "12345678901234567890123456"
    category.valid?.must_equal false
  end

  it 'name must be unique' do
    category.name = "Chocolate"
    category.valid?.must_equal false
  end
end
