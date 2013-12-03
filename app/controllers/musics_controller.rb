class MusicsController < ApplicationController
  # GET /musics
  # GET /musics.json

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
    @album = @artist.albums.find(params[:album_id])
    @musics = @album.musics.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @musics }
    end
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:album_id])
    @music = @album.musics.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @music }
    end
  end

  # GET /musics/new
  # GET /musics/new.json
  def new
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:album_id])
    @music = @album.musics.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @music }
    end
  end

  # GET /musics/1/edit
  def edit
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:album_id])
    @music = @album.musics.find(params[:id])
  end

  # POST /musics
  # POST /musics.json
  def create
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:album_id])
    @music = @album.musics.build(params[:music])

    respond_to do |format|
      if @music.save
        format.html { redirect_to artist_album_path(@artist,@album), notice: 'Music was successfully created.' }
        format.json { render json: artist_album_path(@artist,@album), status: :created, location: artist_album_music_path(@artist,@album,@music) }
      else
        format.html { render action: "new" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /musics/1
  # PUT /musics/1.json
  def update
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:album_id])
    @music = @album.musics.find(params[:id])

    respond_to do |format|
      if @music.update_attributes(params[:music])
        format.html { redirect_to artist_album_music_path(@artist,@album,@music), notice: 'Music was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:album_id])
    @music = @album.musics.find(params[:id])
    @music.destroy

    respond_to do |format|
      format.html { redirect_to artist_album_musics_path(@artist,@album) }
      format.json { head :no_content }
    end
  end
end
