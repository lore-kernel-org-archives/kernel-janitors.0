From: mikal@stillhq.com
Date: Thu, 18 Mar 2004 01:04:05 +0000
Subject: [Kernel-janitors] [Trivial Patch] kernel-doc comment tweak
Message-Id: <200403180104.i2I145U31165@diskbox.stillhq.com>
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





diff -Nur linux-2.6.2-rc1-cset-20040125_0129/drivers/usb/serial/io_ti.c linux-2.6.2-rc1-cset-20040125_0129-params/drivers/usb/serial/io_ti.c
--- linux-2.6.2-rc1-cset-20040125_0129/drivers/usb/serial/io_ti.c	2004-01-26 09:26:07.000000000 +1100
+++ linux-2.6.2-rc1-cset-20040125_0129-params/drivers/usb/serial/io_ti.c	2004-01-30 17:39:05.000000000 +1100
@@ -274,7 +274,7 @@
 /**
  * TIReadDownloadMemory - Read edgeport memory from TI chip
  * @dev: usb device pointer
- * @address: Device CPU address at which to read
+ * @start_address: Device CPU address at which to read
  * @length: Length of above data
  * @address_type: Can read both XDATA and I2C
  * @buffer: pointer to input data buffer
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
