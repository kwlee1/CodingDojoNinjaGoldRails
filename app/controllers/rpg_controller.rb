class RpgController < ApplicationController
  def index
    if session[:activities]
      session[:activities] = session[:activities]
    else 
      session[:activities] = []
    end 
    if session[:gold]
      session[:gold] = session[:gold]
    else 
      session[:gold] = 0
    end 
    @gold = session[:gold]
    @activities = session[:activities]
  end

  def farm
    gold = rand(10..20)
    session[:gold] = session[:gold] += gold 
    message = "Earned " + gold.to_s + " gold from the farm!"
    session[:activities] = session[:activities].push({'class':'win', 'message':message})
    redirect_to '/'
  end

  def cave
    gold = rand(5..10)
    session[:gold] = session[:gold] += gold 
    message = "Earned " + gold.to_s + " gold from the cave!"
    session[:activities] = session[:activities].push({'class':'win', 'message':message})
    redirect_to '/'    
  end

  def casino
    gold = rand(-50..50)
    session[:gold] = session[:gold] += gold 
    if gold < 0
      mclass = 'loss' 
      message = "Lost " + (gold * -1).to_s + " gold at the casino..."
    else 
      mclass = 'win'
      message = "Won " + gold.to_s + " gold at the casino!!!"
    end 
    session[:activities] = session[:activities].push({'class':mclass, 'message':message})
    redirect_to '/'
  end

  def house
    gold = rand(2..5)
    session[:gold] = session[:gold] += gold 
    message = "Earned " + gold.to_s + " gold from the house!"
    session[:activities] = session[:activities].push({'class':'win', 'message':message})
    redirect_to '/'
  end
end
