package dao;

import java.util.List;
import entities.Commandes;

public interface IcommandesDao 
{
       public int addCmd( Commandes cmd);
       public List<Commandes>  getCommandesByClient(String Client);
       public void updateName(String currentName, String newName);
}
