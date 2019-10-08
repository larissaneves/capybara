describe  'Select2', :select2 do

    describe('singular', :single) do
        before(:each) do
            visit '/apps/select2/single.html'
        end

        it 'seleciona ator por nome' do
            find('.select2-selection--single').click
            sleep 1
            find('.select2-results__option', text: 'Adam Sandler').click
            sleep 2
        end

        it 'busca e clica no ator' do
            find('.select2-selection--single').click
            sleep 1
            find('.select2-search__field').set 'Chris Rock'
            sleep 1
            find('.select2-results__option').click
            sleep 2
        end

    end

    describe('multiple', :mult) do
        before(:each) do
            visit '/apps/select2/multi.html'
        end

        def seleciona(ator)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end

        it 'seleciona atores' do

            atores = ['Jim Carrey', 'Owen Wilson', 'Kevin James']

            atores.each do |a|
                seleciona(a)
            end
            sleep 1
        end

    end
end