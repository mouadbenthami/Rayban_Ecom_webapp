package dao;

import entities.Users;

public interface IusersDao 
{
	public void addUsers(Users u);
    public void deleteUsers(int id);
    public void updateUsers(Users u);
	public Users getUsers(String login);
	Users getUsersbyId(int id);
}
