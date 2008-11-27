From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 27 Nov 2008 19:33:17 +0000
Subject: [PATCH] pkt_sched: fix sparse warning
Message-Id: <492fbbfd.190c660a.1db3.fffffcc3@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>

Impact: make global function static

Fix the following sparse warning:

  net/sched/sch_api.c:192:14: warning: symbol 'qdisc_match_from_root' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 net/sched/sch_api.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index f859dd5..6bc29e8 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -189,7 +189,7 @@ EXPORT_SYMBOL(unregister_qdisc);
    (root qdisc, all its children, children of children etc.)
  */
 
-struct Qdisc *qdisc_match_from_root(struct Qdisc *root, u32 handle)
+static struct Qdisc *qdisc_match_from_root(struct Qdisc *root, u32 handle)
 {
 	struct Qdisc *q;
 
-- 
1.5.6.3

