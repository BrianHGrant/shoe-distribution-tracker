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

  it('ensures that the value entered for Brand is not an empty string') do
    test_brand = Brand.new({:name => ''})
    expect(test_brand.save()).to(eq(false))
  end

  it('ensures that the value entered for a brand is capitalized') do
    test_brand = Brand.create({:name => 'cupertino clogs'})
    expect(test_brand.name).to(eq("Cupertino Clogs"))
  end

  it('follows title case rules for capitalizing words') do
    test_brand = Brand.create({:name => 'best in the world shoes'})
    expect(test_brand.name).to(eq("Best in the World Shoes"))
  end
end
