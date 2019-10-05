From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Oct 2019 05:23:37 +0000
Subject: [PATCH] uverbs: prevent potential underflow
Message-Id: <20191005052337.GA20129@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Matan Barak <matanb@mellanox.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Shamir Rabinovitch <shamir.rabinovitch@oracle.com>, Matthew Wilcox <willy@infradead.org>, Michael Guralnik <michaelgur@mellanox.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The issue is in drivers/infiniband/core/uverbs_std_types_cq.c in the
UVERBS_HANDLER(UVERBS_METHOD_CQ_CREATE) function.  We check that:

	if (attr.comp_vector >= attrs->ufile->device->num_comp_vectors) {

But we don't check that "attr.comp_vector" whether negative.  It
could potentially lead to an array underflow.  My concern would be where
cq->vector is used in the create_cq() function from the cxgb4 driver.

Fixes: 9ee79fce3642 ("IB/core: Add completion queue (cq) object actions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/core/uverbs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/uverbs.h b/drivers/infiniband/core/uverbs.h
index 1e5aeb39f774..63f7f7db5902 100644
--- a/drivers/infiniband/core/uverbs.h
+++ b/drivers/infiniband/core/uverbs.h
@@ -98,7 +98,7 @@ ib_uverbs_init_udata_buf_or_null(struct ib_udata *udata,
 
 struct ib_uverbs_device {
 	atomic_t				refcount;
-	int					num_comp_vectors;
+	u32					num_comp_vectors;
 	struct completion			comp;
 	struct device				dev;
 	/* First group for device attributes, NULL terminated array */
-- 
2.20.1
