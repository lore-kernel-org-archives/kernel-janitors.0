From: Christophe Lucas <c.lucas@ifrance.com>
Date: Fri, 11 Feb 2005 08:28:56 +0000
Subject: [KJ] [PATCH] drivers/scsi/aacraid/*: convert to pci_register_driver
Message-Id: <20050211082856.GC28942@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="i0/AhcQY5QxfSsSZ"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_scsi_aacraid.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/aacraid/linit.c linux-2.6.11-rc3/drivers/scsi/aacraid/linit.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/aacraid/linit.c	2005-02-03 17:03:54.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/aacraid/linit.c	2005-02-07 09:39:29.000000000 +0100
@@ -690,7 +690,7 @@ static int __init aac_init(void)
 	printk(KERN_INFO "Red Hat/Adaptec aacraid driver (%s %s)\n",
 			AAC_DRIVER_VERSION, AAC_DRIVER_BUILD_DATE);
 
-	error = pci_module_init(&aac_pci_driver);
+	error = pci_register_driver(&aac_pci_driver);
 	if (error)
 		return error;
 

--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--i0/AhcQY5QxfSsSZ--
