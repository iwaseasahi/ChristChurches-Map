***REMOVED*** frozen_string_literal: true

module ChurchDecorator
  def display_tel
    tel ? tel : '未設定'
  end

  def display_email
    email ? "<a href='mailto:***REMOVED***{email}'>メールはこちら</a>".html_safe : '未設定'
  end

  def display_url
    url ? "<a href=***REMOVED***{url} target='_blank'>ホームページはこちら</a>".html_safe : '未設定'
  end
end
