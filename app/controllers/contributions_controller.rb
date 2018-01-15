class ContributionsController < ApplicationController
    
    def index
        @contributions = Contribution.all.order(created_at: 'desc' )
    end
    
    def show
        @contribution = Contribution.find(params[:id])
    end
    
    def new
        @contribution = Contribution.new
    end
    
    def create
        @contribution = Contribution.new(contribution_params)
        if @contribution.save 
            redirect_to contributions_path
        else
            render 'new'
        end
    end
    
    def edit
        @contribution = Contribution.find(params[:id])
    end
    
    private
        def contribution_params
            params.require(:contribution).permit(:title , :body)
        end
    
end
