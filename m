From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Sat, 22 Aug 2009 23:46:55 +0000
Subject: [PATCH] char/impi: adding __init macro/ fix of __exit macro location in ipmi_poweroff.c
Message-Id: <200908230146.56283.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: Corey Minyard <minyard@acm.org>, openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init to the module_init function of
drivers/char/ipmi/ipmy_poweroff.c and corrects the location of __exit for the
cleanup function.

According to ldd3, page 31 the __exit token hast to be after the return type.
Or am I getting something wrong here?

Corey, please have a look at the small patch and either pull it through
your tree, or please ack' it so Jiri can pull it through the trivial tree.

linux version 2.6.31-rc6 - linus git tree, So 23. Aug 01:38:43 CEST 2009

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
index a261bd7..2e66b5f 100644
--- a/drivers/char/ipmi/ipmi_poweroff.c
+++ b/drivers/char/ipmi/ipmi_poweroff.c
@@ -691,7 +691,7 @@ static struct ctl_table_header *ipmi_table_header;
 /*
  * Startup and shutdown functions.
  */
-static int ipmi_poweroff_init(void)
+static int __init ipmi_poweroff_init(void)
 {
 	int rv;
 
@@ -725,7 +725,7 @@ static int ipmi_poweroff_init(void)
 }
 
 #ifdef MODULE
-static __exit void ipmi_poweroff_cleanup(void)
+static void __exit ipmi_poweroff_cleanup(void)
 {
 	int rv;
 
