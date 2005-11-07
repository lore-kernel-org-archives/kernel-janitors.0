From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 07 Nov 2005 13:43:32 +0000
Subject: [KJ] [PATCH -kj] drivers/ide/pci/alim15x3.c: use KERN_WARNING
Message-Id: <20051107134332.GA20786@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72192146197738438=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72192146197738438==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

Index: linux-kj/drivers/ide/pci/alim15x3.c
===================================================================
--- linux-kj.orig/drivers/ide/pci/alim15x3.c	2005-11-07 16:41:06.000000000 +0300
+++ linux-kj/drivers/ide/pci/alim15x3.c	2005-11-07 16:41:07.000000000 +0300
@@ -884,7 +884,7 @@ static int __devinit alim15x3_init_one(s
 	ide_pci_device_t *d = &ali15x3_chipset;
 
 	if(pci_dev_present(ati_rs100))
-		printk(KERN_ERR "Warning: ATI Radeon IGP Northbridge is not yet fully tested.\n");
+		printk(KERN_WARNING "ATI Radeon IGP Northbridge is not yet fully tested.\n");
 
 #if defined(CONFIG_SPARC64)
 	d->init_hwif = init_hwif_common_ali15x3;


--===============72192146197738438==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72192146197738438==--
