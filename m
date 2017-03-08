From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Mar 2017 13:10:33 +0000
Subject: [PATCH 14/26] IB/ocrdma: Improve another size determination in ocrdma_add()
Message-Id: <97417c29-a9d0-d30b-952a-3b3325a52bcf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
In-Reply-To: <fc421509-4069-da8a-b308-60b49ea91ada-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 7 Mar 2017 22:12:36 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/ocrdma/ocrdma_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_main.c b/drivers/infiniband/hw/ocrdma/ocrdma_main.c
index 9caa4c564e34..c49b4491d4e7 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_main.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_main.c
@@ -303,7 +303,7 @@ static struct ocrdma_dev *ocrdma_add(struct be_dev_info *dev_info)
 	u8 lstate = 0;
 	struct ocrdma_dev *dev;
 
-	dev = (struct ocrdma_dev *)ib_alloc_device(sizeof(struct ocrdma_dev));
+	dev = (struct ocrdma_dev *)ib_alloc_device(sizeof(*dev));
 	if (!dev) {
 		pr_err("Unable to allocate ib device\n");
 		return NULL;
-- 
2.12.0

