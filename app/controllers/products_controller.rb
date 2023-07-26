class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'   

    ## Product Routes
    get "/products" do
        products = Product.all
        products.to_json
    end

    ## Create
    post '/products' do
        product = Product.create({
            name: params[:name],
            price: params[:price],
            brand_id: params[:brand_id],
            category_id: params[:category_id]
        })
        if product.save
          redirect "/products"
        else
          # Handle errors
        end
    end
end