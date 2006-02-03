From: Matthew Martin <lihnucks@gmail.com>
Date: Fri, 03 Feb 2006 21:16:24 +0000
Subject: [KJ] [PATCH] Adding MODULE_VERSION()
Message-Id: <8cfd00ea0602031316x6d57bdb5qa9815954d859f1b@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42599310457778294=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============42599310457778294==
Content-Type: multipart/alternative;
    boundary="----------=_1139001491-3863-437"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1139001491-3863-437
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I saw this on the TODO list and thought I'd try it. It said to add
MODULE_VERSION() to modules.  Am I doing this right?

--- /home/matthew/linux-2.6.15.2/drivers/usb/storage/usb.c    2006-02-03
14:31:09.000000000 -0600
+++ /home/matthew/src/linux-2.6.15.2/drivers/usb/storage/usb.c    2006-01-31
00:25:07.000000000 -0600
@@ -95,13 +95,10 @@
 #include "onetouch.h"
 #endif

-#define DRV_VERSION "1.75"
-
 /* Some informational data */
 MODULE_AUTHOR("Matthew Dharm <mdharm-usb@one-eyed-alien.net>");
 MODULE_DESCRIPTION("USB Mass Storage driver for Linux");
 MODULE_LICENSE("GPL");
-MODULE_VERSION(DRV_VERSION);

 static unsigned int delay_use =3D 5;
 module_param(delay_use, uint, S_IRUGO | S_IWUSR);

------------=_1139001491-3863-437
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I saw this on the TODO list and thought I'd try it. It said to add MODULE_V=
ERSION() to modules.&nbsp; Am I doing this right?<br>
<br>
--- /home/matthew/linux-<a href=3D"http://2.6.15.2/drivers/usb/storage/usb.=
c">2.6.15.2/drivers/usb/storage/usb.c</a>&nbsp;&nbsp;&nbsp; 2006-02-03 14:3=
1:09.000000000 -0600<br>
+++ /home/matthew/src/linux-<a href=3D"http://2.6.15.2/drivers/usb/storage/=
usb.c">2.6.15.2/drivers/usb/storage/usb.c</a>&nbsp;&nbsp;&nbsp; 2006-01-31 =
00:25:07.000000000 -0600<br>
@@ -95,13 +95,10 @@<br>
&nbsp;#include &quot;onetouch.h&quot;<br>
&nbsp;#endif<br>
&nbsp;<br>
-#define DRV_VERSION &quot;1.75&quot;<br>
-<br>
&nbsp;/* Some informational data */<br>
&nbsp;MODULE_AUTHOR(&quot;Matthew Dharm &lt;<a href=3D"mailto:mdharm-usb@on=
e-eyed-alien.net">mdharm-usb@one-eyed-alien.net</a>&gt;&quot;);<br>
&nbsp;MODULE_DESCRIPTION(&quot;USB Mass Storage driver for Linux&quot;);<br>
&nbsp;MODULE_LICENSE(&quot;GPL&quot;);<br>
-MODULE_VERSION(DRV_VERSION);<br>
&nbsp;<br>
&nbsp;static unsigned int delay_use =3D 5;<br>
&nbsp;module_param(delay_use, uint, S_IRUGO | S_IWUSR);<br>
<br>

------------=_1139001491-3863-437--

--===============42599310457778294==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42599310457778294==--
