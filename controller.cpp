#include "controller.h"
#include <QDebug>

Controller::Controller(QObject *parent)
    : QObject{parent}
{
    qDebug()<<"instancited";
}

void Controller::callme()
{
    static int x = 0;
    qDebug()<<"I am called "<<x<<"\n";
    x++;
}
