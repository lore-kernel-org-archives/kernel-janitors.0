From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 21 Oct 2004 18:35:49 +0000
Subject: [KJ] [PATCH 2.6] cyclades.c: replace pci_find_device
Message-Id: <267570000.1098383749@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45155433415083701=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, Marcelo Tosatti <marcelo.tosatti@cyclades.com>

--===============45155433415083701==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I've replaced it with pci_get_device.
If someone with this hardware could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9cln/drivers/char/cyclades.c linux-2.6.9patch/drivers/char/cyclades.c
--- linux-2.6.9cln/drivers/char/cyclades.c	2004-10-18 16:35:53.000000000 -0700
+++ linux-2.6.9patch/drivers/char/cyclades.c	2004-10-20 15:31:49.803025392 -0700
@@ -4765,7 +4765,7 @@ cy_detect_pci(void)
         for (i = 0; i < NR_CARDS; i++) {
                 /* look for a Cyclades card by vendor and device id */
                 while((device_id = cy_pci_dev_id[dev_index]) != 0) {
-                        if((pdev = pci_find_device(PCI_VENDOR_ID_CYCLADES,
+                        if((pdev = pci_get_device(PCI_VENDOR_ID_CYCLADES,
                                         device_id, pdev)) == NULL) {
                                 dev_index++;    /* try next device id */
                         } else {


--===============45155433415083701==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45155433415083701==--
