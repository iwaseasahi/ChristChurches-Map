require 'rails_helper'

RSpec.describe Comment, :type => :model do
  ***REMOVED*** pending "add some examples to (or delete) ***REMOVED***{__FILE__}"
  it '有効なファクトリを持つこと' do
    expect(build(:comment)).to be_valid
  end

  it 'コメントが未入力であれば、無効な状態であること' do
    comment = build(:comment, comment: nil)
    comment.valid?
    expect(comment.errors[:comment]).to include('を入力してください')
  end

  it 'ユーザーIDが未入力であれば、無効な状態であること' do
    comment = build(:comment, user_id: nil)
    comment.valid?
    expect(comment.errors[:user_id]).to include('を入力してください')
  end

  it '教会IDが未入力であれば、無効な状態であること' do
    comment = build(:comment, church_id: nil)
    comment.valid?
    expect(comment.errors[:church_id]).to include('を入力してください')
  end

  it 'timeメソッドがnilにならないこと' do
    comment = build(:comment)
    expect(comment.time).not_to eq nil
  end
end
