From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Sep 2018 13:46:48 +0000
Subject: [PATCH net] net: sched: act_ipt: check for underflow in __tcf_ipt_init()
Message-Id: <20180922134648.GA7027@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Patrick McHardy <kaber@trash.net>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If "td->u.target_size" is larger than sizeof(struct xt_entry_target) we
return -EINVAL.  But we don't check whether it's smaller than
sizeof(struct xt_entry_target) and that could lead to an out of bounds
read.

Fixes: 7ba699c604ab ("[NET_SCHED]: Convert actions from rtnetlink to new netlink API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I haven't tested this.  Please review carefully.

diff --git a/net/sched/act_ipt.c b/net/sched/act_ipt.c
index 1efbfb10b1fc..8af6c11d2482 100644
--- a/net/sched/act_ipt.c
+++ b/net/sched/act_ipt.c
@@ -135,7 +135,7 @@ static int __tcf_ipt_init(struct net *net, unsigned int id, struct nlattr *nla,
 	}
 
 	td = (struct xt_entry_target *)nla_data(tb[TCA_IPT_TARG]);
-	if (nla_len(tb[TCA_IPT_TARG]) < td->u.target_size) {
+	if (nla_len(tb[TCA_IPT_TARG]) != td->u.target_size) {
 		if (exists)
 			tcf_idr_release(*a, bind);
 		else
