#include <QApplication>
#include <menuview.h>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MenuView menu_view;
    menu_view.show();

    return a.exec();
}
