From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 07 Feb 2004 15:35:05 +0000
Subject: [Kernel-janitors] [PATCH] drivers/net/wireless/strip.c MIN/MAX removal
Message-Id: <402505A9.8060903@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090502080305020903090002"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090502080305020903090002
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
Patch (against 2.6.3-rc1) removes unnecessary min/max macros and changes 
calls to use kernel.h macros instead.
Feedback always welcome
Michael

--------------090502080305020903090002
Content-Type: text/plain;
 name="minmax_drivers_net_wireless.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_net_wireless.patch"

diff -Naur linux-2.6.2.org/drivers/net/wireless/strip.c linux-2.6.2.new/drivers/net/wireless/strip.c
--- linux-2.6.2.org/drivers/net/wireless/strip.c	2004-02-07 15:25:57.000000000 +0100
+++ linux-2.6.2.new/drivers/net/wireless/strip.c	2004-02-07 15:33:24.305031008 +0100
@@ -88,7 +88,7 @@
 #include <asm/uaccess.h>
 #include <asm/bitops.h>
 
-# include <linux/ctype.h>
+#include <linux/ctype.h>
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/interrupt.h>
@@ -454,8 +454,6 @@
 
 #define READDEC(X) ((X)>='0' && (X)<='9' ? (X)-'0' : 0)
 
-#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
-#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
 #define ELEMENTS_OF(X) (sizeof(X) / sizeof((X)[0]))
 #define ARRAY_END(X) (&((X)[ELEMENTS_OF(X)]))
 
@@ -847,7 +845,7 @@
 static int allocate_buffers(struct strip *strip_info, int mtu)
 {
 	struct net_device *dev = strip_info->dev;
-	int sx_size = MAX(STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);
+	int sx_size = max((int)STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);
 	int tx_size = STRIP_ENCAP_SIZE(mtu) + MaxCommandStringLength;
 	__u8 *r = kmalloc(MAX_RECV_MTU, GFP_ATOMIC);
 	__u8 *s = kmalloc(sx_size, GFP_ATOMIC);
@@ -1709,7 +1707,7 @@
 	p++;
 
 	len = value_end - value_begin;
-	len = MIN(len, sizeof(FirmwareVersion) - 1);
+	len = min(len, (int) sizeof(FirmwareVersion) - 1);
 	if (strip_info->firmware_version.c[0] == 0)
 		printk(KERN_INFO "%s: Radio Firmware: %.*s\n",
 		       strip_info->dev->name, len, value_begin);

--------------090502080305020903090002
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090502080305020903090002--
