require ('spec_helper')

describe(Brand) do
  describe('#stores') do
    it('will return the stores that sell a specified brand') do
      test_brand = Brand.create({:name => 'Kennebunkport Kicks'})
      test_store = Store.create({:name => 'Good for your sole Shoes'})
      test_store2 = Store.create({:name => 'Dockside Shoe Emporium'})
      test_brand.stores.push(test_store, test_store2)
      expect(test_brand.stores()).to(eq([test_store, test_store2]))
    end
  end
end
