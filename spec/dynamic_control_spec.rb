describe "Dynamic Control", :dc do
  before(:each) do
    visit "/dynamic_controls"
  end

  it "quando habilita o campo" do
    #quando tem a proproedade disabled o campo esta desabilitado
    #quando não tem a propriedade disable o campo esta habilitado
    res = page.has_field? "movie", disabled: true
    puts res

    click_button 'Habilita'
    res = page.has_field? "movie", disabled: false
    puts res
  end
end
