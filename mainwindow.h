#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <SeetaFace2/FaceTracker/include/seeta/FaceTracker.h>
#include <SeetaFace2/example/tracking/seeta/Struct_cv.h>
#include <SeetaFace2/FaceDetector/include/seeta/Struct.h>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2\opencv.hpp>
#include <array>
#include <map>
#include <iostream>



QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_4_clicked();

    void on_pushButton_5_clicked();

private:
    Ui::MainWindow *ui;
    seeta::FaceTracker * FD=nullptr;

};
#endif // MAINWINDOW_H
