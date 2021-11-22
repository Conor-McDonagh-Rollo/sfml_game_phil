#include <./include/NPC.h>

NPC::NPC(){};
NPC::~NPC(){};

void NPC::initialize()
{
	cout << "NPC initialize" << endl;
	if (!tex.loadFromFile("./images/npc.png"))
	{
		cout << "Problem Loading Texture!" << endl;
	}
	body.setTexture(tex);
	body.setPosition(sf::Vector2f(400,400));
}
void NPC::update()
{
}
void NPC::draw(sf::RenderWindow* t_window)
{
	t_window->draw(body);
}