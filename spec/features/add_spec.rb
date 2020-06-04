feature "/add" do
  scenario "see a form to fill in new url and submit" do
    visit "/add"
    fill_in("url", with:"http://amazingweb.com")
    fill_in("title", with:"amazing")
    click_on("Save")
    expect(page).to have_content("http://amazingweb.com")
    expect(page).to have_content("amazing")
  end
end