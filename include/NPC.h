#ifndef NPC_H
#define NPC_H

#include <iostream>
#include <./include/Character.h>

using namespace std;

class NPC : public Character
{
public:
	NPC();
	~NPC();
	void initialize();
	void update();
	void draw(sf::RenderWindow* t_window);
};
#endif