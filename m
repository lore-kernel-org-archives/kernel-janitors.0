From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 20 Aug 2009 21:14:06 +0000
Subject: [PATCH] char/hvc: adding __init macro to char/hvc_vio.c
Message-Id: <200908202314.07443.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Frysinger <vapier@gentoo.org>, Nicolas Palix <npalix@diku.dk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@samba.org>

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init/__exit macros to the module_init/
module_exit functions of char/hvc_vio.c

Please have a look at the small patch and either pull it through
your tree, or please ack' it so Jiri can pull it through the trivial tree.

linux version 2.6.31-rc6 - linus git tree, Do 20. Aug 22:26:06 CEST 2009

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff --git a/drivers/char/hvc_vio.c b/drivers/char/hvc_vio.c
index c72b994..10be343 100644
--- a/drivers/char/hvc_vio.c
+++ b/drivers/char/hvc_vio.c
@@ -120,7 +120,7 @@ static struct vio_driver hvc_vio_driver = {
 	}
 };
 
-static int hvc_vio_init(void)
+static int __init hvc_vio_init(void)
 {
 	int rc;
 
@@ -134,7 +134,7 @@ static int hvc_vio_init(void)
 }
 module_init(hvc_vio_init); /* after drivers/char/hvc_console.c */
 
-static void hvc_vio_exit(void)
+static void __exit hvc_vio_exit(void)
 {
 	vio_unregister_driver(&hvc_vio_driver);
 }
