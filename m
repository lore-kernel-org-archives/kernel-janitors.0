From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 07 Feb 2004 15:34:34 +0000
Subject: [Kernel-janitors] [PATCH] drivers/net/tokenring/ibmtr.c MIN/MAX
Message-Id: <4025058A.7020505@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020503060308090802090404"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020503060308090802090404
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
Patch (against 2.6.3-rc1) removes unnecessary min/max macros and changes 
calls to use kernel.h macros instead.
Feedback always welcome
Michael

--------------020503060308090802090404
Content-Type: text/plain;
 name="minmax_drivers_net_tokenring.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_net_tokenring.patch"

diff -Naur linux-2.6.2.org/drivers/net/tokenring/ibmtr.c linux-2.6.2.new/drivers/net/tokenring/ibmtr.c
--- linux-2.6.2.org/drivers/net/tokenring/ibmtr.c	2004-02-04 04:43:57.000000000 +0100
+++ linux-2.6.2.new/drivers/net/tokenring/ibmtr.c	2004-02-07 15:33:24.297032224 +0100
@@ -136,8 +136,6 @@
 
 #define DPRINTK(format, args...) printk("%s: " format, dev->name , ## args)
 #define DPRINTD(format, args...) DummyCall("%s: " format, dev->name , ## args)
-#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
-#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
 
 /* version and credits */
 #ifndef PCMCIA
@@ -697,47 +695,47 @@
 	*/
 	if (!ti->page_mask) {
 		ti->avail_shared_ram=
-				MIN(ti->mapped_ram_size,ti->avail_shared_ram);
+				min(ti->mapped_ram_size,ti->avail_shared_ram);
 	}
 
 	switch (ti->avail_shared_ram) {
 	case 16:		/* 8KB shared RAM */
-		ti->dhb_size4mb = MIN(ti->dhb_size4mb, 2048);
+		ti->dhb_size4mb = min(ti->dhb_size4mb, (unsigned short)2048);
 		ti->rbuf_len4 = 1032;
 		ti->rbuf_cnt4=2;
-		ti->dhb_size16mb = MIN(ti->dhb_size16mb, 2048);
+		ti->dhb_size16mb = min(ti->dhb_size16mb, (unsigned short)2048);
 		ti->rbuf_len16 = 1032;
 		ti->rbuf_cnt16=2;
 		break;
 	case 32:		/* 16KB shared RAM */
-		ti->dhb_size4mb = MIN(ti->dhb_size4mb, 4464);
+		ti->dhb_size4mb = min(ti->dhb_size4mb, (unsigned short)4464);
 		ti->rbuf_len4 = 1032;
 		ti->rbuf_cnt4=4;
-		ti->dhb_size16mb = MIN(ti->dhb_size16mb, 4096);
+		ti->dhb_size16mb = min(ti->dhb_size16mb, (unsigned short)4096);
 		ti->rbuf_len16 = 1032;	/*1024 usable */
 		ti->rbuf_cnt16=4;
 		break;
 	case 64:		/* 32KB shared RAM */
-		ti->dhb_size4mb = MIN(ti->dhb_size4mb, 4464);
+		ti->dhb_size4mb = min(ti->dhb_size4mb, (unsigned short)4464);
 		ti->rbuf_len4 = 1032;
 		ti->rbuf_cnt4=6;
-		ti->dhb_size16mb = MIN(ti->dhb_size16mb, 10240);
+		ti->dhb_size16mb = min(ti->dhb_size16mb, (unsigned short)10240);
 		ti->rbuf_len16 = 1032;
 		ti->rbuf_cnt16=6;
 		break;
 	case 127:		/* 63.5KB shared RAM */
-		ti->dhb_size4mb = MIN(ti->dhb_size4mb, 4464);
+		ti->dhb_size4mb = min(ti->dhb_size4mb, (unsigned short)4464);
 		ti->rbuf_len4 = 1032;
 		ti->rbuf_cnt4=6;
-		ti->dhb_size16mb = MIN(ti->dhb_size16mb, 16384);
+		ti->dhb_size16mb = min(ti->dhb_size16mb, (unsigned short)16384);
 		ti->rbuf_len16 = 1032;
 		ti->rbuf_cnt16=16;
 		break;
 	case 128:		/* 64KB   shared RAM */
-		ti->dhb_size4mb = MIN(ti->dhb_size4mb, 4464);
+		ti->dhb_size4mb = min(ti->dhb_size4mb, (unsigned short)4464);
 		ti->rbuf_len4 = 1032;
 		ti->rbuf_cnt4=6;
-		ti->dhb_size16mb = MIN(ti->dhb_size16mb, 17960);
+		ti->dhb_size16mb = min(ti->dhb_size16mb, (unsigned short)17960);
 		ti->rbuf_len16 = 1032;
 		ti->rbuf_cnt16=16;
 		break;

--------------020503060308090802090404
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020503060308090802090404--
