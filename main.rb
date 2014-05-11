require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

# ROUTES FOR ADMIN SECTION
get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end


post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
# ROUTES FOR ADMIN SECTION
get '/' do
	@products = Item.all
	@array = []
	@array = @products.sample(10)
	erb :main
end

get '/products' do
	@products = Item.all
	erb :products
end

get '/about' do
	erb :about
end

get '/buy/:id' do
	@product = Item.find(params[:id])
	@quantity = @product.quantity
	erb :buy_form
end

get '/buy_quantity/:id' do
	@product = Item.find(params[:id])
	@quantity = params[:quantity].to_i
	if @product.quantity.to_i < @quantity.to_i
		@message = "The amount you want to buy is greater than the amount the store has. We'll restock soon!"
		erb :buy
	else
		@price = @product.price.to_i * @quantity.to_i
		erb :buy_form2
	end
end

post '/buy_done/:id' do
	@price = params[:price]
	@money = MoneyCalculator.new params[:ones], params[:fives], params[:tens], params[:twenties], params[:fifties], params[:hundreds], params[:five_hundreds], params[:thousands]
	@money.change(@price)
	@product = Item.find(params[:id])
	@quantity2 = @product.quantity.to_i
	if @money.lol.to_i < 0
		@message = "Insufficient Funds"
		erb :buy
	else
		@product.update_attributes!(quantity: @quantity2 - params[:quantity].to_i, sold: @product.sold.to_i + params[:quantity].to_i)
		erb :buy
	end
end

