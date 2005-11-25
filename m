From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Fri, 25 Nov 2005 20:43:19 +0000
Subject: [KJ] drivers\char\pcmcia\synclink_cs.c
Message-Id: <003601c5f200$deb12400$1e83c756@bureau>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59900045593238982=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============59900045593238982==
Content-Type: multipart/alternative;
    boundary="----------=_1132951585-17883-129"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1132951585-17883-129
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

In file :            \drivers\char\pcmcia\synclink_cs.c
In function :    line_info(char *buf, MGSLPC_INFO *info)

The buffer *stat_buf* could be defined smaller.

It is used to build a string that can not be longer than "|RTS|CTS|DTR|DSR|=
CD|RI", that is to say 21 + 1 chars so :

     char stat_buf[22];
instead of
    char stat_buf[30];
would be enough and would save a few bytes on the stack.

CJ



------------=_1132951585-17883-129
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
\drivers\char\pcmcia\synclink_cs.c</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>In function&nbsp;:&nbsp;&nbsp;&nbsp; line_=
info(char=20
*buf, MGSLPC_INFO *info)</FONT></DIV>
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
<DIV><FONT face=3DArial size=3D2>CJ</DIV>
<DIV><BR><BR></DIV></FONT></BODY></HTML>

------------=_1132951585-17883-129--

--===============59900045593238982==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59900045593238982==--
