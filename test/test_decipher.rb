require 'test/unit'
require_relative '../lib/desifrovaci_stroj'

class TestDesifrovaciStroj < Test::Unit::TestCase
  
  def setup
    #definování spoleèných prostøedkù
    @klic = -7
    @enigma = DesifrovaciStroj.new(@klic)
  end
  
  def teardown
    # zde by bylo uvolòování spoleèných prostøedkù
  end
  
  def test_desifrovaci_stroj_vytvoreni
    stroj = DesifrovaciStroj.new(@klic)
    refute_nil(stroj, "Objekt stroj ze tridy DesifrovaciStroj by mel byt vytvoren.")
  end

  def test_desifruj_zadani
    zadani = "1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5\n1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5\n1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5"
    ocekavany = "*CDC is the trademark of the Control Data Corporation.\n*IBM is a trademark of the International Business Machine Corporation.\n*DEC is the trademark of the Digital Equipment Corporation."
    assert_equal(ocekavany,@enigma.desifruj(zadani))
  end
  
  def test_desifruj_vlastni
    zadani = "Qh'qzlt'Lupnth((("
    ocekavany = "Ja jsem Enigma!!!"  
    assert_equal(ocekavany,@enigma.desifruj(zadani))   
  end
  
  def test_desifruj_cisla
    zadani = "1234567890"
    ocekavany = "*+,-./012)"
    assert_equal(ocekavany,@enigma.desifruj(zadani))   
  end
  
  def test_desifruj_tisknutelne_znaky
    cnt = 32
    while(cnt<128)do
       zadani = "#{cnt.chr}"
       x = cnt+@klic
       ocekavany = "#{x.chr}"
       assert_equal(ocekavany,@enigma.desifruj(zadani))
       cnt +=1
    end
  end
  
end