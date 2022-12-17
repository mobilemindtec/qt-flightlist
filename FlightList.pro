QT += \
    quick \
    quickcontrols2 \
    network \
    core5compat

CONFIG += qmltypes
QML_IMPORT_NAME = FlightList
QML_IMPORT_MAJOR_VERSION = 1.0

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        canvascustom.cpp \
        main.cpp

RESOURCES += qml.qrc

TRANSLATIONS +=

CONFIG += lrelease
# CONFIG += embed_translations

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH += \
#    /home/ricardo/sources/qt/build-QtQuick2FirebasePlugin-Android_Qt_5_15_2_Clang_Multi_Abi-Debug/imports

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#https://doc.qt.io/qt-5/deployment-android.html
android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

    DISTFILES += \
    DISTFILES += \
         android/build.gradle \
         android/gradle/wrapper/gradle-wrapper.properties \
         android/gradle.properties \
         android/google-services.json \
         android/AndroidManifest.xml
}

HEADERS += \
    canvascustom.h
