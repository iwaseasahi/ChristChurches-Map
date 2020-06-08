class Churches::PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_church
  before_action :set_photo, only: :destroy

  def index
    @photo = Photo.new(sort_of_number: @church.photos.count + 1)
  end

  def create
    @photo = Photo.new(church_id: @church.id, file_name: photo_params[:file_name], sort_of_number: photo_params[:sort_of_number])

    if @photo.save
      redirect_to church_photos_path(church_id: @church.id), notice: 'アップロードが完了しました。'
    else
      redirect_to church_photos_path(church_id: @church.id), alert: '登録できませんでした。'
    end
  end

  def destroy
    @photo.destroy

    redirect_to church_photos_path(church_id: @church.id), alert: '削除しました。'
  end

  private

  def set_church
    @church = Church.find(params[:church_id])
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:file_name, :sort_of_number)
  end
end