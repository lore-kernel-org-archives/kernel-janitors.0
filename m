From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Dec 2014 19:30:35 +0000
Subject: Re: Determination for the number of named function parameters (with SmPL)
Message-Id: <5490885B.4030000@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <547C4D11.1050206@users.sourceforge.net>
In-Reply-To: <547C4D11.1050206@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr

Hello,

Would you like to know how many named function parameters are used in the s=
ource files?

How do you think about to try the following semantic query approach out a b=
it more?

@initialize:python@
@@
import sys
import sqlalchemy
sys.stderr.write("\n".join( ("Using SQLAlchemy version:",
                             sqlalchemy.__version__) ))
sys.stderr.write("\n")
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import sessionmaker
engine =3D create_engine("sqlite:///:memory:", echo=FAlse)
base =3D declarative_base()

class function(base):
   __tablename__ =3D "numbers"
   name =3D Column(String, primary_key=3DTrue)
   source_file =3D Column(String, primary_key=3DTrue)
   line =3D Column(Integer, primary_key=3DTrue)
   column =3D Column(Integer, primary_key=3DTrue)
   parameter_number =3D Column(Integer)
  =20
   def __repr__(self):
      return """<function(name=3D'%s',
source_file=3D'%s',
line=3D'%s',
column=3D'%s',
parameter_number=3D'%s')>""" % (self.name,
                              self.source_file,
                              self.line,
                              self.column,
                              self.parameter_number)

configured_session =3D sessionmaker(bind=3Dengine)
session =3D configured_session()
base.metadata.create_all(engine)

def store_number(fun, source, count):
    """Add an integer to an internal table."""
    for place in source:
       entry =3D function(name =3D fun,
                        source_file =3D place.file,
                        line =3D place.line,
                        column =3D int(place.column) + 1,
                        parameter_number =3D count)
       session.add(entry)

@counting_parameters@
identifier work;
parameter list[number] pl;
position pos;
type return_type;
@@
 return_type work@pos(pl)
 {
  ...
 }

@script:python collection@
fun << counting_parameters.work;
count << counting_parameters.number;
place << counting_parameters.pos;
@@
store_number(fun, place, count)

@finalize:python@
@@
session.commit()
from sqlalchemy import func
entries =3D session.query(func.count("*")).select_from(function).scalar()

if entries > 0:
   delimiter =3D "|"
   sys.stdout.write(delimiter.join( ("number", "incidence") ))
   sys.stdout.write("\r\n")
   for number, incidence in session.query(function.parameter_number,
                                          func.count("*")).group_by(functio=
n.parameter_number):
      sys.stdout.write(delimiter.join( (str(number), str(incidence)) ))
      sys.stdout.write("\r\n")
else:
   sys.stderr.write("No result for this analysis!\n")



elfring@Sonne:~/Projekte/Coccinelle/Probe> XX=3D$(date) && spatch.opt -time=
out 12 -sp-file list_parameter_numbers2.cocci -dir /usr/src/linux-stable > =
list_parameter_numbers2.txt 2> list_parameter_numbers2-errors.txt ; YY=3D$(=
date) && echo "$XX * $YY"
Di 16. Dez 18:51:03 CET 2014 * Di 16. Dez 19:16:28 CET 2014
...
elfring@Sonne:~/Projekte/Coccinelle/Probe> cat list_parameter_numbers2.txt
number|incidence
0|46
1|161270
2|103405
3|55551
4|25947
5|9569
6|4907
7|1860
8|738
9|335
10|177
11|108
12|64
13|20
14|11
15|8
16|4
17|5
18|1
21|1
22|1


Do you find such an analysis result from the source files for Linux 3.18
(with the help of the software "Coccinelle 1.0.0-rc23") interesting
for further considerations?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
