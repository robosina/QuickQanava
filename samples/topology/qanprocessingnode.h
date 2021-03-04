#pragma once

// QuickQanava headers
#include <QuickQanava>

// Qt headers
#include <QQuickPaintedItem>

namespace qan {
class ProcessingNode : public qan::Node
{
    Q_OBJECT
public:
    explicit ProcessingNode(QQuickItem* parent = nullptr);
    virtual ~ProcessingNode() override = default;

private:
    Q_DISABLE_COPY(ProcessingNode)

    QString m_rtsp;

public:
    Q_PROPERTY(QString rtsp READ rtsp WRITE setRtsp NOTIFY rtspChanged)

    QString rtsp() const { return m_rtsp; }

public slots:
    void setRtsp(QString rtsp);

signals:
    void rtspChanged(QString rtsp);

    /*! \name Node Static Factories *///---------------------------------------
    //@{
public:
    static  QQmlComponent*      delegate(QQmlEngine& engine) noexcept;
    //@}
    //-------------------------------------------------------------------------
};


class ProcessGraph : public qan::Graph
{
    Q_OBJECT
public:
    explicit ProcessGraph(QQuickItem* parent = nullptr) noexcept :
        qan::Graph(parent) { }

public:
    Q_INVOKABLE qan::Node* insertProcessingNode() {
        auto node = insertNode<ProcessingNode>(nullptr);
        return node;
    }
};


} // ::qan

QML_DECLARE_TYPE(qan::ProcessingNode)
QML_DECLARE_TYPE(qan::ProcessGraph)
