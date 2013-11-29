class AjaxController < ApplicationController
  def artists
    @artists = Artist.paginate(:page => params[:page], :per_page => 12)

    @artists.each do |artist|
      if artist.avatar.url != 'missing_avatar.gif'
        artist.avatar_file_name = artist.avatar.url
      else
        artist.avatar_file_name = '/assets/missing_avatar.gif'
      end
    end

    respond_to do |format|
      format.json { render json: [@artists, @artists.total_entries] }
    end
  end

end
