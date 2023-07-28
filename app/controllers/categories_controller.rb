class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'   

    ## Categories Routes
    get "/categories" do
        categories = Category.all
        categories.to_json
        # categories.to_json(include: [:categories, :suppliers, :purchases])
    end

     ## Selected Brands Routes
     get "/categories/:id" do
      category = Category.find_by(id: params[:id])
      category
      .to_json
    end

    post '/categories' do
        category = Category.create({
            name: params[:name],
            description: params[:description]
        })
        if category.save
          redirect "/categories"
        else
          # Handle errors
        end
    end

    delete '/categories/:id' do
      category = Category.find_by(id: params[:id])
      category.destroy
    end
end