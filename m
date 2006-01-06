From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 06 Jan 2006 11:19:41 +0000
Subject: [KJ] [Patch 4/9] Cleanup MODULE_PARM in lasi_82596.c
Message-Id: <1136546381.13172.23.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95646755075432877=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95646755075432877==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git2/drivers/net/lasi_82596.c.orig	2006-01-06 12:06:28.000000000 +0100
+++ linux-2.6.15-git2/drivers/net/lasi_82596.c	2006-01-06 12:07:07.000000000 +0100
@@ -177,7 +177,7 @@ static int i596_debug = (DEB_SERIOUS|DEB
 MODULE_AUTHOR("Richard Hirst");
 MODULE_DESCRIPTION("i82596 driver");
 MODULE_LICENSE("GPL");
-MODULE_PARM(i596_debug, "i");
+module_param(i596_debug, int, 0644);
 MODULE_PARM_DESC(i596_debug, "lasi_82596 debug mask");
 
 /* Copy frames shorter than rx_copybreak, otherwise pass on up in
@@ -1520,7 +1520,7 @@ static void set_multicast_list(struct ne
 	}
 }
 
-MODULE_PARM(debug, "i");
+module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "lasi_82596 debug mask");
 static int debug = -1;
 



--===============95646755075432877==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95646755075432877==--
