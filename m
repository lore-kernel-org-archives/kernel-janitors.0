From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 Jul 2020 11:36:10 +0000
Subject: [PATCH] xen/xenbus: Fix a double free in xenbus_map_ring_pv()
Message-Id: <20200710113610.GA92345@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Yan Yankovskyi <yyankovskyi@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org

When there is an error the caller frees "info->node" so the free here
will result in a double free.  We should just delete first kfree().

Fixes: 3848e4e0a32a ("xen/xenbus: avoid large structs and arrays on the stack")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/xen/xenbus/xenbus_client.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 4f168b46fbca..786fbb7d8be0 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -693,10 +693,8 @@ static int xenbus_map_ring_pv(struct xenbus_device *dev,
 	bool leaked;
 
 	area = alloc_vm_area(XEN_PAGE_SIZE * nr_grefs, info->ptes);
-	if (!area) {
-		kfree(node);
+	if (!area)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < nr_grefs; i++)
 		info->phys_addrs[i] -- 
2.27.0
