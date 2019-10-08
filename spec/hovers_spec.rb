describe 'Mouse Hover', :hovers do

    before(:each) do
        visit '/hovers'
    end

    it 'quando passo o mouse sobre o blade' do
        #card = find('img[alt=Blade]')
        card = find('img[alt*=Blade]') #tecnica de expressaõ regular para buscar elementos (*=) - contem ...
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'quando passo o mouse sobre o pantera negra' do
        #card = find('img[alt="Pantera Negra"]')
        card = find('img[alt^=Pantera]') #tecnica de expressaõ regular para buscar elementos (^=) - começa com ...
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end

    it 'quando passo o mouse sobre o homem aranha' do
        #card = find('img[alt="Homem Aranha"]')
        card = find('img[alt$=Aranha]') #tecnica de expressaõ regular para buscar elementos ($=) - termina com ...
        card.hover

        expect(page).to have_content 'Nome: Homem Aranha'
    end

    after(:each) do
        sleep 0.5 #so para verificar visualmente o resultado
    end
end