class PlaylistSweeper < ActionController::Caching::Sweeper
  observe Playlist

  def after_update(playlist)
    expire_action :controller => :playlists, :action => :show, :id => playlist._id, :format => :js
  end
end
