#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QMessageBox>
#include <QFileDialog>
#include <QString>
#include <SeetaFace2/example/search/seeta/FaceEngine.h>
#include <QImage>
#include <QDebug>
#include <qtomat.h>

inline cv::Mat QImageToCvMat( const QImage &inImage, bool inCloneImageData = true )
{
    switch ( inImage.format() )
    {
    // 8-bit, 4 channel
    case QImage::Format_ARGB32:
    case QImage::Format_ARGB32_Premultiplied:
    {
        cv::Mat  mat( inImage.height(), inImage.width(),
                      CV_8UC4,
                      const_cast<uchar*>(inImage.bits()),
                      static_cast<size_t>(inImage.bytesPerLine())
                      );

        return (inCloneImageData ? mat.clone() : mat);
    }

    // 8-bit, 3 channel
    case QImage::Format_RGB32:
    case QImage::Format_RGB888:
    {
        if ( !inCloneImageData )
        {
          qWarning() << "CVS::QImageToCvMat()";
        }

        QImage   swapped = inImage;

        if ( inImage.format() == QImage::Format_RGB32 )
        {
            swapped = swapped.convertToFormat( QImage::Format_RGB888 );
        }

        swapped = swapped.rgbSwapped();

        return cv::Mat( swapped.height(), swapped.width(),
                        CV_8UC3,
                        const_cast<uchar*>(swapped.bits()),
                        static_cast<size_t>(swapped.bytesPerLine())
                        ).clone();
    }

    // 8-bit, 1 channel
    case QImage::Format_Indexed8:
    {
        cv::Mat  mat( inImage.height(), inImage.width(),
                      CV_8UC1,
                      const_cast<uchar*>(inImage.bits()),
                      static_cast<size_t>(inImage.bytesPerLine())
                      );

        return (inCloneImageData ? mat.clone() : mat);
    }

    default:
        qWarning() << "CVS::QImageToCvMat() - QImage format not handled in switch:" << inImage.format();
        break;
    }

    return cv::Mat();
}

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);


}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    QString s1 = ui->label->text();
    QString s2 = ui->label_2->text();
    ui->label->setScaledContents(1);
    ui->label_2->setScaledContents(1);


       seeta::ModelSetting::Device device = seeta::ModelSetting::GPU;
       int id = 0;
       seeta::ModelSetting FD_model( "mod/fd_2_00.dat", device, id );
       seeta::ModelSetting PD_model( "mod/pd_2_00_pts5.dat", device, id );
       seeta::ModelSetting FR_model( "mod/fr_2_10.dat", device, id );
       seeta::FaceEngine engine( FD_model, PD_model, FR_model, 2, 16 );
       cv::Mat mat1=QImageToCvMat( QImage(s1));
       cv::Mat mat2=QImageToCvMat( QImage(s2));

      seeta::cv::ImageData p1=mat1;
      seeta::cv::ImageData p2=mat2;

    // std::vector<SeetaFaceInfo> faces1 = engine.DetectFaces(p1);

   //  std::vector<SeetaFaceInfo> faces2 = engine.DetectFaces(p2);
      auto point1=  engine.DetectPoints(p1);
      auto point2=  engine.DetectPoints(p2);

      for(auto c:point1)
          cv::circle(mat1,cv::Point(int(c.x), int(c.y)), 10, CV_RGB(128, 255, 128), -1);
      for(auto c:point2)
          cv::circle(mat2,cv::Point(int(c.x), int(c.y)), 10, CV_RGB(128, 255, 128), -1);
    auto score= engine.Compare(p1,point1.data(),p2,point2.data());
    ui->label_3->setText(QString::number(score));


    ui->label->setPixmap(QPixmap( CVS::cvMatToQPixmap(mat1)));
    ui->label_2->setPixmap(QPixmap(CVS::cvMatToQPixmap(mat2)));


}

void MainWindow::on_pushButton_4_clicked()
{
    QString filename =  QFileDialog::getOpenFileName(this,
                      tr("Open Image"), "/home/jana", tr("Image Files (*.png *.jpg *.bmp)"));
    ui->label->setText(filename);
}

void MainWindow::on_pushButton_5_clicked()
{
    QString filename =  QFileDialog::getOpenFileName(this,
                      tr("Open Image"), "/home/jana", tr("Image Files (*.png *.jpg *.bmp)"));
    ui->label_2->setText(filename);

}
