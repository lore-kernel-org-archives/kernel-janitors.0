From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 21 Oct 2004 18:38:44 +0000
Subject: [KJ] [PATCH 2.6] hw_random.c: replace pci_find_device
Message-Id: <268450000.1098383924@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24756723801074387=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, jgarzik@pobox.com

--===============24756723801074387==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



As pci_find_device is going away I've replaced it with pci_get_device.
for_each_pci_dev is a macro wrapper around pci_get_device.
If someone with this hardware could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9cln/drivers/char/hw_random.c linux-2.6.9patch3/drivers/char/hw_random.c
--- linux-2.6.9cln/drivers/char/hw_random.c	2004-10-18 16:35:53.000000000 -0700
+++ linux-2.6.9patch3/drivers/char/hw_random.c	2004-10-20 14:52:42.000000000 -0700
@@ -581,7 +581,7 @@ static int __init rng_init (void)
 	DPRINTK ("ENTER\n");
 
 	/* Probe for Intel, AMD RNGs */
-	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+	for_each_pci_dev(pdev) {
 		ent = pci_match_device (rng_pci_tbl, pdev);
 		if (ent) {
 			rng_ops = &rng_vendor_ops[ent->driver_data];


--===============24756723801074387==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24756723801074387==--
