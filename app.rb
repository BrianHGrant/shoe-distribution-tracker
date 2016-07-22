require('bundler/setup')
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

post('/stores') do
  store_name = params.fetch('store_name')
  Store.create({:name => store_name})
  redirect('/stores')
end

get('/stores/:id') do
  @brands = Brand.all()
  @store = Store.find(params.fetch('id').to_i)
  erb(:store)
end

patch('/stores/:id/edit') do
  name = params.fetch('new_store_name')
  store = Store.find(params.fetch('id').to_i)
  store.update({:name => name})
  redirect('/stores/'.concat(store.id.to_s))
end

delete('/stores/:id') do
  store = Store.find(params.fetch('id').to_i)
  store.delete()
  redirect('/stores')
end

post('/stores/:id/add_brand') do
  store = Store.find(params.fetch("id").to_i)
  brand_id = params.fetch("brand_select").to_i
  store.brands.push(Brand.find(brand_id))
  redirect('/stores/'.concat(store.id.to_s))
end

delete('/stores/:id/remove_brand') do
  store = Store.find(params.fetch("id").to_i)
  brand_id = params.fetch("brand_remove").to_i
  store.brands.destroy(Brand.find(brand_id))
  redirect('/stores/'.concat(store.id.to_s))
end

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

post('/brands') do
  brand_name = params.fetch('brand_name')
  Brand.create({:name => brand_name})
  redirect('/brands')
end
