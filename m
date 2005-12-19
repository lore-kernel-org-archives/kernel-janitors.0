From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 19 Dec 2005 16:46:59 +0000
Subject: Re: [KJ] [Patch 2/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <1135010819.9125.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12631494850132174=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134946431.7394.7.camel@alice>
In-Reply-To: <1134946431.7394.7.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============12631494850132174==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> can you give me some more information on this? Seems quite some
> irda drivers use the IRQ_NONE an friends macro.

Ah ok, seems it is already defined in include/linux/interrupt.h
so we dont need to define it in the driver. Here is a patch on
top of the other which simply removes it.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.h.orig	2005-12-19 17:44:31.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.h	2005-12-19 17:44:54.000000000 +0100
@@ -41,14 +41,6 @@
 #define PCI_CLASS_SUBCLASS_MASK		0xffff
 #endif
 
-/* in recent 2.5 interrupt handlers have non-void return value */
-#ifndef IRQ_RETVAL
-typedef void irqreturn_t;
-#define IRQ_NONE
-#define IRQ_HANDLED
-#define IRQ_RETVAL(x)
-#endif
-
 /* some stuff need to check kernelversion. Not all 2.5 stuff was present
  * in early 2.5.x - the test is merely to separate 2.4 from 2.5
  */



--===============12631494850132174==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12631494850132174==--
