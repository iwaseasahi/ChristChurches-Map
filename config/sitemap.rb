require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://www.christchurches-map.com/'
SitemapGenerator::Sitemap.create do
  current_time = Time.now

  ***REMOVED*** トップ画面
  add root_path, lastmod: current_time, changefreq: 'daily', priority: 1.0
  ***REMOVED*** マップ検索
  add maps_search_index_path, priority: 0.9, changefreq: 'daily'

  ***REMOVED*** 動的ページ
  dynamic_page_options = { changefreq: 'weekly', priority: 0.75 }

  ***REMOVED*** Church詳細画面
  Church.find_each do |church|
    add(church_path(church.id), dynamic_page_options.merge(lastmod: church.updated_at))
  end

  ***REMOVED*** Church編集画面
  Church.find_each do |church|
    add(edit_church_path(church.id), dynamic_page_options.merge(lastmod: church.updated_at))
  end

  ***REMOVED*** photoアップロード画面
  Church.find_each do |church|
    add(church_photos_path(church_id: church.id), dynamic_page_options.merge(lastmod: church.updated_at))
  end
end
