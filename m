From: Christophe Lucas <c.lucas@ifrance.com>
Date: Fri, 11 Feb 2005 08:31:21 +0000
Subject: [KJ] [PATCH] drivers/scsi/megaraid/*: convert to pci_register_driver
Message-Id: <20050211083121.GE28942@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6WlEvdN9Dv0WHSBl"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_scsi_megaraid.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/megaraid/megaraid_mbox.c linux-2.6.11-rc3/drivers/scsi/megaraid/megaraid_mbox.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/megaraid/megaraid_mbox.c	2005-02-03 17:03:56.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/megaraid/megaraid_mbox.c	2005-02-07 09:39:30.000000000 +0100
@@ -497,7 +497,7 @@ megaraid_init(void)
 
 
 	// register as a PCI hot-plug driver module
-	if ((rval = pci_module_init(&megaraid_pci_driver_g))) {
+	if ((rval = pci_register_driver(&megaraid_pci_driver_g))) {
 		con_log(CL_ANN, (KERN_WARNING
 			"megaraid: could not register hotplug support.\n"));
 	}

--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--6WlEvdN9Dv0WHSBl--
