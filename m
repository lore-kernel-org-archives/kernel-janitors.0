From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Nov 2017 08:09:45 +0000
Subject: [PATCH] net: sched: cls_u32: use bitwise & rather than logical && on n->flags
Message-Id: <20171103080945.27155-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently n->flags is being operated on by a logical && operator rather
than a bitwise & operator. This looks incorrect as these should be bit
flag operations. Fix this.

Detected by CoverityScan, CID#1460398 ("Logical vs. bitwise operator")

Fixes: 245dc5121a9b ("net: sched: cls_u32: call block callbacks for offload")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sched/cls_u32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/cls_u32.c b/net/sched/cls_u32.c
index 86145867b424..2737b71854c9 100644
--- a/net/sched/cls_u32.c
+++ b/net/sched/cls_u32.c
@@ -572,7 +572,7 @@ static int u32_replace_hw_knode(struct tcf_proto *tp, struct tc_u_knode *n,
 		n->flags |= TCA_CLS_FLAGS_IN_HW;
 	}
 
-	if (skip_sw && !(n->flags && TCA_CLS_FLAGS_IN_HW))
+	if (skip_sw && !(n->flags & TCA_CLS_FLAGS_IN_HW))
 		return -EINVAL;
 
 	return 0;
-- 
2.14.1

