From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 09 Jan 2006 16:01:28 +0000
Subject: [KJ] [PATCH] printk : arch/arm/common/scoop.c
Message-Id: <20060109160128.GT8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37384622215142738=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37384622215142738==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.15/arch/arm/common/scoop.c
===================================================================
--- linux-2.6.15.orig/arch/arm/common/scoop.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/common/scoop.c	2006-01-07 10:54:33.000000000 +0100
@@ -150,7 +150,7 @@
 
 	platform_set_drvdata(pdev, devptr);
 
-	printk("Sharp Scoop Device found at 0x%08x -> 0x%08x\n",(unsigned int)mem->start,(unsigned int)devptr->base);
+	printk(KERN_INFO "Sharp Scoop Device found at 0x%08x -> 0x%08x\n",(unsigned int)mem->start,(unsigned int)devptr->base);
 
 	SCOOP_REG(devptr->base, SCOOP_MCR) = 0x0140;
 	reset_scoop(&pdev->dev);

--===============37384622215142738==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37384622215142738==--
