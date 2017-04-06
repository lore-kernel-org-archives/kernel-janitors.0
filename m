From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Apr 2017 20:09:45 +0000
Subject: [PATCH 1/2] IB/usnic: Use kcalloc() in alloc_res_chunk_list()
Message-Id: <db43dde0-c172-a9e5-1878-1bada275d095@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f0a030a8-2a03-f531-57d8-39c2aeae28a4@users.sourceforge.net>
In-Reply-To: <f0a030a8-2a03-f531-57d8-39c2aeae28a4-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christian Benvenuti <benve-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Dave Goodell <dgoodell-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 6 Apr 2017 20:32:39 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c b/drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c
index 092d4e11a633..817f0475d9fe 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c
@@ -545,8 +545,8 @@ alloc_res_chunk_list(struct usnic_vnic *vnic,
 		/* Do Nothing */
 	}
 
-	res_chunk_list = kzalloc(sizeof(*res_chunk_list)*(res_lst_sz+1),
-					GFP_ATOMIC);
+	res_chunk_list = kcalloc(res_lst_sz + 1, sizeof(*res_chunk_list),
+				 GFP_ATOMIC);
 	if (!res_chunk_list)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.12.2

