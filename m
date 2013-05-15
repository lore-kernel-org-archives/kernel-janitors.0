From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2013 06:56:24 +0000
Subject: [patch -resend] xen/privcmd: fix condition in privcmd_close()
Message-Id: <20130515065624.GA20381@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121105064217.GA26179@elgon.mountain>
In-Reply-To: <20121105064217.GA26179@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

The parenthesis are in the wrong place so the original code is
equivalent to:

	if (!xen_feature(0x1)) { ...
Or:
        if (!xen_feature(XENFEAT_writable_descriptor_tables)) { ...

Which obviously was not intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I sent this last November but it was never merged.

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index ca2b00e..2cfc24d 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -504,7 +504,7 @@ static void privcmd_close(struct vm_area_struct *vma)
 	struct page **pages = vma->vm_private_data;
 	int numpgs = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
 
-	if (!xen_feature(XENFEAT_auto_translated_physmap || !numpgs || !pages))
+	if (!xen_feature(XENFEAT_auto_translated_physmap) || !numpgs || !pages)
 		return;
 
 	xen_unmap_domain_mfn_range(vma, numpgs, pages);
