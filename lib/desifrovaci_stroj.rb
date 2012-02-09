class DesifrovaciStroj

  def initialize(klic)
    @klic = klic
  end
  
  def desifruj(zprava)
    desifrovana_zprava = ""        
    zprava.each_line do |radek|    
      radek.each_byte do |a| 
        if(a==10)then    # 10 je dec. hodnota pro '\n'
          desifrovana_zprava +="\n"
        else
          x=a+@klic
          desifrovana_zprava += x.chr
          #print "#{x.chr}"
        end     
      end
    end   
  
    return desifrovana_zprava
  end
  
end
