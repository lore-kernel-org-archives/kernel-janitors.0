From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 13 Oct 2004 22:17:23 +0000
Subject: [KJ] [PATCH 2.6] firestream.c replace pci_find_device with
Message-Id: <196320000.1097705843@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35952264199279083=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <194130000.1097705759@w-hlinder.beaverton.ibm.com>
In-Reply-To: <194130000.1097705759@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: Hanna Linder <hannal@us.ibm.com>, greg@kroah.com, chas@cmf.nrl.navy.mil

--===============35952264199279083==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away soon I have converted this file to use
pci_get_device instead. I have compile tested it. If anyone has this ATM card
and could test it that would be great.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc4-mm1cln/drivers/atm/firestream.c linux-2.6.9-rc4-mm1patch2/drivers/atm/firestream.c
--- linux-2.6.9-rc4-mm1cln/drivers/atm/firestream.c	2004-10-12 14:15:10.000000000 -0700
+++ linux-2.6.9-rc4-mm1patch2/drivers/atm/firestream.c	2004-10-13 13:51:35.570994152 -0700
@@ -2021,7 +2021,7 @@ int __init fs_detect(void)
 
 	func_enter ();
 	pci_dev = NULL;
-	while ((pci_dev = pci_find_device(PCI_VENDOR_ID_FUJITSU_ME,
+	while ((pci_dev = pci_get_device(PCI_VENDOR_ID_FUJITSU_ME,
 					  PCI_DEVICE_ID_FUJITSU_FS50, 
 					  pci_dev))) {
 		if (fs_register_and_init (pci_dev, &fs_pci_tbl[0]))
@@ -2029,7 +2029,7 @@ int __init fs_detect(void)
 		devs++;
 	}
 
-	while ((pci_dev = pci_find_device(PCI_VENDOR_ID_FUJITSU_ME,
+	while ((pci_dev = pci_get_device(PCI_VENDOR_ID_FUJITSU_ME,
 					  PCI_DEVICE_ID_FUJITSU_FS155, 
 					  pci_dev))) {
 		if (fs_register_and_init (pci_dev, FS_IS155)) 


--===============35952264199279083==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35952264199279083==--
