From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 May 2019 08:20:24 +0000
Subject: [PATCH] RDMA/uverbs: check for allocation failure in uapi_add_elm()
Message-Id: <20190530082024.GA11836@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If the kzalloc() fails then we should return ERR_PTR(-ENOMEM).  In the
current code it's possible that the kzalloc() fails and the
radix_tree_insert() inserts the NULL pointer successfully and we return
the NULL "elm" pointer to the caller.  That results in a NULL pointer
dereference.

Fixes: 9ed3e5f44772 ("IB/uverbs: Build the specs into a radix tree at runtime")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/core/uverbs_uapi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
index 7a987acf0c0b..ccc4be0a6566 100644
--- a/drivers/infiniband/core/uverbs_uapi.c
+++ b/drivers/infiniband/core/uverbs_uapi.c
@@ -22,6 +22,8 @@ static void *uapi_add_elm(struct uverbs_api *uapi, u32 key, size_t alloc_size)
 		return ERR_PTR(-EOVERFLOW);
 
 	elm = kzalloc(alloc_size, GFP_KERNEL);
+	if (!elm)
+		return ERR_PTR(-ENOMEM);
 	rc = radix_tree_insert(&uapi->radix, key, elm);
 	if (rc) {
 		kfree(elm);
-- 
2.20.1
