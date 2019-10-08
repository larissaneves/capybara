describe 'Login com cadastro', :login3 do

    before(:each) do
        visit '/access'

    end

    it 'login com sucesso' do

        ### trabalhando com escopo

        # login_form = find('#login')  #Encontra o pai
    
        # login_form.find('input[name=username]').set 'stark'  #trabalhando com escopo
        # login_form.find('input[name=password]').set 'jarvis!'

        # click_button 'Entrar'

        ###
        
        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'

            click_button 'Entrar'
        end  

        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'  

    end

    it 'cadastro com sucesso' do
        
        within('#signup') do
            find('input[name=username]').set 'larissa'
            find('input[name=password]').set '123456'

            click_link 'Criar Conta'
        end  

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'  

    end

end