From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 26 Jan 2006 11:49:39 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-footbridge/cats-pci.c
Message-Id: <20060126114939.GI8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48748913489919743=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============48748913489919743==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.15/arch/arm/mach-footbridge/cats-pci.c
===================================================================
--- linux-2.6.15.orig/arch/arm/mach-footbridge/cats-pci.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/mach-footbridge/cats-pci.c	2006-01-26 12:38:21.000000000 +0100
@@ -25,7 +25,7 @@
 		return irqmap_cats[dev->irq - 1];
 
 	if (dev->irq != 0)
-		printk("PCI: device %02x:%02x has unknown irq line %x\n",
+		printk(KERN_INFO "PCI: device %02x:%02x has unknown irq line %x\n",
 		       dev->bus->number, dev->devfn, dev->irq);
 
 	return -1;

--===============48748913489919743==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48748913489919743==--
