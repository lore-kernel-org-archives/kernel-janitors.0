From: "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>
Date: Mon, 28 Nov 2005 21:40:13 +0000
Subject: [KJ] use kzalloc instead of kcalloc(1,
Message-Id: <007101c5f464$51029d80$ca48c356@bureau>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97717840501741238=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <007001c5f392$4c61cda0$3ec0c756@bureau>
In-Reply-To: <007001c5f392$4c61cda0$3ec0c756@bureau>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============97717840501741238==
Content-Type: multipart/alternative;
    boundary="----------=_1133214170-26772-20"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1133214170-26772-20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

from: Christophe Jaillet christophe.jaillet@wanadoo.fr

use kzalloc instead of kcalloc(1,...) in /kernel/kprobes.c and /include/lin=
ux/gameport.h
Signed-off-by : Christophe Jaillet christophe.jaillet@wanadoo.fr
---
Patch applicable to linux-2.6.15-rc2

I hope that for this third try :
    the form is OK
    the patch is usefull
CJ


--- linux-2.6.14.2/kernel/kprobes.c.old 2005-11-11 06:33:12.000000000 +0100
+++ linux-2.6.14.2/kernel/kprobes.c 2005-11-28 22:20:58.000000000 +0100
@@ -420,3 +420,3 @@ static inline void add_aggr_kprobe(struc
  * the intricacies
- * TODO: Move kcalloc outside the spinlock
+ * TODO: Move kzalloc outside the spinlock
  */
@@ -432,3 +432,3 @@ static int __kprobes register_aggr_kprob
  } else {
-  ap =3D kcalloc(1, sizeof(struct kprobe), GFP_ATOMIC);
+  ap =3D kzalloc(sizeof(struct kprobe), GFP_ATOMIC);
   if (!ap)


--- linux-2.6.14.2/include/linux/gameport.h.old 2005-11-11 06:33:12.0000000=
00 +0100
+++ linux-2.6.14.2/include/linux/gameport.h 2005-11-28 22:19:48.000000000 +=
0100
@@ -104,3 +104,3 @@ static inline struct gameport *gameport_
 {
- struct gameport *gameport =3D kcalloc(1, sizeof(struct gameport), GFP_KER=
NEL);
+ struct gameport *gameport =3D kzalloc(sizeof(struct gameport), GFP_KERNEL=
);

------------=_1133214170-26772-20
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
<DIV><FONT face=3DCourier size=3D2>
<DIV>from: Christophe Jaillet <A=20
href=3D"mailto:christophe.jaillet@wanadoo.fr">christophe.jaillet@wanadoo.fr=
</A></DIV>
<DIV>&nbsp;</DIV>
<DIV>use kzalloc instead of kcalloc(1,...) in /kernel/kprobes.c and=20
/include/linux/gameport.h<BR>Signed-off-by : Christophe Jaillet <A=20
href=3D"mailto:christophe.jaillet@wanadoo.fr">christophe.jaillet@wanadoo.fr=
</A><BR>---</DIV>
<DIV>Patch&nbsp;applicable to&nbsp;linux-2.6.15-rc2<BR></DIV>
<DIV>I hope that for this third try :</DIV>
<DIV>&nbsp;&nbsp;&nbsp; the form is OK</DIV>
<DIV>&nbsp;&nbsp;&nbsp; the patch is usefull<BR>CJ</DIV>
<DIV><BR>&nbsp;</DIV>
<DIV>--- linux-2.6.14.2/kernel/kprobes.c.old&nbsp;2005-11-11 06:33:12.00000=
0000=20
+0100<BR>+++ linux-2.6.14.2/kernel/kprobes.c&nbsp;2005-11-28 22:20:58.00000=
0000=20
+0100<BR>@@ -420,3 +420,3 @@ static inline void add_aggr_kprobe(struc<BR>&n=
bsp;=20
* the intricacies<BR>- * TODO: Move kcalloc outside the spinlock<BR>+ * TOD=
O:=20
Move kzalloc outside the spinlock<BR>&nbsp; */<BR>@@ -432,3 +432,3 @@ stati=
c int=20
__kprobes register_aggr_kprob<BR>&nbsp;&nbsp;} else {<BR>-&nbsp;&nbsp;ap =
=3D=20
kcalloc(1, sizeof(struct kprobe), GFP_ATOMIC);<BR>+&nbsp;&nbsp;ap =3D=20
kzalloc(sizeof(struct kprobe), GFP_ATOMIC);<BR>&nbsp;&nbsp;&nbsp;if=20
(!ap)<BR></DIV>
<DIV>&nbsp;</DIV>
<DIV>--- linux-2.6.14.2/include/linux/gameport.h.old&nbsp;2005-11-11=20
06:33:12.000000000 +0100<BR>+++=20
linux-2.6.14.2/include/linux/gameport.h&nbsp;2005-11-28 22:19:48.000000000=
=20
+0100<BR>@@ -104,3 +104,3 @@ static inline struct gameport=20
*gameport_<BR>&nbsp;{<BR>-&nbsp;struct gameport *gameport =3D kcalloc(1,=20
sizeof(struct gameport), GFP_KERNEL);<BR>+&nbsp;struct gameport *gameport =
=3D=20
kzalloc(sizeof(struct gameport),=20
GFP_KERNEL);<BR></DIV></FONT></DIV></BODY></HTML>

------------=_1133214170-26772-20--

--===============97717840501741238==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97717840501741238==--
