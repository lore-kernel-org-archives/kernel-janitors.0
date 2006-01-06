From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 06 Jan 2006 11:19:31 +0000
Subject: [KJ] [Patch 3/9] Cleanup MODULE_PARM in cassini.c
Message-Id: <1136546372.13172.22.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74178585733952329=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74178585733952329==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git2/drivers/net/cassini.c.orig	2006-01-06 12:03:56.000000000 +0100
+++ linux-2.6.15-git2/drivers/net/cassini.c	2006-01-06 12:04:45.000000000 +0100
@@ -194,9 +194,9 @@ static char version[] __devinitdata =
 MODULE_AUTHOR("Adrian Sun (asun@darksunrising.com)");
 MODULE_DESCRIPTION("Sun Cassini(+) ethernet driver");
 MODULE_LICENSE("GPL");
-MODULE_PARM(cassini_debug, "i");
+module_param(cassini_debug, int, 0644);
 MODULE_PARM_DESC(cassini_debug, "Cassini bitmapped debugging message enable value");
-MODULE_PARM(link_mode, "i");
+module_param(link_mode, int, 0);
 MODULE_PARM_DESC(link_mode, "default link mode");
 
 /*
@@ -208,7 +208,7 @@ MODULE_PARM_DESC(link_mode, "default lin
  * Value in seconds, for user input.
  */
 static int linkdown_timeout = DEFAULT_LINKDOWN_TIMEOUT;
-MODULE_PARM(linkdown_timeout, "i");
+module_param(linkdown_timeout, int, 0);
 MODULE_PARM_DESC(linkdown_timeout,
 "min reset interval in sec. for PCS linkdown issue; disabled if not positive");
 



--===============74178585733952329==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74178585733952329==--
