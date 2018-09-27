From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 27 Sep 2018 14:47:56 +0000
Subject: [PATCH net-next] net: sched: make function qdisc_free_cb() static
Message-Id: <1538059676-71316-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Vlad Buslov <vladbu@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

net/sched/sch_generic.c:944:6: warning:
 symbol 'qdisc_free_cb' was not declared. Should it be static?

Fixes: 3a7d0d07a386 ("net: sched: extend Qdisc with rcu")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/sched/sch_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index 531fac1..3023929 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -941,7 +941,7 @@ void qdisc_free(struct Qdisc *qdisc)
 	kfree((char *) qdisc - qdisc->padded);
 }
 
-void qdisc_free_cb(struct rcu_head *head)
+static void qdisc_free_cb(struct rcu_head *head)
 {
 	struct Qdisc *q = container_of(head, struct Qdisc, rcu);
