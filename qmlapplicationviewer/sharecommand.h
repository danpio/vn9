#ifndef SHARECOMMAND_H
#define SHARECOMMAND_H

#include <QObject>

class ShareCommand: public QObject
{
    Q_OBJECT
public:
    explicit ShareCommand(QObject *parent = 0);

signals:

public slots:

    void share(const QString &filename);
};

#endif // SHARECOMMAND_H
