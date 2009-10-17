From: Julia Lawall <julia@diku.dk>
Date: Sat, 17 Oct 2009 06:40:34 +0000
Subject: [PATCH 8/14] drivers/cpuidle: Move dereference after NULL test
Message-Id: <Pine.LNX.4.64.0910170840030.9213@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

It does not seem possible that ldev can be NULL, so drop the unnecessary
test.  If ldev can somehow be NULL, then the initialization of last_idx
should be moved below the test.

A simplified version of the semantic match that detects this problem is as
follows (http://coccinelle.lip6.fr/):

// <smpl>
@match exists@
expression x, E;
identifier fld;
@@

* x->fld
  ... when != \(x = E\|&x\)
* x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/cpuidle/governors/ladder.c  |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/governors/ladder.c b/drivers/cpuidle/governors/ladder.c
index a4bec3f..1c1ceb4 100644
--- a/drivers/cpuidle/governors/ladder.c
+++ b/drivers/cpuidle/governors/ladder.c
@@ -69,9 +69,6 @@ static int ladder_select_state(struct cpuidle_device *dev)
 	int last_residency, last_idx = ldev->last_state_idx;
 	int latency_req = pm_qos_requirement(PM_QOS_CPU_DMA_LATENCY);
 
-	if (unlikely(!ldev))
-		return 0;
-
 	/* Special case when user has set very strict latency requirement */
 	if (unlikely(latency_req = 0)) {
 		ladder_do_selection(ldev, last_idx, 0);
