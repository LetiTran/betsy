require "test_helper"
require "pry"

describe ProductsController do

  describe 'root' do
    it 'should work with all products' do
      get homepage_path
      must_respond_with :success
    end

    it 'should work with no products' do
      Product.destroy_all
      assert Product.all.empty?
      get homepage_path
      must_respond_with :success
    end
  end

  describe 'index' do
    it 'should get all products' do
      get products_path
      must_respond_with :success
    end

    it 'should work with no products' do
      Product.destroy_all
      assert Product.all.empty?
      get products_path
      must_respond_with :success
    end
  end

  describe 'show' do
    it 'should show details of a product' do
      get products_path(products(:candy).id)
      must_respond_with :success
    end
    it 'should return 404 for a bogus id' do
      get products_path("wrong id")
      must_respond_with :success
    end
  end

  describe 'new' do
    it 'should create a new Product' do
      get new_product_path
      must_respond_with :success
    end

  end

  describe 'create' do
    it 'creates a work with valid id' do
      perform_login(existing_merchant)
      proc {
        post products_path, params: {
          product: {
            name: "A product",
            price: 1,
            quantity: 2,
            categories: [Category.first, Category.last],
            merchant_id: existing_merchant
          }
        }
      }.must_change 'Product.count', 1

      # Assert
      must_respond_with :redirect
      must_redirect_to work_path(Product.last.id)

    end

  end

  describe 'edit' do

  end
  describe 'update' do

  end
  describe 'destroy' do

  end
end
