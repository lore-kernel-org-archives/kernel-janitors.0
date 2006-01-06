From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 06 Jan 2006 11:19:18 +0000
Subject: [KJ] [Patch 1/9] Cleanup MODULE_PARM in atari_bionet.c
Message-Id: <1136546358.13172.20.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81151043324717953=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81151043324717953==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git2/drivers/net/atari_bionet.c.orig	2006-01-06 12:05:40.000000000 +0100
+++ linux-2.6.15-git2/drivers/net/atari_bionet.c	2006-01-06 12:05:55.000000000 +0100
@@ -123,7 +123,7 @@ static char version[] =
  * Global variable 'bionet_debug'. Can be set at load time by 'insmod'
  */
 unsigned int bionet_debug = NET_DEBUG;
-MODULE_PARM(bionet_debug, "i");
+module_param(bionet_debug, int, 0644);
 MODULE_PARM_DESC(bionet_debug, "bionet debug level (0-2)");
 MODULE_LICENSE("GPL");
 



--===============81151043324717953==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81151043324717953==--
