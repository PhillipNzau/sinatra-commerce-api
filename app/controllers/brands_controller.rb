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

      ## Update (Partial Update) for Brands
  put '/brands/:id' do
    @brand = Brand.find(params[:id])

    if @brand.update(partial_brand_params)
      redirect '/brands'
    else
      # Handle errors
      # For example, you can render a JSON response with an error message
      status 400
      { error: 'Failed to update brand' }.to_json
    end
  end

  private

  # Method to permit only the selected fields for update
  def partial_brand_params
    params.slice(:name, :description)
  end

end