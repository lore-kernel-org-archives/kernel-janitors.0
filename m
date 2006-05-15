From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 10:18:02 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-integrator/impd1.c
Message-Id: <20060515101802.GH12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12969871961662882=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12969871961662882==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.16.16/arch/arm/mach-integrator/impd1.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-integrator/impd1.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-integrator/impd1.c	2006-05-15 11:56:05.000000000 +0200
@@ -370,7 +370,7 @@
 
 	lm_set_drvdata(dev, impd1);
 
-	printk("IM-PD1 found at 0x%08lx\n", dev->resource.start);
+	printk(KERN_INFO "IM-PD1 found at 0x%08lx\n", dev->resource.start);
 
 	for (i = 0; i < ARRAY_SIZE(impd1->vcos); i++) {
 		impd1->vcos[i].owner = THIS_MODULE,
@@ -409,7 +409,7 @@
 
 		ret = amba_device_register(d, &dev->resource);
 		if (ret) {
-			printk("unable to register device %s: %d\n",
+			printk(KERN_ERR "unable to register device %s: %d\n",
 				d->dev.bus_id, ret);
 			kfree(d);
 		}

--===============12969871961662882==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12969871961662882==--
