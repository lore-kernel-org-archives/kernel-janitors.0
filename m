From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Aug 2019 10:13:19 +0000
Subject: [PATCH] RDMA/core: Fix error code in stat_get_doit_qp()
Message-Id: <20190809101311.GA17867@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Mark Zhang <markz@mellanox.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Parav Pandit <parav@mellanox.com>, Majd Dibbiny <majd@mellanox.com>, Steve Wise <swise@opengridcomputing.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to set the error codes on these paths.  Currently the only
possible error code is -EMSGSIZE so that's what the patch uses.

Fixes: 83c2c1fcbd08 ("RDMA/nldev: Allow get counter mode through RDMA netlink")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/core/nldev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
index e287b71a1cfd..cc08218f1ef7 100644
--- a/drivers/infiniband/core/nldev.c
+++ b/drivers/infiniband/core/nldev.c
@@ -1952,12 +1952,16 @@ static int stat_get_doit_qp(struct sk_buff *skb, struct nlmsghdr *nlh,
 
 	if (fill_nldev_handle(msg, device) ||
 	    nla_put_u32(msg, RDMA_NLDEV_ATTR_PORT_INDEX, port) ||
-	    nla_put_u32(msg, RDMA_NLDEV_ATTR_STAT_MODE, mode))
+	    nla_put_u32(msg, RDMA_NLDEV_ATTR_STAT_MODE, mode)) {
+		ret = -EMSGSIZE;
 		goto err_msg;
+	}
 
 	if ((mode = RDMA_COUNTER_MODE_AUTO) &&
-	    nla_put_u32(msg, RDMA_NLDEV_ATTR_STAT_AUTO_MODE_MASK, mask))
+	    nla_put_u32(msg, RDMA_NLDEV_ATTR_STAT_AUTO_MODE_MASK, mask)) {
+		ret = -EMSGSIZE;
 		goto err_msg;
+	}
 
 	nlmsg_end(msg, nlh);
 	ib_device_put(device);
-- 
2.20.1
