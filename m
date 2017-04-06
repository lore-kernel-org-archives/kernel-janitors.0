From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Apr 2017 20:10:47 +0000
Subject: [PATCH 2/2] IB/usnic: Use kcalloc() in usnic_vnic_alloc_res_chunk()
Message-Id: <5d9ef1cc-44c5-b5a3-7ffd-3d94c517f129@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f0a030a8-2a03-f531-57d8-39c2aeae28a4@users.sourceforge.net>
In-Reply-To: <f0a030a8-2a03-f531-57d8-39c2aeae28a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Christian Benvenuti <benve@cisco.com>, Dave Goodell <dgoodell@cisco.com>, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 6 Apr 2017 21:45:33 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/usnic/usnic_vnic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_vnic.c b/drivers/infiniband/hw/usnic/usnic_vnic.c
index e7b0030254da..a00bb9940cea 100644
--- a/drivers/infiniband/hw/usnic/usnic_vnic.c
+++ b/drivers/infiniband/hw/usnic/usnic_vnic.c
@@ -312,7 +312,7 @@ static int usnic_vnic_alloc_res_chunk(struct usnic_vnic *vnic,
 	}
 
 	chunk->cnt = chunk->free_cnt = cnt;
-	chunk->res = kzalloc(sizeof(*(chunk->res))*cnt, GFP_KERNEL);
+	chunk->res = kcalloc(cnt, sizeof(*chunk->res), GFP_KERNEL);
 	if (!chunk->res)
 		return -ENOMEM;
 
-- 
2.12.2

