From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 09 Jan 2006 11:34:05 +0000
Subject: [KJ] [PATCH] printk : arch/arm/common/sa1111.c
Message-Id: <20060109113405.GQ8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40041771902595347=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40041771902595347==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.15/arch/arm/common/sa1111.c
===================================================================
--- linux-2.6.15.orig/arch/arm/common/sa1111.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/common/sa1111.c	2006-01-07 10:52:15.000000000 +0100
@@ -580,7 +580,7 @@
 
 	ret = request_resource(parent, &dev->res);
 	if (ret) {
-		printk("SA1111: failed to allocate resource for %s\n",
+		printk(KERN_WARNING "SA1111: failed to allocate resource for %s\n",
 			dev->res.name);
 		kfree(dev);
 		goto out;
@@ -605,7 +605,7 @@
 		if (dev->dma_mask != 0xffffffffUL) {
 			ret = dmabounce_register_dev(&dev->dev, 1024, 4096);
 			if (ret) {
-				printk("SA1111: Failed to register %s with dmabounce", dev->dev.bus_id);
+				printk(KERN_WARNING "SA1111: Failed to register %s with dmabounce", dev->dev.bus_id);
 				device_unregister(&dev->dev);
 			}
 		}

--===============40041771902595347==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40041771902595347==--
