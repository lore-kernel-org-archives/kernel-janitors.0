From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 13 Oct 2004 22:19:30 +0000
Subject: [KJ] [PATCH 2.6] horizon.c: replace pci_find_device with
Message-Id: <197250000.1097705970@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22482263508265335=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <194130000.1097705759@w-hlinder.beaverton.ibm.com>
In-Reply-To: <194130000.1097705759@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: Hanna Linder <hannal@us.ibm.com>, greg@kroah.com, chas@cmf.nrl.navy.mil

--===============22482263508265335==
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

diff -Nrup linux-2.6.9-rc4-mm1cln/drivers/atm/horizon.c linux-2.6.9-rc4-mm1patch/drivers/atm/horizon.c
--- linux-2.6.9-rc4-mm1cln/drivers/atm/horizon.c	2004-10-12 14:15:10.000000000 -0700
+++ linux-2.6.9-rc4-mm1patch/drivers/atm/horizon.c	2004-10-13 14:52:43.218426992 -0700
@@ -2727,7 +2727,7 @@ static int __init hrz_probe (void) {
   
   devs = 0;
   pci_dev = NULL;
-  while ((pci_dev = pci_find_device
+  while ((pci_dev = pci_get_device
 	  (PCI_VENDOR_ID_MADGE, PCI_DEVICE_ID_MADGE_HORIZON, pci_dev)
 	  )) {
     hrz_dev * dev;


--===============22482263508265335==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22482263508265335==--
