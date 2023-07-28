class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'   

    ## Brands Routes
    get "/brands" do
        brands = Brand.all
        brands.to_json
    end

     ## Selected Brands Routes
     get "/brands/:id" do
      brand = Brand.find_by(id: params[:id])
      brand.to_json
    end

    post '/brands' do
        brand = Brand.create({
            name: params[:name],
            description: params[:description]
        })
        if brand.save
          redirect "/brands"
        else
          # Handle errors
        end
    end

end