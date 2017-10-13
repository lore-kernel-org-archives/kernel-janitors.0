From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Oct 2017 10:56:02 +0000
Subject: [PATCH] IB/hfi1: Fix a wrapping test (make it less strict)
Message-Id: <20171013105559.tqzh6jhcnvmqhdwy@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dennis Dalessandro <dennis.dalessandro-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The "2 * UINT_MAX" overflows so the test is essentially doing this:

	if ((u64)(ts - cce->timestamp) > UINT_MAX - 1) {

I've changed it to a 64bit type.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/infiniband/hw/hfi1/mad.c b/drivers/infiniband/hw/hfi1/mad.c
index f4c0ffc040cc..3aeea8afd44f 100644
--- a/drivers/infiniband/hw/hfi1/mad.c
+++ b/drivers/infiniband/hw/hfi1/mad.c
@@ -3781,7 +3781,7 @@ static int __subn_get_opa_hfi1_cong_log(struct opa_smp *smp, u32 am,
 		 * required to wrap the counter are supposed to
 		 * be zeroed (CA10-49 IBTA, release 1.2.1, V1).
 		 */
-		if ((u64)(ts - cce->timestamp) > (2 * UINT_MAX))
+		if ((u64)(ts - cce->timestamp) > (2ULL * UINT_MAX))
 			continue;
 		memcpy(cong_log->events[i].local_qp_cn_entry, &cce->lqpn, 3);
 		memcpy(cong_log->events[i].remote_qp_number_cn_entry,
