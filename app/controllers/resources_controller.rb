class ResourcesController < ApplicationController
  respond_to :html, :json
  
  # GET /resources
  def index
    respond_with(@resources = Resource.all)
  end

  # GET /resources/1
  def show
    respond_with(@resource = Resource.find(params[:id]))
  end
  
  # GET /resources/new
  def new
    respond_with(@resource = Resource.new)
  end

  # GET /resources/1/edit
  def edit
    respond_with(@resource = Resource.find(params[:id]))
  end

  # POST /resources
  def create
     @resource = Resource.new(params[:resource])
     flash[:success] = 'Resource was successfully created.' if @resource.save
     # @resource.save
     respond_with(@resource) #, :location => resources_url)
  end

  # PUT /resources/1
  def update
    @resource = Resource.find(params[:id])
    flash[:notice] = 'Resource has been updated.' if @resource.update_attributes(params[:resource])
    respond_with(@resource)
  end

  # DELETE /resources/1
  def destroy
    @resource = Resource.find(params[:id])
    flash[:notice] = 'Successfully deleted resource.' if @resource.destroy
    logger.info "Resource Destroyed: #{@resource.destroyed?}"
    logger.info "Persisted after delete: #{@resource.persisted?}"
    respond_with(@resource) #, :location => resources_url)
  end
end
