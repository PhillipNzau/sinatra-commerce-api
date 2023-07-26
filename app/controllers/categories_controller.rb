class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'   

    ## Categories Routes
    get "/categories" do
        categories = Category.all
        categories.to_json
        # categories.to_json(include: [:categories, :suppliers, :purchases])
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
end