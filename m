From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 01 Oct 2004 18:11:12 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 sba_iommu.c] Replace
Message-Id: <112650000.1096654272@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60783168850672142=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, davidm@hpl.hp.com, hannal@us.ibm.com

--===============60783168850672142==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away soon I have replaced the call with pci_get_device.
Judith, could you run these 3 ia64 ones through PLM, please? This should complete the
arch/ia64 conversion.

Thanks a lot.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc1-mm5/arch/ia64/hp/common/sba_iommu.c linux-2.6.9-rc1-mm5patch/arch/ia64/hp/common/sba_iommu.c
--- linux-2.6.9-rc1-mm5/arch/ia64/hp/common/sba_iommu.c	2004-09-14 16:25:34.000000000 -0700
+++ linux-2.6.9-rc1-mm5patch/arch/ia64/hp/common/sba_iommu.c	2004-09-21 15:27:16.000000000 -0700
@@ -1556,7 +1556,7 @@ ioc_iova_init(struct ioc *ioc)
 	** We program the next pdir index after we stop w/ a key for
 	** the GART code to handshake on.
 	*/
-	while ((device = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, device)) != NULL)
+	while ((device = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, device)) != NULL)
 		agp_found |= pci_find_capability(device, PCI_CAP_ID_AGP);
 
 	if (agp_found && reserve_sba_gart) {


--===============60783168850672142==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60783168850672142==--
