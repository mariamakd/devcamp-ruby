class PortfoliosController < ApplicationController
	def index
		@portfolio_items=Portfolio.all
	end	

	def new
		@portfolio_item = Portfolio.new
	end	

	def create
		@portfolio_item = Portfolio.new(portfolio_params)
		 respond_to do |format|
		      if @portfolio_item.save
		        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully created.' }
		        format.json { render :show, status: :created, location: @portfolio_item }
		      end
		    end
		end	

	# Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end

end
