require 'rails_helper'

describe Contact do

  # 名前があれば有効
  it "is valid with name" do
    contact = Contact.new(name: "後藤", email: "goto@gmail.com", content: "肉が食べたいです。")
    expect(contact).to be_valid
  end

  # メールアドレスがあれば有効
  it "is valid with email" do
    contact = Contact.new(name: "後藤", email: "goto@gmail.com", content: "肉が食べたいです。")
    expect(contact).to be_valid
  end

  # 内容があれば有効
  it "is valid with content" do
    contact = Contact.new(name: "後藤", email: "goto@gmail.com", content: "肉が食べたいです。")
    expect(contact).to be_valid
  end

  # 名前が無ければ無効
  it "is invalid without a name" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  # メールアドレスが無ければ無効
  it "is invalid without a email" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  # 内容が無ければ無効
  it "is invalid without a content" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  # 名前が無ければ無効
  it "is valid with name" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
  end

  # メールアドレスが無ければ無効
  it "is valid with email" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end

  # 内容が無ければ無効
  it "is valid with content" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:content]).to include("を入力してください")
  end


end
