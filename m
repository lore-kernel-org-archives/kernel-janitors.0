From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 16 Feb 2019 08:19:55 +0000
Subject: [PATCH] net: sched: using kfree_rcu() to simplify the code
Message-Id: <20190216081955.93243-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The callback function of call_rcu() just calls a kfree(), so we
can use kfree_rcu() instead of call_rcu() + callback function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/sched/sch_api.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index 7e4d1cc..53b25b8 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -526,11 +526,6 @@ static struct qdisc_size_table *qdisc_get_stab(struct nlattr *opt,
 	return stab;
 }
 
-static void stab_kfree_rcu(struct rcu_head *head)
-{
-	kfree(container_of(head, struct qdisc_size_table, rcu));
-}
-
 void qdisc_put_stab(struct qdisc_size_table *tab)
 {
 	if (!tab)
@@ -538,7 +533,7 @@ void qdisc_put_stab(struct qdisc_size_table *tab)
 
 	if (--tab->refcnt = 0) {
 		list_del(&tab->list);
-		call_rcu(&tab->rcu, stab_kfree_rcu);
+		kfree_rcu(tab, rcu);
 	}
 }
 EXPORT_SYMBOL(qdisc_put_stab);
