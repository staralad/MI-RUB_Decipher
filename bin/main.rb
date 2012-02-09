require_relative '../lib/desifrovaci_stroj'

KLIC = -7

#načíst celou zprávu do řetězce
sifrovana_zprava = ""
while radek = gets  do
 sifrovana_zprava += radek
end

enigma = DesifrovaciStroj.new(KLIC) #vytvořit enigmu s klíčem
print enigma.desifruj(sifrovana_zprava)  # spustit
