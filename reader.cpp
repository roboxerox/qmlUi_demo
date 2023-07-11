#include "reader.h"

Reader::Reader()
{

}

bool Reader::m_isReadable()
{
    return b_isReadMode;
}

void Reader::m_setReadable(bool val)
{
    qDebug()<<__FUNCTION__ << "val = "<<val << "b_isReadMode = " <<b_isReadMode;
    b_isReadMode = val;
}
