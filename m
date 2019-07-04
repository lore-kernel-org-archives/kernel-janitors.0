From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Jul 2019 12:50:27 +0000
Subject: [PATCH] RDMA/uverbs: remove redundant assignment to variable ret
Message-Id: <20190704125027.4514-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/core/uverbs_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
index 750c4d484329..7ddd0e5bc6b3 100644
--- a/drivers/infiniband/core/uverbs_cmd.c
+++ b/drivers/infiniband/core/uverbs_cmd.c
@@ -2548,7 +2548,7 @@ static int ib_uverbs_detach_mcast(struct uverbs_attr_bundle *attrs)
 	struct ib_uqp_object         *obj;
 	struct ib_qp                 *qp;
 	struct ib_uverbs_mcast_entry *mcast;
-	int                           ret = -EINVAL;
+	int                           ret;
 	bool                          found = false;
 
 	ret = uverbs_request(attrs, &cmd, sizeof(cmd));
-- 
2.20.1
