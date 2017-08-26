class IconUploader < CarrierWave::Uploader::Base
  after :store, :remove_original_file

  include CarrierWave::RMagick

  storage :fog

  def fog_attributes
    {
      'Content-Type':  'image/jpg',
      'Cache-Control': "max-age=***REMOVED***{1.week.to_i}"
    }
  end

  ***REMOVED*** ~/[バケット名]/[foldername] 配下に画像がアップロード
  def store_dir
    'user_icon'
  end

  ***REMOVED*** def store_dir
  ***REMOVED***   "uploads/***REMOVED***{model.class.to_s.underscore}/***REMOVED***{mounted_as}/***REMOVED***{model.id}"
  ***REMOVED*** end

  ***REMOVED*** 画像がアップロードされていない場合の対応
  ***REMOVED*** public/images/default_icon.jpgを読み込む
  def default_url(*_args)
    ***REMOVED*** For Rails 3.1+ asset pipeline compatibility:
    ***REMOVED*** ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    ***REMOVED*** "/images/fallback/" + [version_name, "default_icon.png"].compact.join('_')
    'default_icon.jpg'
  end

  ***REMOVED*** Process files as they are uploaded:
  ***REMOVED*** process scale: [200, 300]
  ***REMOVED***
  ***REMOVED*** def scale(width, height)
  ***REMOVED***   ***REMOVED*** do something
  ***REMOVED*** end

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
    if original_filename.present?
      "***REMOVED***{model.id}_***REMOVED***{secure_token}.***REMOVED***{file.extension}"
    end
  end

  protected

  def secure_token
    var = :"@***REMOVED***{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
