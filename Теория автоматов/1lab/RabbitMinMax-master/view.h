#ifndef VIEW_H
#define VIEW_H

#include <QtWidgets>
#include "game.h"


namespace Ui {
class View;
}

class View : public QMainWindow
{
    Q_OBJECT

public:
    explicit View(QWidget *parent = 0);
    ~View();

    void setGame(Game* game);

private:
    Ui::View *ui;
    Game* game;
    QPoint mousePosition;
    QPoint realMousePosition;

protected:
    void paintEvent(QPaintEvent *event);
private slots:
    void on_pbPlay_clicked();

    // QWidget interface
protected:
    void mousePressEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
};

#endif // VIEW_H
