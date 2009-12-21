class ThemesController < InheritedResources::Base          
  actions :index, :show
  respond_to :html

    protected

    def collection
      @search = end_of_association_chain.search(params[:search])
      @themes  = @search.paginate(:page => params[:page])
    end    
      
end
