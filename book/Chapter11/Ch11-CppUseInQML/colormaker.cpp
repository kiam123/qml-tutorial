#include "colormaker.h"
#include <QDateTime>
#include <QDebug>
#include <QRandomGenerator64>

ColorMaker::ColorMaker(QObject *parent) : QObject(parent),
    m_algorithm(GenerateAlgorithm::RandomRGB),
    m_currentColor(Qt::black),
    m_nColorTimer(0)
{

}

ColorMaker::~ColorMaker(){}

QColor ColorMaker::color() const{
    return m_currentColor;
}

void ColorMaker::setColor(const QColor &color) {
    qDebug() << "setColor: "<< color;
    m_currentColor = color;
    emit colorChanged(m_currentColor);
}

QColor ColorMaker::timeColor() const{
    QTime time = QTime::currentTime();
    int r = time.hour();
    int g = time.minute()*2;
    int b = time.second()*4;
    return QColor::fromRgb(r,g,b);
}

ColorMaker::GenerateAlgorithm ColorMaker::algorithm() const
{
    return m_algorithm;
}

void ColorMaker::setAlgorithm(GenerateAlgorithm algorithm) {
    m_algorithm = algorithm;
}

void ColorMaker::start(){
    qDebug("startTime: 0");
    if(m_nColorTimer == 0)
    {
        qDebug("startTime: 1000");
        m_nColorTimer = startTimer(1000);
    }
}

void ColorMaker::stop() {
    if(m_nColorTimer > 0)
    {
        killTimer(m_nColorTimer);
        m_nColorTimer = 0;
    }
}

void ColorMaker::timerEvent(QTimerEvent *e) {
    QRandomGenerator64 generator;
    generator.seed(QDateTime::currentDateTime().toTime_t());

    if(e->timerId() == m_nColorTimer) {
        qDebug() << "Color Number: " << m_algorithm;
        switch(m_algorithm) {
            case GenerateAlgorithm::RandomRGB:
                m_currentColor.setRgb(generator.generate() % 255, generator.generate() % 255, generator.generate() % 255);
                break;
            case GenerateAlgorithm::RandomRed:
                m_currentColor.setRed(generator.generate() % 255);
                break;
            case GenerateAlgorithm::RandomGreen:
                m_currentColor.setGreen(generator.generate() % 255);
                break;
            case GenerateAlgorithm::RandomBlue:
                m_currentColor.setBlue(generator.generate() % 255);
                break;
            case GenerateAlgorithm::LinearIncrease:
                int r = m_currentColor.red() + 10;
                int g = m_currentColor.green() + 10;
                int b = m_currentColor.blue() + 10;
                m_currentColor.setRgb(r % 255, g % 255, b % 255);
                break;
        }
        emit colorChanged(m_currentColor);
        emit currentTime(QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss"));
    } else {
        QObject::timerEvent(e);
    }
}
