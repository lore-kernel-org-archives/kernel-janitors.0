From: Julia Lawall <julia@diku.dk>
Date: Sat, 16 Jan 2010 15:57:16 +0000
Subject: [PATCH 1/9] drivers/char: Eliminate useless code
Message-Id: <Pine.LNX.4.64.1001161656560.28745@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The variable x is initialized twice to the same (side effect-free)
expression.  Drop one initialization.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

// <smpl>
@forall@
idexpression *x;
identifier f!=ERR_PTR;
@@

x = f(...)
... when != x
(
x = f(...,<+...x...+>,...)
|
* x = f(...)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/mmtimer.c              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/mmtimer.c b/drivers/char/mmtimer.c
index 918711a..04fd0d8 100644
--- a/drivers/char/mmtimer.c
+++ b/drivers/char/mmtimer.c
@@ -546,9 +546,9 @@ static void mmtimer_tasklet(unsigned long data)
 {
 	int nodeid = data;
 	struct mmtimer_node *mn = &timers[nodeid];
-	struct mmtimer *x = rb_entry(mn->next, struct mmtimer, list);
+	struct mmtimer *x;
 	struct k_itimer *t;
 	unsigned long flags;
 
