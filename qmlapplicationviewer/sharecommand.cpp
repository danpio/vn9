#include "sharecommand.h"

#include <QString>
#include <QDebug>
#include <MDataUri>
#include <maemo-meegotouch-interfaces/shareuiinterface.h>

ShareCommand::ShareCommand(QObject *parent) : QObject(parent) { }

void ShareCommand::share (const QString &filename) {

    QString link = "filename";

    QString title = "Vine Video file";

    QString desc = "Share Vine form Nokia N9 Vn9 client";

    /*
    qDebug() << "Make data URI from"
             << link << title << desc;
*/

    MDataUri duri;

    duri.setMimeType ("text/x-url");

    duri.setTextData (filename);

    duri.setAttribute ("title", title);

    duri.setAttribute ("description", desc);

    if (duri.isValid() == false) {

        qCritical() << "Invalid URI";

        return;
    }

    QStringList items;

    items << duri.toString();

    //qDebug() << "URI:" << items.join (" ");

    // Create a interface object
    ShareUiInterface shareIf("com.nokia.ShareUi");

    // Check if interface is valid
    if (shareIf.isValid()) {

        // Start ShareUI application with selected files.

        //qDebug() << "Signalling share-ui daemon...";

        shareIf.share (items);

    } else {

        qCritical() << "Invalid interface";

        return;
    }
}
