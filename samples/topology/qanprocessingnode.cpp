#include "./qanprocessingnode.h"
// QuickQanava headers
#include "../../src/QuickQanava.h"

namespace qan { // ::qan
ProcessingNode::ProcessingNode(QQuickItem* parent) :
    qan::Node{parent} { }


void ProcessingNode::setRtsp(QString rtsp)
{
    if (m_rtsp == rtsp)
        return;

    m_rtsp = rtsp;
    emit rtspChanged(m_rtsp);
}

QQmlComponent *ProcessingNode::delegate(QQmlEngine &engine) noexcept
{
    static std::unique_ptr<QQmlComponent>   delegate;
    if ( !delegate )
        delegate = std::make_unique<QQmlComponent>(&engine, "qrc:/ProcessingNode.qml");
    return delegate.get();
}

}
