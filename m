From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 12:47:09 +0000
Subject: [KJ] [PATCH] drivers/net/arcnet/*: convert to pci_register_driver
Message-Id: <20050213124709.GB15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zbGR4y+acU1DwHSi"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_arcnet.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/arcnet/com20020-pci.c linux-2.6.11-rc3/drivers/net/arcnet/com20020-pci.c
--- linux-2.6.11-rc3-vanilla/drivers/net/arcnet/com20020-pci.c	2004-12-24 22:34:01.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/arcnet/com20020-pci.c	2005-02-07 09:39:28.000000000 +0100
@@ -177,7 +177,7 @@ static struct pci_driver com20020pci_dri
 static int __init com20020pci_init(void)
 {
 	BUGLVL(D_NORMAL) printk(VERSION);
-	return pci_module_init(&com20020pci_driver);
+	return pci_register_driver(&com20020pci_driver);
 }
 
 static void __exit com20020pci_cleanup(void)

--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--zbGR4y+acU1DwHSi--
