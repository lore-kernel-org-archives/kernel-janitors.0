From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Fri, 25 Nov 2005 20:47:22 +0000
Subject: [KJ] drivers\char\synclink.c
Message-Id: <005701c5f201$6f7bf190$1e83c756@bureau>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============031947732725352784=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============031947732725352784==
Content-Type: multipart/alternative;
    boundary="----------=_1132951790-17883-149"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1132951790-17883-149
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

In file :            \drivers\char\synclink.c
In function :    line_info(char *buf, struct mgsl_struct *info)

The buffer *stat_buf* could be defined smaller.

It is used to build a string that can not be longer than "|RTS|CTS|DTR|DSR|=
CD|RI", that is to say 21 + 1 chars so :

     char stat_buf[22];
instead of
    char stat_buf[30];
would be enough and would save a few bytes on the stack.

CJ
------------=_1132951790-17883-149
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1522" name=3DGENERATOR>
<DEFANGED_style_0 </STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>In file=20
:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
\drivers\char\synclink.c</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>In function&nbsp;:&nbsp;&nbsp;&nbsp; line_=
info(char=20
*buf, struct mgsl_struct *info)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The buffer *stat_buf* could be defined=20
smaller.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>It is used to build a string that can not =
be longer=20
than "|RTS|CTS|DTR|DSR|CD|RI", that is to say 21 + 1 chars so :</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;=20
&nbsp;char&nbsp;stat_buf[22];</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>instead of</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;=20
char&nbsp;stat_buf[30];</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>would be enough and would save a few bytes=
 on the=20
stack.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>CJ</DIV></FONT></BODY></HTML>

------------=_1132951790-17883-149--

--===============031947732725352784==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============031947732725352784==--
