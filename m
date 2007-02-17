From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Sat, 17 Feb 2007 21:04:11 +0000
Subject: [KJ] Improve 'register_handler_proc()' and 'register_irq_proc()'
Message-Id: <004f01c752d7$2cca4c10$fa29145a@bureau>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0798429448=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0798429448==
Content-Type: multipart/alternative;
    boundary="----------=_1171746319-1694-538"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1171746319-1694-538
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

In file /irq/proc.c, function 'register_handler_proc()' and 'register_irq_p=
roc()' memset a local variable 'name[MAX_NAMELEN]'


I don't really see the point of this memset.

In 'register_handler_proc()' :
> > > > > > > >
 char name [MAX_NAMELEN];
 [...]
 memset(name, 0, MAX_NAMELEN);
 snprintf(name, MAX_NAMELEN, "%s", action->name);
 [...] proc_mkdir(name, ...);
> > > > > > > >


In 'register_handler_proc()' :
> > > > > > > >
 char name [MAX_NAMELEN];
 [...]
 memset(name, 0, MAX_NAMELEN);
 sprintf(name, "%d", irq);
 [...] proc_mkdir(name, ...);
> > > > > > > >


Here are my remarks :

1) I think that both function should use 'snprintf', just to be sure. Actua=
ly only 'register_handler_proc()' does

2) I think that the memset are completely useless and could make s.o. think=
 that the 'name' variables are correctly cleanned and NULL terminated. But,
      - In 'register_handler_proc()', the use of snprintf can lead to name =
beeing not NULL terminated !
      - In 'register_irq_proc()', the use of sprintf can lead to access arb=
itrary data in the stack (well if the variable irq is 2^30 =3D 2147483648, =
then 11 chars are used and MAX_NAMELEN is only 10 !

3) So I think that code like above should be better in both cases :
> > > > > > > >
 char name [MAX_NAMELEN + 1];
 [...]
 snprintf(name, MAX_NAMELEN, "%d", irq);
 name[MAX_NAMELEN] =3D '\0';
 [...] proc_mkdir(name, ...);
> > > > > > > >


Any comments ?

Christophe Jaillet
------------=_1171746319-1694-538
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1589" name=3DGENERATOR>
<DEFANGED_style_0 </STYLE>
</HEAD>
<BODY bgColor=3D#fffbf0>
<DIV><FONT face=3D"Courier New" size=3D2>In file /irq/proc.c, function=20
'register_handler_proc()' and 'register_irq_proc()' memset a local variable=
=20
'name[MAX_NAMELEN]'</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>I don't really see the point of th=
is=20
memset.</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>In 'register_handler_proc()' :</FO=
NT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
=20
&gt;</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&nbsp;char name=20
[MAX_NAMELEN];<BR>&nbsp;[...]</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&nbsp;memset(name, 0,=20
MAX_NAMELEN);<BR>&nbsp;snprintf(name, MAX_NAMELEN, "%s",=20
action-&gt;name);</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&nbsp;[...] proc_mkdir(name, ...);=
<BR>&gt;=20
&gt; &gt; &gt; &gt; &gt; &gt; &gt;</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT><FONT face=3D"Courier New" =
size=3D2>In=20
'register_handler_proc()' :</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>
<DIV><FONT face=3D"Courier New" size=3D2>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
=20
&gt;</FONT></DIV>&nbsp;char name [MAX_NAMELEN];</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&nbsp;[...]</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&nbsp;memset(name, 0,=20
MAX_NAMELEN);<BR>&nbsp;sprintf(name, "%d", irq);<BR>&nbsp;[...] proc_mkdir(=
name,=20
...);<BR><FONT face=3D"Courier New" size=3D2>&gt; &gt; &gt; &gt; &gt; &gt; =
&gt;=20
&gt;</FONT></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>Here are my remarks :</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>1) I think that both function shou=
ld use=20
'snprintf', just to be sure. Actualy only 'register_handler_proc()'=20
does</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>2) I think that the memset are com=
pletely=20
useless and could make s.o. think that the 'name' variables are correctly=
=20
cleanned and NULL terminated. But,</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - I=
n=20
'register_handler_proc()', the use of snprintf can lead to&nbsp;name beeing=
 not=20
NULL terminated&nbsp;!</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - I=
n=20
'register_irq_proc()', the use of sprintf can lead to access arbitrary data=
 in=20
the stack (well if the variable irq is&nbsp;2^30 =3D 2147483648, then 11 ch=
ars are=20
used and MAX_NAMELEN is only 10 !</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>3) So I think that code like above=
 should=20
be better in both cases :</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>
<DIV><FONT face=3D"Courier New" size=3D2>
<DIV><FONT face=3D"Courier New" size=3D2>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
=20
&gt;</FONT></DIV>&nbsp;char name [MAX_NAMELEN + 1];</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&nbsp;[...]</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>&nbsp;snprintf(name,=20
MAX_NAMELEN,&nbsp;"%d", irq);<BR>&nbsp;name[MAX_NAMELEN] =3D '\0';<BR>&nbsp=
;[...]=20
proc_mkdir(name, ...);<BR><FONT face=3D"Courier New" size=3D2>&gt; &gt; &gt=
; &gt;=20
&gt; &gt; &gt; &gt;</FONT></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Any comments ?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Christophe Jaillet</DIV></DIV></FONT></BODY></HTML>

------------=_1171746319-1694-538--

--===============0798429448==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0798429448==--
