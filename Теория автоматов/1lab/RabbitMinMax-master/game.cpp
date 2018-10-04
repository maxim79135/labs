#include "game.h"
#include "qmath.h"

Game::Game() : active(false), selectedCheker(-1)
{

    initialize();
}

void Game::resset()
{
    active = true;
    initialize();

    if (gamemode != CT_RED) {

    }
    chekerTurn = true;
}

int Game::getChekerIndexPosition(const QPoint &pos)
{
    for (int i = 0; i < 9; i++) if (reds[i] == pos) return i + 1;
    for (int i = 0; i < 9; i++) if (blues[i] == pos) return i + 9;
    return -1;
}

void Game::initialize()
{
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            this->blues[i * 3 + j] = QPoint(i, j);

    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            this->reds[i * 3 + j] = QPoint(i + 5, j + 5);
}

bool Game::canMoveToPosition(int chekerIndex, const QPoint &pos) {
    Q_ASSERT(chekerIndex >= 0 || chekerIndex <= 18);


}
