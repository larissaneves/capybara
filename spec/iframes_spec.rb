describe 'Iframes' do

    describe 'Bom', :nice_iframe do
       
        before(:each) do
            visit '/nice_iframe'
        end

        it 'adicionar ao carrinho' do
            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click

                expect(find('#cart')).to have_content 'R$ 4,50'
            end
        end
    end

    describe 'Ruim', :bad_iframe do
       
        before(:each) do
            visit '/bad_iframe'
        end

        it 'carrinho deve estar vazio' do

            script = '$(".box-iframe").attr("id", "tempId");' # script para adicionar id #script de jquery como string
            page.execute_script(script);

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end
        end
    end

end