TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# show qml files in qtcreator' tree
OTHER_FILES += $$files("*.qml", true)

# Default rules for deployment.
include(deployment.pri)
