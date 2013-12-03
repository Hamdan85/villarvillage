class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.json

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
    @artist = Artist.find(params[:artist_id])
    @albums = @artist.albums.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new
    @artist = Artist.find(params[:artist_id])

    puts @artist.name

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.build(params[:album])

    respond_to do |format|
      if @album.save
        format.html { redirect_to artist_path(@artist), notice: 'Album was successfully created.' }
        format.json { render json: artist_path(@artist), status: :created, location: artist_albums_path(@artist) }
      else
        format.html { render action: "new" }
        format.json { render json: artist_albums_path(@artist).errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to artist_path(@artist), notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to artist_albums_path(@artist) }
      format.json { head :no_content }
    end
  end
end
