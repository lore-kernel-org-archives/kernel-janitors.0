From: Christophe Lucas <c.lucas@ifrance.com>
Date: Thu, 10 Feb 2005 10:07:17 +0000
Subject: [KJ] [PATCH] drivers/video/console/*: convert to pci_register_driver
Message-Id: <20050210100717.GD16373@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="C94crkcyjafcjHxo"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_video_console.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/console/sticore.c linux-2.6.11-rc3/drivers/video/console/sticore.c
--- linux-2.6.11-rc3-vanilla/drivers/video/console/sticore.c	2005-02-03 17:04:04.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/console/sticore.c	2005-02-07 09:39:30.000000000 +0100
@@ -1050,7 +1050,7 @@ static void __init sti_init_roms(void)
 
 	/* Register drivers for native & PCI cards */
 	register_parisc_driver(&pa_sti_driver);
-	pci_module_init(&pci_sti_driver);
+	pci_register_driver(&pci_sti_driver);
 
 	/* if we didn't find the given default sti, take the first one */
 	if (!default_sti)

--C94crkcyjafcjHxo
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--C94crkcyjafcjHxo--
