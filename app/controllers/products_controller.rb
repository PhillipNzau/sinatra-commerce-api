class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'   

    ## Product all Routes
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

    ## selected
    get '/products/:id' do
      product = Product.find(params[:id])

      sel_prod = [
        product: product,
        brand: product.brand,
        category: product.category
      ]
      # product.to_json
      sel_prod.to_json
    end

    ## Delete
    delete '/products/:id' do
      product = Product.find_by(id: params[:id])
      product.destroy
      redirect '/products'

    end

    ## patch 
    patch '/products/:id' do
      product = Product.find_by(id: params[:id])
      
      product = Product.update({
        name: params[:name],
        price: params[:price],
        description: params[:description],
        img: params[:img],
        brand: params[:brand],
        category: params[:category]
      })

        redirect '/products/#{params[:id]}'
      
    end
end