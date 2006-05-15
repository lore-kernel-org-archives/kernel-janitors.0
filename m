From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 10:22:45 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-ixp4xx/gtwx5715-pci.c
Message-Id: <20060515102245.GL12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87156465721544563=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515102005.GJ12726@rotomalug.org>
In-Reply-To: <20060515102005.GJ12726@rotomalug.org>
To: kernel-janitors@vger.kernel.org

--===============87156465721544563==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-ixp4xx/gtwx5715-pci.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-ixp4xx/gtwx5715-pci.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-ixp4xx/gtwx5715-pci.c	2006-05-15 12:01:21.000000000 +0200
@@ -69,7 +69,7 @@
 	else
 		rc = gtwx5715_irqmap[slot][pin-1];
 
-	printk("%s: Mapped slot %d pin %d to IRQ %d\n", __FUNCTION__,slot, pin, rc);
+	printk(KERN_INFO "%s: Mapped slot %d pin %d to IRQ %d\n", __FUNCTION__,slot, pin, rc);
 	return(rc);
 }
 

--===============87156465721544563==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87156465721544563==--
