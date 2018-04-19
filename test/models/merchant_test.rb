require "test_helper"

describe Merchant do
  let(:merchant) { Merchant.new username: "person", email: "email@email.com" }

  it "must be valid" do
    merchant.must_be :valid?
  end

  it "must have a username" do
    merchant.username = nil

    merchant.valid?.must_equal false
    merchant.errors.must_include :username
  end

  it "must raise error for invalid username length" do
    merchant.username = ""

    merchant.valid?.must_equal false
    merchant.errors.must_include :username
  end

  it "must have a unique username" do
    existing_username = Merchant.first.username

    merchant.username = existing_username

    merchant.valid? false
    merchant.errors.must_include :username
  end


  it "must have an email" do
    merchant.email = nil

    merchant.valid?.must_equal false
    merchant.errors.must_include :email
  end

  it "must raise error for invalid email format" do
    merchant.email = "abcdefg"

    merchant.valid?.must_equal false
    merchant.errors.must_include :email
  end

  it "must have a unique email" do
    existing_email = Merchant.first.email

    merchant.email = existing_email

    merchant.valid?.must_equal false
    merchant.errors.must_include :email
  end


end
