From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 17:49:58 +0000
Subject: [KJ] Re: [PATCH 2.6] pSeries_iommu.c replace pci_find_device with
Message-Id: <72580000.1097257798@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56177562224714461=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <70740000.1097257219@w-hlinder.beaverton.ibm.com>
In-Reply-To: <70740000.1097257219@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: Hanna Linder <hannal@us.ibm.com>, greg@kroah.com, paulus@samba.org, anton@samba.org

--===============56177562224714461==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Friday, October 08, 2004 10:40:19 AM -0700 Hanna Linder <hannal@us.ibm.com> wrote:

> As pci_find_device is going away I've replaced it with pci_get_device.
> If someone with a PPC64 system could test it I would appreciate it.
> 
> Thanks.
> 
> Hanna Linder
> IBM Linux Technology Center
> 
> Signed-off-by: Hanna Linder <hannal@us.ibm.com>

Ooops. Included the wrong patch. Should be:

diff -Nrup linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/pSeries_iommu.c linux-2.6.9-rc3-mm3patch2/arch/ppc64/kernel/pSeries_iommu.c
--- linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/pSeries_iommu.c	2004-09-29 20:04:16.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch2/arch/ppc64/kernel/pSeries_iommu.c	2004-10-08 10:22:35.448365008 -0700
@@ -427,7 +427,7 @@ void iommu_setup_pSeries(void)
 	 * pci device_node.  This means get_iommu_table() won't need to search
 	 * up the device tree to find it.
 	 */
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		mydn = dn = PCI_GET_DN(dev);
 
 		while (dn && dn->iommu_table == NULL)


--===============56177562224714461==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56177562224714461==--
