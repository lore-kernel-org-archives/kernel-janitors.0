From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 22:36:12 +0000
Subject: [KJ] [RFT 2.6] isa.c replace pci_find_device with pci_get_device
Message-Id: <84880000.1097274972@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89679351052385814=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, davem@davemloft.net, ecd@skynet.be, jj@sunsite.ms.mff.cuni.cz, anton@samba.org

--===============89679351052385814==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a Sparc64 system could test it I would appreciate it.
Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/sparc64/kernel/isa.c linux-2.6.9-rc3-mm3patch/arch/sparc64/kernel/isa.c
--- linux-2.6.9-rc3-mm3cln/arch/sparc64/kernel/isa.c	2004-09-29 20:04:25.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch/arch/sparc64/kernel/isa.c	2004-10-08 15:22:19.000000000 -0700
@@ -262,7 +262,7 @@ void __init isa_init(void)
 	device = PCI_DEVICE_ID_AL_M1533;
 
 	pdev = NULL;
-	while ((pdev = pci_find_device(vendor, device, pdev)) != NULL) {
+	while ((pdev = pci_get_device(vendor, device, pdev)) != NULL) {
 		struct pcidev_cookie *pdev_cookie;
 		struct pci_pbm_info *pbm;
 		struct sparc_isa_bridge *isa_br;


--===============89679351052385814==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89679351052385814==--
