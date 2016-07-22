require ('spec_helper')

describe(Store) do
  describe('#brands') do
    it('will return the stores that sell a specified brand') do
      test_store = Store.create({:name => 'Good for your sole Shoes'})
      test_brand = Brand.create({:name => 'Kennebunkport Kicks'})
      test_brand2 = Brand.create({:name => 'Siddartha Sandels'})
      test_store.brands.push(test_brand, test_brand2)
      expect(test_store.brands()).to(eq([test_brand, test_brand2]))
    end
  end

  it('ensures that the value entered for Brand is not an empty string') do
    test_store = Store.new({:name => ''})
    expect(test_store.save()).to(eq(false))
  end
end
