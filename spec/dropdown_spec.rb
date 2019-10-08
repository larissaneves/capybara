describe 'caixa de opções', :dropdown do

    it 'item especifico simples' do
        visit '/dropdown'
        #select('Opção', from: 'elemento')
        select('Loki', from: 'dropdown')
        sleep 3 #temporario
    end

    it 'item especifico com o find' do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
        sleep 3 #temporario
    end

    it 'qualquer item', :sample do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
        #o metodo all retorna um array de elementos
        #o metodo sample escolhe de forma randomica
    end
end