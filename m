From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 14:20:27 +0000
Subject: [KJ] [PATCH] drivers/macintoshisdn/*: convert to pci_register_driver
Message-Id: <20050208142027.GO31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="i0LFOk513GRb+T2w"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--i0LFOk513GRb+T2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--i0LFOk513GRb+T2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_macintosh.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/macintosh/macio_asic.c linux-2.6.11-rc3/drivers/macintosh/macio_asic.c
--- linux-2.6.11-rc3-vanilla/drivers/macintosh/macio_asic.c	2004-12-24 22:34:31.000000000 +0100
+++ linux-2.6.11-rc3/drivers/macintosh/macio_asic.c	2005-02-07 09:39:27.000000000 +0100
@@ -617,7 +617,7 @@ static int __init macio_module_init (voi
 #ifdef CONFIG_PCI
 	int rc;
 
-	rc = pci_module_init(&macio_pci_driver);
+	rc = pci_register_driver(&macio_pci_driver);
 	if (rc)
 		return rc;
 #endif /* CONFIG_PCI */

--i0LFOk513GRb+T2w
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--i0LFOk513GRb+T2w--
