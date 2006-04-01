From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sat, 01 Apr 2006 04:28:04 +0000
Subject: [KJ][Patch] fix kbuild warnings in savagefb.o
Message-Id: <1143865685.7835.32.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69386933194500156=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69386933194500156==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list


There are a few kbuild warnings in drivers/video/savage/


WARNING: drivers/video/savage/savagefb.o - Section mismatch: reference
to .init.data:savagefb_devices from .data between 'savagefb_driver' (at
offset 0x38) and 'savagefb_ops'


This one is the same false positive for the pci device id as before.



WARNING: drivers/video/savage/savagefb.o - Section mismatch: reference
to .init.text: from .exit.text after 'savagefb_remove' (at offset 0x6e)
WARNING: drivers/video/savage/savagefb.o - Section mismatch: reference
to .init.text: from .exit.text after 'savagefb_remove' (at offset 0x66)


These two are caused by savagefb_remove() which is marked __devexit
calling savage_unmap_mmio() and savage_unmap_video() which are marked as
__devinit.



WARNING: drivers/video/savage/savagefb.o - Section mismatch: reference
to .init.text: from .text between 'savagefb_resume' (at offset 0x232b)
and 'savage4_gpio_getscl'


This one is caused by savagefb_resume() which is  un-annotated calling
savage_init_hw() which is marked as __devinit.

The patch below removes the __devinit annotations in all three cases.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>



--- linux-2.6.16-git13/drivers/video/savage/savagefb_driver.c.orig	2006-04-01 14:12:39.000000000 +1100
+++ linux-2.6.16-git13/drivers/video/savage/savagefb_driver.c	2006-04-01 14:41:24.000000000 +1100
@@ -1545,7 +1545,7 @@ static int __devinit savage_map_mmio (st
 	return 0;
 }
 
-static void __devinit savage_unmap_mmio (struct fb_info *info)
+static void savage_unmap_mmio (struct fb_info *info)
 {
 	struct savagefb_par *par = info->par;
 	DBG ("savage_unmap_mmio");
@@ -1597,7 +1597,7 @@ static int __devinit savage_map_video (s
 	return 0;
 }
 
-static void __devinit savage_unmap_video (struct fb_info *info)
+static void savage_unmap_video (struct fb_info *info)
 {
 	struct savagefb_par *par = info->par;
 
@@ -1614,7 +1614,7 @@ static void __devinit savage_unmap_video
 	}
 }
 
-static int __devinit savage_init_hw (struct savagefb_par *par)
+static int savage_init_hw (struct savagefb_par *par)
 {
 	unsigned char config1, m, n, n1, n2, sr8, cr3f, cr66 = 0, tmp;
 



--===============69386933194500156==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69386933194500156==--
