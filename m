From: lukemauldin@letu.edu
Date: Tue, 11 May 2004 16:52:31 +0000
Subject: [Kernel-janitors] Patches for check_region -> request_region
Message-Id: <RACHAELrp3Ui9DGWnFn0000121a@rachael.letnet.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34771139562841746=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34771139562841746==

This is my first attempt at kernel janitor work.  Any feedback would be  
appreicated. 
 
--- ./drivers/cdrom/isp16.c.orig        2004-05-11 11:39:59.253151928 
+0000 
+++ ./drivers/cdrom/isp16.c     2004-05-11 11:36:25.497647704 +0000 
@@ -121,7 +121,7 @@ int __init isp16_init(void) 
                return (0); 
        } 
  
-       if (check_region(ISP16_IO_BASE, ISP16_IO_SIZE)) { 
+       if (!request_region(ISP16_IO_BASE, ISP16_IO_SIZE)) { 
                printk("ISP16: i/o ports already in use.\n"); 
                return (-EIO); 
        } 
 
--- ./drivers/ide/pci/trm290.c.orig     2004-05-11 11:45:05.170645400 
+0000 
+++ ./drivers/ide/pci/trm290.c  2004-05-11 11:46:40.091215280 +0000 
@@ -375,8 +375,8 @@ void __init init_hwif_trm290 (ide_hwif_t 
                        /* leave lower 10 bits untouched */ 
                        compat += (next_offset += 0x400); 
 #  if 1 
-                       if (check_region(compat + 2, 1)) 
-                               printk(KERN_ERR "%s: check_region failure 
at 0x%04x\n", 
+                       if (!request_region(compat + 2, 1)) 
+                               printk(KERN_ERR "%s: request_region 
failure at 0x%04x\n", 
                                        hwif->name, (compat + 2)); 
                        /* 
                         * The region check is not needed; 
however......... 
 
 
Luke Mauldin 
lukemauldin@letu.edu



--===============34771139562841746==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34771139562841746==--
