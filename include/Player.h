#ifndef PLAYER_H
#define PLAYER_H

#include <iostream>
#include <./include/Character.h>

using namespace std;

class Player : public Character
{
public:
	Player();
	~Player();
	void initialize();
	void update();
	void draw(sf::RenderWindow* t_window);
};
#endif