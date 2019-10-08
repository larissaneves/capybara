describe 'caixas de seleção', :checkbox do

    before(:each) do
        visit '/checkboxes'
    end
    
    it 'marcando uma opção' do
        #check atrave do id
        check('thor')
    end

    it 'desmarcando uma opção' do
        #uncheck atraves do name
        uncheck('antman')
    end

    it 'marcando com find set true' do
        #umarcando sando o value
        find('input[value=cap]').set(true)
    end

    it 'desmarcando com find set false' do
        #desmarcando usando o value
        find('input[value=guardians]').set(false)
    end

    after(:each) do
        sleep 3
    end

end