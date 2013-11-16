class NewlatestsController < ApplicationController
  # GET /newlatests
  # GET /newlatests.json

  before_filter(:except => [:index,:show]) do
    if current_user.nil?
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end
  end

  def index
    #get the latest 5 news with more recent above

    @newlatests = Newlatest.order('created_at DESC').limit(5)

    #Show only the first 30 words of each post.

    @newlatests.each do |content|
      content.content = content.content.split(" ").first(30).join(" ")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @newlatests }
    end
  end

  # GET /newlatests/1
  # GET /newlatests/1.json
  def show
    @newlatest = Newlatest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @newlatest }
    end
  end

  # GET /newlatests/new
  # GET /newlatests/new.json
  def new
    @newlatest = Newlatest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newlatest }
    end
  end

  # GET /newlatests/1/edit
  def edit
    @newlatest = Newlatest.find(params[:id])
  end

  # POST /newlatests
  # POST /newlatests.json
  def create
    @newlatest = Newlatest.new(params[:newlatest])

    respond_to do |format|
      if @newlatest.save
        format.html { redirect_to @newlatest, notice: 'Newlatest was successfully created.' }
        format.json { render json: @newlatest, status: :created, location: @newlatest }
      else
        format.html { render action: "new" }
        format.json { render json: @newlatest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /newlatests/1
  # PUT /newlatests/1.json
  def update
    @newlatest = Newlatest.find(params[:id])

    respond_to do |format|
      if @newlatest.update_attributes(params[:newlatest])
        format.html { redirect_to @newlatest, notice: 'Newlatest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @newlatest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newlatests/1
  # DELETE /newlatests/1.json
  def destroy
    @newlatest = Newlatest.find(params[:id])
    @newlatest.destroy

    respond_to do |format|
      format.html { redirect_to newlatests_url }
      format.json { head :no_content }
    end
  end
end
