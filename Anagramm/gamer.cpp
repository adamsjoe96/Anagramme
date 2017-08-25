#include "gamer.h"
#include<chrono>
#include<vector>
#include<algorithm>
#include<QFile>
#include<QTextStream>
#include<QMessageBox>

Gamer::Gamer(QObject *parent) : QObject(parent)
{
    Q_UNUSED(parent);
    m_msg = new Message;
    m_msg->change(true);
    m_init = QStringList();
    m_foundInit = QStringList();
//    QMetaObject::invokeMethod(scan, "display", Q_RETURN_ARG(null, null),Q_ARG(null, null));
    connect(this, &Gamer::foundName, m_msg, &Message::change);
    connect(m_msg, &Message::messageChanged, this, &Gamer::checkForName);
    connect(m_msg, SIGNAL(messageChanged(QString)), this, SLOT(mess(QString)));
}

void Gamer::initialise()
{
    QFile *file = new QFile("../Anagramme/dictionnaire.txt");
    if(file->open(QIODevice::ReadOnly | QIODevice::Text))
    {
        QTextStream out(file);
        while(!out.atEnd())
        {
            m_init += out.readLine();
        }
        m_foundInit=m_init;
        emit initCompleted(m_init);
    }
//    else
//        QMessageBox::information(this,tr("Fichier introuvable"), tr("le Fichier n'a pas pu etre ouvert"));
}

QStringList Gamer::randomChoice()
{
    std::default_random_engine engin { std::time(nullptr) };
    std::mt19937 mt(engin());
    std::uniform_int_distribution<unsigned int> number(0, 25);
    QStringList alphabet =  {"a","b","c","d","e","f","g","h","i","j","k","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
    QStringList choice{};
    for(int i = 0; i<8; i++)
    {
        int v = number(mt);
        choice.append(alphabet[v]);
    }
    return choice;
}

QStringList Gamer::generateName(QStringList init)
{
    QStringList permut{};
    do {
       permut.append(init);
      } while ( std::next_permutation(init.begin(),init.end()) );
    emit generateNameCompleted(permut);
    return permut;
}

void Gamer::checkForRandomName(QStringList foundInit)
{
    for(int i = 0; i<foundInit.size(); i++)
    {
        if(m_init.contains(foundInit.at(i), Qt::CaseInsensitive))
            m_foundInit.append(foundInit.at(i));
    }
}

bool Gamer::checkForName(const QString &name)
{
    if(m_foundInit.contains(name, Qt::CaseInsensitive))
    {
        qDebug("trouve");
         emit foundName(true);
         return true;
    }
    else
    {
        qDebug("pas trouve");
        emit foundName(true);
        return false;
    }

}

void Gamer::mess(QString)
{
    qDebug("je suis slot de emit");
}
