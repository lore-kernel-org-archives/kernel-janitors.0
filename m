From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Feb 2019 09:26:32 +0000
Subject: [PATCH net-next] net: sched: potential NULL dereference in tcf_block_find()
Message-Id: <20190218092632.GB7712@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Vlad Buslov <vladbu@mellanox.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The error code isn't set on this path so it would result in returning
ERR_PTR(0) and a NULL dereference in the caller.

Fixes: 18d3eefb17cf ("net: sched: refactor tcf_block_find() into standalone functions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/sched/cls_api.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
index 266fcb34fefe..aac72b853fe9 100644
--- a/net/sched/cls_api.c
+++ b/net/sched/cls_api.c
@@ -1310,8 +1310,10 @@ static struct tcf_block *tcf_block_find(struct net *net, struct Qdisc **q,
 		goto errout_qdisc;
 
 	block = __tcf_block_find(net, *q, *cl, ifindex, block_index, extack);
-	if (IS_ERR(block))
+	if (IS_ERR(block)) {
+		err = PTR_ERR(block);
 		goto errout_qdisc;
+	}
 
 	return block;
 
-- 
2.17.1
