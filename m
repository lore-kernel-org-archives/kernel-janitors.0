From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 06 Jan 2006 11:19:49 +0000
Subject: [KJ] [Patch 5/9] Cleanup MODULE_PARM in mac89x0.c
Message-Id: <1136546390.13172.25.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78783687397039226=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78783687397039226==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git2/drivers/net/mac89x0.c.orig	2006-01-06 12:05:06.000000000 +0100
+++ linux-2.6.15-git2/drivers/net/mac89x0.c	2006-01-06 12:05:19.000000000 +0100
@@ -629,7 +629,7 @@ static int set_mac_address(struct net_de
 static struct net_device *dev_cs89x0;
 static int debug;
 
-MODULE_PARM(debug, "i");
+module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "CS89[02]0 debug level (0-5)");
 MODULE_LICENSE("GPL");
 



--===============78783687397039226==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78783687397039226==--
