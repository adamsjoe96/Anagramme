#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>

class Message: public QObject
{
    Q_OBJECT
    Q_PROPERTY(Status status READ status WRITE setStatus NOTIFY statusChanged)
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)
    public:
        explicit Message();
        enum Status {
            NotFound,
            Found
        };
        Q_ENUM(Status)
       Status status() const
        {
            return m_status;
        }
        QString message() const
        {
            return m_msg;
        }
        void setMessage(QString message)
        {
            m_msg = message;
            qDebug("ici set message");
            emit messageChanged(message);
            qDebug("emission reussi");
        }

        Q_INVOKABLE void affiche()
        {
            qDebug("j'affiche ici");
        }

        void setStatus(Status status)
        {
            m_status = status;
            emit statusChanged(status);
        }        

    signals:
        void statusChanged(Status);
        void messageChanged(QString);
    public slots:
        void change(bool a);
//        void mess(QString);

public:
        Status m_status;
        QString m_msg;

};

#endif // MESSAGE_H
