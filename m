From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 13 Oct 2004 22:18:30 +0000
Subject: [KJ] [PATCH 2.6] fore200e.c replace pci_find_device with
Message-Id: <196790000.1097705910@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65923034423490967=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <194130000.1097705759@w-hlinder.beaverton.ibm.com>
In-Reply-To: <194130000.1097705759@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: Hanna Linder <hannal@us.ibm.com>, greg@kroah.com, chas@cmf.nrl.navy.mil

--===============65923034423490967==
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
diff -Nrup linux-2.6.9-rc4-mm1cln/drivers/atm/fore200e.c linux-2.6.9-rc4-mm1patch3/drivers/atm/fore200e.c
--- linux-2.6.9-rc4-mm1cln/drivers/atm/fore200e.c	2004-10-12 14:15:10.000000000 -0700
+++ linux-2.6.9-rc4-mm1patch3/drivers/atm/fore200e.c	2004-10-13 13:57:12.000000000 -0700
@@ -644,7 +644,7 @@ fore200e_pca_detect(const struct fore200
     int              count = index;
     
     do {
-	pci_dev = pci_find_device(PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
+	pci_dev = pci_get_device(PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
 	if (pci_dev == NULL)
 	    return NULL;
     } while (count--);


--===============65923034423490967==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65923034423490967==--
