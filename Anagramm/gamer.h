#ifndef GAMER_H
#define GAMER_H

#include <QWidget>
#include"message.h"

class Message;
class Gamer : public QObject
{
    Q_OBJECT
public:
    explicit Gamer(QObject *parent = nullptr);


signals:
    QString foundName(bool a); // se declenche quand l'utilisateur saisir un nom correct de la liste
    QStringList generateNameCompleted(QStringList init); // se declenche quand la generation de nom à partir du Random choice se termine
    QStringList initCompleted(QStringList init); // se declenche quand l'initialisation de la liste se termine




public slots:
    bool checkForName(const QString &name);
    QStringList randomChoice(); // tire 8nombre au hazard et renvoit les Lettres de l'alphabet correpondante
    void initialise(); // crée la liste de mot de depart
    QStringList generateName(QStringList init); // genere tous les noms possibles à partir des huits lettres et les renvoit sous forme de Liste
    void checkForRandomName(QStringList foundInit); // recupere la liste generee et recupere les nombres appartenant aux dictionnaires et sauvegarde le tout dans m_foundInit
    void mess(QString);

private:
    QStringList m_init;
    QStringList m_foundInit;
    Message *m_msg;
};

#endif // GAMER_H
