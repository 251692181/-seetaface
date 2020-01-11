QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h \
    qtomat.h

FORMS += \
    mainwindow.ui

INCLUDEPATH += D:/迅雷下载/cmake-3.16.2-win32-x86/bin/butt
INCLUDEPATH += D:/迅雷下载/cmake-3.16.2-win32-x86/bin/SeetaFace2
INCLUDEPATH += G:/qt/poj/faces/SeetaFace2/FaceTracker/include
INCLUDEPATH += G:/qt/poj/faces/SeetaFace2/FaceRecognizer/include
INCLUDEPATH += G:/qt/poj/faces/SeetaFace2/FaceLandmarker/include
INCLUDEPATH += G:/qt/poj/faces/SeetaFace2/FaceDetector/include
INCLUDEPATH += G:/qt/poj/faces/SeetaFace2/QualityAssessor/include

INCLUDEPATH += D:/opencv/build/include

CONFIG(debug, debug|release): {
LIBS += -LG:/qt/poj/faces/lib -lSeetaFaceTracker-d
LIBS += -LG:/qt/poj/faces/lib -lSeetaFaceDetector-d
LIBS += -LG:/qt/poj/faces/lib -lSeetaFaceLandmarker-d
LIBS += -LG:/qt/poj/faces/libg -lSeetaFaceRecognizer-d
LIBS += -LG:/qt/poj/faces/lib -lSeetaNet-d
LIBS += -LG:/qt/poj/faces/lib -lSeetaQualityAssessor-d

} else:CONFIG(release, debug|release): {
LIBS += -LG:/qt/poj/faces/libb \
-lSeetaFaceTracker \
-lSeetaFaceDetector \
-lSeetaFaceLandmarker \
-lSeetaFaceRecognizer \
-lSeetaNet\
-lSeetaQualityAssessor
}


CONFIG(debug, debug|release): {
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_aruco411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_bgsegm411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_bioinspired411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_calib3d411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_ccalib411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_core411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_datasets411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_dnn_objdetect411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_dnn_superres411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_dpm411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_dnn411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_face411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_features2d411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_flann411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_fuzzy411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_gapi411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_hfs411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_highgui411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_img_hash411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_imgcodecs411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_imgproc411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_line_descriptor411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_ml411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_objdetect411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_optflow411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_phase_unwrapping411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_photo411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_plot411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_quality411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_videoio411d
LIBS += -LD:/opencv/sources/build/lib/Debug -lopencv_video411d
} else:CONFIG(release, debug|release): {

LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_aruco411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_bgsegm411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_bioinspired411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_calib3d411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_ccalib411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_core411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_datasets411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_dnn_objdetect411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_dnn_superres411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_dpm411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_dnn411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_face411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_features2d411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_flann411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_fuzzy411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_gapi411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_hfs411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_highgui411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_img_hash411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_imgcodecs411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_imgproc411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_line_descriptor411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_ml411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_objdetect411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_optflow411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_phase_unwrapping411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_photo411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_plot411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_quality411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_videoio411
LIBS += -LD:/opencv/sources/build/lib/Release -lopencv_video411

}







# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
