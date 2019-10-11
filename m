From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Oct 2019 13:34:19 +0000
Subject: [PATCH v2] uverbs: prevent potential underflow
Message-Id: <20191011133419.GA22905@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20191008194425.GA28067@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Matan Barak <matanb@mellanox.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@mellanox.com>, Leon Romanovsky <leon@kernel.org>, Shamir Rabinovitch <shamir.rabinovitch@oracle.com>, Michael Guralnik <michaelgur@mellanox.com>, Matthew Wilcox <willy@infradead.org>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The issue is in drivers/infiniband/core/uverbs_std_types_cq.c in the
UVERBS_HANDLER(UVERBS_METHOD_CQ_CREATE) function.  We check that:

        if (attr.comp_vector >= attrs->ufile->device->num_comp_vectors) {

But we don't check that "attr.comp_vector" whether negative.  It
could potentially lead to an array underflow.  My concern would be where
cq->vector is used in the create_cq() function from the cxgb4 driver.

And really "attr.comp_vector" is appears as a u32 to user space so that's
the right type to use.

Fixes: 9ee79fce3642 ("IB/core: Add completion queue (cq) object actions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Change both types to u32

 drivers/infiniband/core/uverbs.h | 2 +-
 include/rdma/ib_verbs.h          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index 6a47ba85c54c..e7e733add99f 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -366,7 +366,7 @@ struct ib_tm_caps {
 
 struct ib_cq_init_attr {
 	unsigned int	cqe;
-	int		comp_vector;
+	u32		comp_vector;
 	u32		flags;
 };
 
-- 
2.20.1
