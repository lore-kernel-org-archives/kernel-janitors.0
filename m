From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 07 Feb 2004 20:24:15 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/net/wireless/strip.c MIN/MAX
Message-Id: <4025496F.6040904@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030100050605030906040305"
List-Id: <kernel-janitors.vger.kernel.org>
References: <402505A9.8060903@gmx.net>
In-Reply-To: <402505A9.8060903@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030100050605030906040305
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Domen Puncer schrieb:
> 
> Just some suggestions...
> 
>> #define ELEMENTS_OF(X) (sizeof(X) / sizeof((X)[0]))
> 
> Remove this define and s/ELEMENTS_OF/ARRAY_SIZE/g
> 

There are more occurances of redundant ARRAY_SIZEs in the kernel. I will
keep that in mind!

> 
> 
>>@@ -847,7 +845,7 @@
>> static int allocate_buffers(struct strip *strip_info, int mtu)
>> {
>>        struct net_device *dev = strip_info->dev;
>>-       int sx_size = MAX(STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);
>>+       int sx_size = max((int)STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);
> 
> 
> max_t?

Changed that to max_t and min_t. A newbie queston: What should when be
preferred and why?

Attached is the new patch.

	Veeck



--------------030100050605030906040305
Content-Type: text/plain;
 name="minmax_drivers_net_wireless.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_net_wireless.patch"

--- linux-2.6.2.org/drivers/net/wireless/strip.c	2004-02-07 15:25:57.000000000 +0100
+++ linux-2.6.2.new/drivers/net/wireless/strip.c	2004-02-07 19:38:12.217658552 +0100
@@ -82,6 +82,7 @@
 /* Header files								*/
 
 #include <linux/config.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <asm/system.h>
@@ -454,10 +455,7 @@
 
 #define READDEC(X) ((X)>='0' && (X)<='9' ? (X)-'0' : 0)
 
-#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
-#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
-#define ELEMENTS_OF(X) (sizeof(X) / sizeof((X)[0]))
-#define ARRAY_END(X) (&((X)[ELEMENTS_OF(X)]))
+#define ARRAY_END(X) (&((X)[ARRAY_SIZE(X)]))
 
 #define JIFFIE_TO_SEC(X) ((X) / HZ)
 
@@ -847,7 +845,7 @@
 static int allocate_buffers(struct strip *strip_info, int mtu)
 {
 	struct net_device *dev = strip_info->dev;
-	int sx_size = MAX(STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);
+	int sx_size = max_t(int, STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);
 	int tx_size = STRIP_ENCAP_SIZE(mtu) + MaxCommandStringLength;
 	__u8 *r = kmalloc(MAX_RECV_MTU, GFP_ATOMIC);
 	__u8 *s = kmalloc(sx_size, GFP_ATOMIC);
@@ -1465,7 +1463,7 @@
 		/* Cycle to next periodic command? */
 		if (strip_info->firmware_level >= StructuredMessages)
 			if (++strip_info->next_command >=
-			    ELEMENTS_OF(CommandString))
+			    ARRAY_SIZE(CommandString))
 				strip_info->next_command = 0;
 #ifdef EXT_COUNTERS
 		strip_info->tx_ebytes += ts.length;
@@ -1709,7 +1707,7 @@
 	p++;
 
 	len = value_end - value_begin;
-	len = MIN(len, sizeof(FirmwareVersion) - 1);
+	len = min_t(int, len, sizeof(FirmwareVersion) - 1);
 	if (strip_info->firmware_version.c[0] == 0)
 		printk(KERN_INFO "%s: Radio Firmware: %.*s\n",
 		       strip_info->dev->name, len, value_begin);

--------------030100050605030906040305
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030100050605030906040305--
