From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 15:25:31 +0000
Subject: [KJ] [PATCH] drivers/pcmcia/*: convert to pci_register_driver
Message-Id: <20050208152531.GR31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="4QzzFpAwbwI4hdN6"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--4QzzFpAwbwI4hdN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--4QzzFpAwbwI4hdN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_pcmcia.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/pcmcia/pd6729.c linux-2.6.11-rc3/drivers/pcmcia/pd6729.c
--- linux-2.6.11-rc3-vanilla/drivers/pcmcia/pd6729.c	2005-02-03 17:03:53.000000000 +0100
+++ linux-2.6.11-rc3/drivers/pcmcia/pd6729.c	2005-02-07 09:40:29.000000000 +0100
@@ -865,7 +865,7 @@ static struct pci_driver pd6729_pci_drv 
 
 static int pd6729_module_init(void)
 {
-	return pci_module_init(&pd6729_pci_drv);
+	return pci_register_driver(&pd6729_pci_drv);
 }
 
 static void pd6729_module_exit(void)

--4QzzFpAwbwI4hdN6
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--4QzzFpAwbwI4hdN6--
