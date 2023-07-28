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


      ## Update (Partial Update) for Brands
  put '/categories/:id' do
    @category = Category.find(params[:id])

    if @category.update(partial_category_params)
      redirect '/categories'
    else
      # Handle errors
      # For example, you can render a JSON response with an error message
      status 400
      { error: 'Failed to update category' }.to_json
    end
  end

  private

  # Method to permit only the selected fields for update
  def partial_category_params
    params.slice(:name, :description)
  end
end