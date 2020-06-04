feature "/add" do
  scenario "see a form to fill in new url and submit" do
    visit "/add"
    fill_in("url", with:"http://amazingweb.com")
    click_on("Save")
    expect(page).to have_content("http://amazingweb.com")
  end
end