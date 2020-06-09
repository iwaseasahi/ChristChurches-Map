class Church < ApplicationRecord
  soft_deletable
  has_paper_trail

  belongs_to :group
  belongs_to :prefecture

  has_many   :likes, dependent: :destroy
  has_many   :comments, -> { order(created_at: :desc) }, dependent: :destroy
  has_many   :photos, dependent: :destroy

  validates :name, presence: true
  validates :group, presence: true
  validates :prefecture, presence: true
  validates :address, presence: true

  mount_uploader :top_image, TopImageUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  ***REMOVED*** NOTE: controller で呼び出しているため、decorator にできない
  def info_only_address
    "<h4>***REMOVED***{address}</h4>".html_safe
  end

  ***REMOVED*** NOTE: controller で呼び出しているため、decorator にできない
  def infowindow
    info = "<h4>***REMOVED***{name}</h4>"
    info += "<p>***REMOVED***{group.name}</p>"
    info += "<p>***REMOVED***{address}</p>"
    info += "<p><a href='/churches/***REMOVED***{id}'>詳細はこちら</a></p>"
    info += "<p><a href=***REMOVED***{url} target='_blank'>ホームページはこちら</a></p>" if url.present?
    info.html_safe
  end
end
