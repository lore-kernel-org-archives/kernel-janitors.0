From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Oct 2017 19:21:34 +0000
Subject: [PATCH 1/5] powerpc-pseries: Delete five error messages for a failed memory allocation
Message-Id: <8cdd700c-47d1-0819-a3d1-17f79db45f8c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d221be4-1402-0499-d95e-afa4a30e1f33@users.sourceforge.net>
In-Reply-To: <0d221be4-1402-0499-d95e-afa4a30e1f33@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Morton <akpm@linux-foundation.org>, Bart Van Assche <bart.vanassche@sandisk.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Gibson <david@gibson.dropbear.id.au>, Doug Ledford <dledford@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Sahil Mehta <sahilmehta17@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Oct 2017 16:39:01 +0200

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/pseries/dtl.c       |  5 +----
 arch/powerpc/platforms/pseries/hvcserver.c |  2 --
 arch/powerpc/platforms/pseries/iommu.c     | 11 +++--------
 arch/powerpc/platforms/pseries/vio.c       |  4 +---
 4 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 18014cdeb590..467b9f578a7d 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -203,11 +203,8 @@ static int dtl_enable(struct dtl *dtl)
 
 	n_entries = dtl_buf_entries;
 	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL, cpu_to_node(dtl->cpu));
-	if (!buf) {
-		printk(KERN_WARNING "%s: buffer alloc failed for cpu %d\n",
-				__func__, dtl->cpu);
+	if (!buf)
 		return -ENOMEM;
-	}
 
 	spin_lock(&dtl->lock);
 	rc = -EBUSY;
diff --git a/arch/powerpc/platforms/pseries/hvcserver.c b/arch/powerpc/platforms/pseries/hvcserver.c
index 94a6e5612b0d..db2c20e65a58 100644
--- a/arch/powerpc/platforms/pseries/hvcserver.c
+++ b/arch/powerpc/platforms/pseries/hvcserver.c
@@ -177,8 +177,6 @@ int hvcs_get_partner_info(uint32_t unit_address, struct list_head *head,
 				GFP_ATOMIC);
 
 		if (!next_partner_info) {
-			printk(KERN_WARNING "HVCONSOLE: kmalloc() failed to"
-				" allocate partner info struct.\n");
 			hvcs_free_partner_info(head);
 			return -ENOMEM;
 		}
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 7c181467d0ad..c92822fdf269 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1063,19 +1063,14 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	}
 	len = order_base_2(max_addr);
 	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
-	if (!win64) {
-		dev_info(&dev->dev,
-			"couldn't allocate property for 64bit dma window\n");
+	if (!win64)
 		goto out_failed;
-	}
+
 	win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
 	win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
 	win64->length = sizeof(*ddwprop);
-	if (!win64->name || !win64->value) {
-		dev_info(&dev->dev,
-			"couldn't allocate property name and value\n");
+	if (!win64->name || !win64->value)
 		goto out_free_prop;
-	}
 
 	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
 	if (ret != 0)
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 12277bc9fd9e..74b919040e68 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1386,10 +1386,8 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
 
 	/* allocate a vio_dev for this node */
 	viodev = kzalloc(sizeof(struct vio_dev), GFP_KERNEL);
-	if (viodev = NULL) {
-		pr_warn("%s: allocation failure for VIO device.\n", __func__);
+	if (!viodev)
 		return NULL;
-	}
 
 	/* we need the 'device_type' property, in order to match with drivers */
 	viodev->family = family;
-- 
2.14.2

