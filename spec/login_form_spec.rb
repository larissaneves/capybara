describe 'login forms' do

    it 'login com sucesso' do
    
        visit '/login'
        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'
        expect(find('#flash').visible?).to be true

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!' #Esse valor contem no texto?

        #expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'  #Existe esse conteudo no elemento?

        #VALOR IDENTICO   ----- eql
        #VALOR CONTEM NA STRING OU CONTEM NO ELEMENTO ---- include ou have_content

    end
    
    it 'senha incorreta' do
    
        visit '/login'
        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarv'
        click_button 'Login'
        expect(find('#flash').visible?).to be true

        expect(find('#flash')).to have_content 'Senha é invalida!'

    end

    it 'usuário não cadastrado' do
    
        visit '/login'
        fill_in 'userId', with: 'hulk'
        fill_in 'password', with: 'hulk'
        click_button 'Login'
        expect(find('#flash').visible?).to be true

        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'

    end

end