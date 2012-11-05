From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Nov 2012 06:42:17 +0000
Subject: [patch] xen/privcmd: fix condition in privcmd_close()
Message-Id: <20121105064217.GA26179@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Mukesh Rathor <mukesh.rathor@oracle.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

The parenthesis are in the wrong place so the original code is
equivalent to:

	if (!xen_feature(XENFEAT_writable_descriptor_tables)) { ...

Which obviously was not intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index b9d0898..6011f3b 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -495,7 +495,7 @@ static void privcmd_close(struct vm_area_struct *vma)
 	struct page **pages = vma->vm_private_data;
 	int numpgs = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
 
-	if (!xen_feature(XENFEAT_auto_translated_physmap || !numpgs || !pages))
+	if (!xen_feature(XENFEAT_auto_translated_physmap) || !numpgs || !pages)
 		return;
 
 	xen_unmap_domain_mfn_range(vma, numpgs, pages);
