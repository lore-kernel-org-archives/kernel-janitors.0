From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 18:24:08 +0000
Subject: [patch 1/2] xen-gntalloc: integer overflow in gntalloc_ioctl_alloc()
Message-Id: <20111104182408.GD5796@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
Cc: kernel-janitors@vger.kernel.org, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

On 32 bit systems a high value of op.count could lead to an integer
overflow in the kzalloc() and gref_ids would be smaller than
expected.  If the you triggered another integer overflow in
"if (gref_size + op.count > limit)" then you'd probably get memory
corruption inside add_grefs().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
index f6832f4..23c60cf 100644
--- a/drivers/xen/gntalloc.c
+++ b/drivers/xen/gntalloc.c
@@ -280,7 +280,7 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
 		goto out;
 	}
 
-	gref_ids = kzalloc(sizeof(gref_ids[0]) * op.count, GFP_TEMPORARY);
+	gref_ids = kcalloc(op.count, sizeof(gref_ids[0]), GFP_TEMPORARY);
 	if (!gref_ids) {
 		rc = -ENOMEM;
 		goto out;
