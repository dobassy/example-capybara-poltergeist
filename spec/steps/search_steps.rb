# frozen_string_literal: true

step "Yahooにアクセスする" do
  Capybara.app_host = "https://www.yahoo.co.jp/"
end

step "トップページを表示する" do
  visit "/"
end

step "タイトルが:textであること" do |text|
  expect(page).to have_content(text)
end
