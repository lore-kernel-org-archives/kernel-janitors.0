From: Michael Veeck <michael.veeck@gmx.net>
Date: Sun, 15 Aug 2004 11:44:18 +0000
Subject: [Kernel-janitors] [PATCH] minmax-removal
Message-Id: <411F4C92.4040007@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080201080703070307060300"
List-Id: <kernel-janitors.vger.kernel.org>
References: <411F4C54.4090609@gmx.net>
In-Reply-To: <411F4C54.4090609@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080201080703070307060300
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.8.1) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Since I dont have the hardware those patches are not tested.

Best regards
Veeck

Signed-off-by: Michael Veeck <michael.veeck@gmx.net>





--------------080201080703070307060300
Content-Type: text/plain;
 name="minmax-arch-mips-au1000.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax-arch-mips-au1000.patch"

--- linux-2.6.8-old/arch/mips/au1000/common/usbdev.c	2004-08-14 11:49:09.000000000 +0200
+++ linux-2.6.8-new/arch/mips/au1000/common/usbdev.c	2004-08-15 13:08:00.661191816 +0200
@@ -61,8 +61,6 @@
 #define vdbg(fmt, arg...) do {} while (0)
 #endif
 
-#define MAX(a,b)	(((a)>(b))?(a):(b))
-
 #define ALLOC_FLAGS (in_interrupt () ? GFP_ATOMIC : GFP_KERNEL)
 
 #define EP_FIFO_DEPTH 8

--------------080201080703070307060300
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080201080703070307060300--
