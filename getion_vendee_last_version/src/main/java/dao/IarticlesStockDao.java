package dao;

import java.util.Map;

public interface IarticlesStockDao 
{
	public Map<Integer, Integer> getQn();
	public void updateArtQtn(int id,int qtn);
    
}
