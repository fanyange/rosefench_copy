FactoryGirl.define do
  # factory 方法的 :user 参数说明，块中的代码定义了一个 User 模型对象。
  factory :user do
    name "Tom"
    email "example@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end