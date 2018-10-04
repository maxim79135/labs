#ifndef GAME_H
#define GAME_H

#include <QtWidgets>

#define MIN_VALUE 0
#define MAX_VALUE 255
#define EPIC_BIG_VALUE 500

class Game
{    
public:
    Game();

    enum ChekerType {
        CT_NO_ONE = 0,
        CT_RED = 1,
        CT_BLUE = 2
    };

    void setPlayMode(ChekerType gameMode) { gamemode = gameMode; }
    ChekerType getPlayMode() { return gamemode; }

    void setActive(bool active) { this->active = active; }
    void setAILevel(int AILevel) { this->AILevel = AILevel; }
    bool isActive() { return active; }

    int getMonsterCount() { return 18; }

    void resset(); //start, restart game

   QPoint& getRabbitPosition(int chekerIndex) { return reds[chekerIndex]; }
   QPoint& getWolfPosition(int chekerIndex)
    {
        Q_ASSERT(chekerIndex < 10 && chekerIndex >= 0);
        return blues[chekerIndex];
    }

    QPoint& getMonsterPosition(int chekerIndex)
    {
        if (chekerIndex < 9)
            return getRabbitPosition(chekerIndex);
        else
            return getWolfPosition(chekerIndex - 9);
    }

    ChekerType getChekerType(int chekerIndex)
    {
        if (chekerIndex < 9)
            return CT_RED;
        else
            return CT_BLUE;
    }    
    int isChekerTurn() { return chekerTurn; }

    int getChekerIndexPosition(const QPoint &pos);
    int getSelectedChekerIndex() { return selectedCheker; }
    void setSelectedChekerIndex(int chekerindex) { selectedCheker = chekerindex; }
    bool canMoveToPosition(int chekerIndex, const QPoint &pos);

private:
    static const int NOT_INITIALIZED = 255;

    static const int EMPTY = 0;
    static const int RED = 1;
    static const int BLUE = 255;

    QPoint blues[9]; //blues cheker (3x3)
    QPoint reds[9];  //red cheker (3x3)
    ChekerType gamemode; // state radiobutton(chose color)
    bool active; //state game
    bool chekerTurn;
    int AILevel;
    int selectedCheker;

    int map[8][8]; // main array

    void initialize();
};

#endif // GAME_H
