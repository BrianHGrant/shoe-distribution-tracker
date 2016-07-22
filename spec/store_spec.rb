require ('spec_helper')

describe(Store) do
  describe('#brands') do
    it('will return the brands sold by a specific store') do
      test_store = Store.create({:name => 'Good for your sole Shoes'})
      test_brand = Brand.create({:name => 'Kennebunkport Kicks'})
      test_brand2 = Brand.create({:name => 'Siddartha Sandels'})
      test_store.brands.push(test_brand, test_brand2)
      expect(test_store.brands()).to(eq([test_brand, test_brand2]))
    end
  end

  it('ensures that the value entered for Store is not an empty string') do
    test_store = Store.new({:name => ''})
    expect(test_store.save()).to(eq(false))
  end

  it('ensures that the value entered for a store is capitalized') do
    test_store = Store.create({:name => 'portland peds'})
    expect(test_store.name).to(eq("Portland Peds"))
  end

  it('follows title case rules for capitalizing words') do
    test_store = Store.create({:name => 'best in the world shoes'})
    expect(test_store.name).to(eq("Best in the World Shoes"))
  end
end
