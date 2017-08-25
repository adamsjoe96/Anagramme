#include "message.h"

Message::Message() : QObject()
{
      qDebug("Objet cree");
//    connect(this, &Message::messageChanged, this, &Message::mess);
}

/*Status Message::status() const
{
    return m_status;
}*/

void Message::change(bool a)
{
    if(a)
    {
        setStatus(Status::Found);
    }
}


