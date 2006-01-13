From: Yoshinori Sato <ysato@users.sourceforge.jp>
Date: Fri, 13 Jan 2006 08:45:27 +0000
Subject: [KJ] Re: [Patch] replace MODULE_PARM innet/ne-h8300.c
Message-Id: <m24q48349k.wl%ysato@users.sourceforge.jp>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29814235952282342=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29814235952282342==
Content-Type: text/plain; charset=US-ASCII

At Tue, 10 Jan 2006 14:06:22 +0100,
Eric Sesterhenn / snakebyte wrote:
> 
> hi,
> 
> this patch replaces the MODULE_PARM usage in uli526x.c
> with module_param.
> 

I am fine.
I delete it incidentally because do not use "bad".

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

===File ~/ne-h8300.diff=====================================
diff --git a/drivers/net/ne-h8300.c b/drivers/net/ne-h8300.c
index 8f40368..ccd0c0f 100644
--- a/drivers/net/ne-h8300.c
+++ b/drivers/net/ne-h8300.c
@@ -598,11 +598,9 @@ retry:
 static struct net_device *dev_ne[MAX_NE_CARDS];
 static int io[MAX_NE_CARDS];
 static int irq[MAX_NE_CARDS];
-static int bad[MAX_NE_CARDS];	/* 0xbad = bad sig or no reset ack */
 
-MODULE_PARM(io, "1-" __MODULE_STRING(MAX_NE_CARDS) "i");
-MODULE_PARM(irq, "1-" __MODULE_STRING(MAX_NE_CARDS) "i");
-MODULE_PARM(bad, "1-" __MODULE_STRING(MAX_NE_CARDS) "i");
+module_param_array(io, int, NULL, 0);
+module_param_array(irq, int, NULL, 0);
 MODULE_PARM_DESC(io, "I/O base address(es)");
 MODULE_PARM_DESC(irq, "IRQ number(s)");
 MODULE_DESCRIPTION("H8/300 NE2000 Ethernet driver");
@@ -624,7 +622,6 @@ int init_module(void)
 			break;
 		if (io[this_dev]) {
 			dev->irq = irq[this_dev];
-			dev->mem_end = bad[this_dev];
 			dev->base_addr = io[this_dev];
 		} else {
 			dev->base_addr = h8300_ne_base[this_dev];
============================================================

-- 
Yoshinori Sato
<ysato@users.sourceforge.jp>

--===============29814235952282342==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29814235952282342==--
