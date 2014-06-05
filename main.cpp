//#include"cdownloadfile.h"
#include <QtGui/QApplication>
#include <QtOpenGL/QGLWidget>
#include <QObject>

#include <QtDeclarative>
#include <QDeclarativeView>
#include "qmlapplicationviewer.h"
#include "sharecommand.h"


Q_DECL_EXPORT int main(int argc, char *argv[])
{


    QScopedPointer<QApplication> app(createApplication(argc, argv));

   QmlApplicationViewer viewer;

   CDownLoadFile data;

   qmlRegisterType<ShareCommand>("ShareCommand", 1, 0, "ShareCommand");


   viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
   viewer.rootContext()->setContextProperty("ApplicationData", &data);

   viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
   viewer.setMainQmlFile(QLatin1String("qml/vn9/main.qml"));
   viewer.showExpanded();


QDeclarativeView window;


     window.setAttribute(Qt::WA_OpaquePaintEvent);
     window.setAttribute(Qt::WA_NoSystemBackground);
     window.viewport()->setAttribute(Qt::WA_OpaquePaintEvent);
     window.viewport()->setAttribute(Qt::WA_NoSystemBackground);






    return app->exec();


}

