From: Carlo Perassi <carlo@linux.it>
Date: Sun, 09 Jan 2005 11:30:01 +0000
Subject: [KJ] [patch] trivial typos
Message-Id: <20050109113001.GA8292@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PEIAKu/WMn1b1Hv9"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Some weeks ago I was searching in a bitkeeper snapshot some news about
ppp_async.
I didn't find anything about it but I found some strings "Suppport".
The very trivial patches are attached.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="01.patch"

Signed-off-by: Carlo Perassi <carlo@linux.it>

---

--- linux-2.6.10/Documentation/video4linux/bttv/Cards	2004-12-24 22:34:26 +0100
+++ linux-2.6.10-mod/Documentation/video4linux/bttv/Cards	2005-01-09 12:16:42 +0100
@@ -3,7 +3,7 @@ Gunther Mayer's bttv card gallery (graph
 is available at: http://mayerg.gmxhome.de/bttv/bttv-gallery.html
 
 
-Suppported cards:
+Supported cards:
 Bt848/Bt848a/Bt849/Bt878/Bt879 cards
 ------------------------------------
 

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="02.patch"

Signed-off-by: Carlo Perassi <carlo@linux.it>

---

--- linux-2.6.10/drivers/media/dvb/frontends/tda10021.c	2004-12-24 22:35:50 +0100
+++ linux-2.6.10-mod/drivers/media/dvb/frontends/tda10021.c	2005-01-09 12:17:00 +0100
@@ -4,7 +4,7 @@
 
     Copyright (C) 1999 Convergence Integrated Media GmbH <ralph@convergence.de>
     Copyright (C) 2004 Markus Schulz <msc@antzsystem.de>
-                   Suppport for TDA10021
+                   Support for TDA10021
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="03.patch"

Signed-off-by: Carlo Perassi <carlo@linux.it>

---

--- linux-2.6.10/drivers/media/dvb/frontends/tda10021.h	2004-12-24 22:34:26 +0100
+++ linux-2.6.10-mod/drivers/media/dvb/frontends/tda10021.h	2005-01-09 12:17:21 +0100
@@ -4,7 +4,7 @@
 
     Copyright (C) 1999 Convergence Integrated Media GmbH <ralph@convergence.de>
     Copyright (C) 2004 Markus Schulz <msc@antzsystem.de>
-                   Suppport for TDA10021
+                   Support for TDA10021
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--PEIAKu/WMn1b1Hv9--
