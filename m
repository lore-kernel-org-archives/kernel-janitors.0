From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 18 Aug 2019 09:10:44 +0000
Subject: [PATCH] RDMA/core: Fix an error handling path in 'res_get_common_doit()'
Message-Id: <20190818091044.8845-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dledford@redhat.com, jgg@ziepe.ca, leon@kernel.org, parav@mellanox.com, majd@mellanox.com, markz@mellanox.com, swise@opengridcomputing.com
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

According to surrounding error paths, it is likely that 'goto err_get;' is
expected here. Otherwise, a call to 'rdma_restrack_put(res);' would be
missing.

Fixes: c5dfe0ea6ffa ("RDMA/nldev: Add resource tracker doit callback")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/infiniband/core/nldev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
index e287b71a1cfd..03272791a5bf 100644
--- a/drivers/infiniband/core/nldev.c
+++ b/drivers/infiniband/core/nldev.c
@@ -1231,7 +1231,7 @@ static int res_get_common_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
 	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
 	if (!msg) {
 		ret = -ENOMEM;
-		goto err;
+		goto err_get;
 	}
 
 	nlh = nlmsg_put(msg, NETLINK_CB(skb).portid, nlh->nlmsg_seq,
-- 
2.20.1
