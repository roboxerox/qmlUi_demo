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
    b_isReadMode = val;
}
