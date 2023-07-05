#include "fileio.h"

bool FileIO::parse(const QString &source)
{
    if (source.isEmpty())
        return false;

    QFile file(source);
    if (!file.open(QFile::WriteOnly | QFile::Truncate))
        return false;

    QFile* xml_file = new QFile(source);
    if (!xml_file->open(QIODevice::ReadOnly | QIODevice::Text)) {
            qDebug("Load XML File Problem");
            return false;
    }

    QXmlStreamReader reader(xml_file);
    while(!reader.atEnd() && !reader.hasError()) {
        if(reader.readNext() == QXmlStreamReader::StartElement && reader.name() == "parent") {
             qDebug() << reader.readElementText();
        }
    }
    return true;
}

FileIO::FileIO()
{

}
