From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 13 Oct 2004 22:20:24 +0000
Subject: [KJ] [PATCH 2.6] zatm.c: replace pci_find_device with pci_get_device
Message-Id: <197610000.1097706024@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10992768533551156=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <194130000.1097705759@w-hlinder.beaverton.ibm.com>
In-Reply-To: <194130000.1097705759@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: Hanna Linder <hannal@us.ibm.com>, greg@kroah.com, chas@cmf.nrl.navy.mil

--===============10992768533551156==
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

diff -Nrup linux-2.6.9-rc4-mm1cln/drivers/atm/zatm.c linux-2.6.9-rc4-mm1patch2/drivers/atm/zatm.c
--- linux-2.6.9-rc4-mm1cln/drivers/atm/zatm.c	2004-10-12 14:15:10.000000000 -0700
+++ linux-2.6.9-rc4-mm1patch2/drivers/atm/zatm.c	2004-10-13 14:53:39.875813760 -0700
@@ -1591,7 +1591,7 @@ static int __init zatm_module_init(void)
 		struct pci_dev *pci_dev;
 
 		pci_dev = NULL;
-		while ((pci_dev = pci_find_device(PCI_VENDOR_ID_ZEITNET,type ?
+		while ((pci_dev = pci_get_device(PCI_VENDOR_ID_ZEITNET,type ?
 		    PCI_DEVICE_ID_ZEITNET_1225 : PCI_DEVICE_ID_ZEITNET_1221,
 		    pci_dev))) {
 			if (pci_enable_device(pci_dev)) break;


--===============10992768533551156==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10992768533551156==--
