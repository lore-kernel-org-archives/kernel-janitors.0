From: mikal@stillhq.com
Date: Thu, 18 Mar 2004 01:04:04 +0000
Subject: [Kernel-janitors] [Trivial Patch] kernel-doc comment tweak
Message-Id: <200403180104.i2I144931157@diskbox.stillhq.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200403180103.i2I13vI31101@diskbox.stillhq.com>
In-Reply-To: <200403180103.i2I13vI31101@diskbox.stillhq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct kernel-doc comment with incorrect parameters documented

Meta data:
Author: Michael Still
Email: mikal@stillhq.com
Kernel version: applies to 2.6.5-rc1





diff -Nur linux-2.6.2-rc1-cset-20040125_0129/drivers/usb/media/vicam.c linux-2.6.2-rc1-cset-20040125_0129-params/drivers/usb/media/vicam.c
--- linux-2.6.2-rc1-cset-20040125_0129/drivers/usb/media/vicam.c	2004-01-26 09:26:06.000000000 +1100
+++ linux-2.6.2-rc1-cset-20040125_0129-params/drivers/usb/media/vicam.c	2004-01-30 17:39:05.000000000 +1100
@@ -1269,6 +1269,8 @@
 
 /**
  *	vicam_probe
+ *	@intf: the interface
+ *	@id: the device id
  *
  *	Called by the usb core when a new device is connected that it thinks
  *	this driver might be interested in.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
