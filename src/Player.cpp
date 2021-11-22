#include <./include/Player.h>

Player::Player(){};
Player::~Player(){};

void Player::initialize()
{
	cout << "Player initialize" << endl;
	if (!tex.loadFromFile("./images/player.png"))
	{
		cout << "Problem Loading Texture!" << endl;
	}
	body.setTexture(tex);
	body.setPosition(sf::Vector2f(200,400));
}
void Player::update()
{
	if (sf::Keyboard::isKeyPressed(sf::Keyboard::D))
	{
		body.move(sf::Vector2f(10,0));
	}
	if (sf::Keyboard::isKeyPressed(sf::Keyboard::A))
	{
		body.move(sf::Vector2f(-10,0));
	}
}
void Player::draw(sf::RenderWindow* t_window)
{
	t_window->draw(body);
}