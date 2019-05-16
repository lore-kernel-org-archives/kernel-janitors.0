From: Colin King <colin.king@canonical.com>
Date: Thu, 16 May 2019 13:12:15 +0000
Subject: [PATCH] RDMA/nldev: add check for null return from call to nlmsg_put
Message-Id: <20190516131215.20411-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

It is possible that nlmsg_put can return a null pointer, currently
this will lead to a null pointer dereference when passing a null
nlh pointer to nlmsg_end.  Fix this by adding a null pointer check.

Addresses-Coverity: ("Dereference null return value")
Fixes: cb7e0e130503 ("RDMA/core: Add interface to read device namespace sharing mode")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/core/nldev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
index 69188cbbd99b..4dc43b6c5a28 100644
--- a/drivers/infiniband/core/nldev.c
+++ b/drivers/infiniband/core/nldev.c
@@ -1367,6 +1367,10 @@ static int nldev_sys_get_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
 			RDMA_NL_GET_TYPE(RDMA_NL_NLDEV,
 					 RDMA_NLDEV_CMD_SYS_GET),
 			0, 0);
+	if (!nlh) {
+		nlmsg_free(msg);
+		return -EMSGSIZE;
+	}
 
 	err = nla_put_u8(msg, RDMA_NLDEV_SYS_ATTR_NETNS_MODE,
 			 (u8)ib_devices_shared_netns);
-- 
2.20.1
