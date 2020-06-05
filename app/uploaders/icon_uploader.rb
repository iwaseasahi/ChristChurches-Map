class IconUploader < CarrierWave::Uploader::Base
  after :store, :remove_original_file

  include CarrierWave::RMagick

  storage Settings.uploader.storage.to_sym

  ***REMOVED*** ~/[バケット名]/[foldername] 配下に画像がアップロード
  def store_dir
    'user_icon'
  end

  ***REMOVED*** 画像がアップロードされていない場合
  def default_url(*_args)
    ActionController::Base.helpers.asset_path('default_icon.jpg')
  end

  ***REMOVED*** Create different versions of your uploaded files:
  version :thumb do
    process :crop
    process resize_to_fit: [100, 100]
  end

  def crop
    manipulate! do |img|
      ***REMOVED*** 中央から切り取り
      gravity = Magick::CenterGravity
      crop_w = img.columns
      crop_h = img.rows
      ***REMOVED*** 画像のサイズが縦横違った場合は小さい方に合わせてトリミング
      if img.rows <= img.columns
        crop_w = img.rows
      else
        crop_h = img.columns
      end
      img.crop!(gravity, crop_w, crop_h)
      img = yield(img) if block_given?
      img
    end
  end

  ***REMOVED*** 元画像の削除
  def remove_original_file(_original_file)
    return if version_name.present?

    file.delete if file.exists?
  end

  ***REMOVED*** アップロード可能な形式
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  ***REMOVED*** アップロード時のファイル名を指定
  def filename
    "***REMOVED***{model.id}_***REMOVED***{secure_token}.***REMOVED***{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@***REMOVED***{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
