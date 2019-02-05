class SongsController < ApplicationController

	def index
		@songs = Song.all
	end	
	
	def show
		@song = Song.find(params[:id])
	end

	def edit
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])
		@song.update(song_params)
		if @song.save
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
		if @song.save
			redirect_to song_path(@song)
		else
			render :new
		end
	end

	def destroy
				# byebug

		@song = Song.find(params[:id])
		@song.delete

  		redirect_to songs_path, notice: "Delete success"
	end

	private

	def song_params
		params.require(:song).permit(:title, :genre, :artist_name, :release_year, :released)
	end
end