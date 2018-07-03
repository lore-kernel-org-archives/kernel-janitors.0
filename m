From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 03 Jul 2018 13:45:12 +0000
Subject: [PATCH net-next] net: sched: act_pedit: fix possible memory leak in tcf_pedit_init()
Message-Id: <1530625512-122785-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Amir Vadai <amir@vadai.me>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

'keys_ex' is malloced by tcf_pedit_keys_ex_parse() in tcf_pedit_init()
but not all of the error handle path free it, this may cause memory
leak. This patch fix it.

Fixes: 71d0ed7079df ("net/act_pedit: Support using offset relative to the conventional network headers")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/sched/act_pedit.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/net/sched/act_pedit.c b/net/sched/act_pedit.c
index 55bc96b..e43aef2 100644
--- a/net/sched/act_pedit.c
+++ b/net/sched/act_pedit.c
@@ -175,32 +175,35 @@ static int tcf_pedit_init(struct net *net, struct nlattr *nla,
 	if (!tcf_idr_check(tn, parm->index, a, bind)) {
 		if (!parm->nkeys) {
 			NL_SET_ERR_MSG_MOD(extack, "Pedit requires keys to be passed");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out_free;
 		}
 		ret = tcf_idr_create(tn, parm->index, est, a,
 				     &act_pedit_ops, bind, false);
 		if (ret)
-			return ret;
+			goto out_free;
 		p = to_pedit(*a);
 		keys = kmalloc(ksize, GFP_KERNEL);
 		if (!keys) {
 			tcf_idr_release(*a, bind);
-			kfree(keys_ex);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto out_free;
 		}
 		ret = ACT_P_CREATED;
 	} else {
 		if (bind)
-			return 0;
+			goto out_free;
 		tcf_idr_release(*a, bind);
-		if (!ovr)
-			return -EEXIST;
+		if (!ovr) {
+			ret = -EEXIST;
+			goto out_free;
+		}
 		p = to_pedit(*a);
 		if (p->tcfp_nkeys && p->tcfp_nkeys != parm->nkeys) {
 			keys = kmalloc(ksize, GFP_KERNEL);
 			if (!keys) {
-				kfree(keys_ex);
-				return -ENOMEM;
+				ret = -ENOMEM;
+				goto out_free;
 			}
 		}
 	}
@@ -222,6 +225,10 @@ static int tcf_pedit_init(struct net *net, struct nlattr *nla,
 	if (ret = ACT_P_CREATED)
 		tcf_idr_insert(tn, *a);
 	return ret;
+out_free:
+	kfree(keys_ex);
+	return ret;
+
 }
 
 static void tcf_pedit_cleanup(struct tc_action *a)

