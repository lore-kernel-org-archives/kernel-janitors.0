From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Sep 2011 07:03:36 +0000
Subject: [patch] suspend: off by one in pm_suspend()
Message-Id: <20110920070336.GA19289@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In enter_state() we use "state" as an offset for the pm_states[]
array.  The pm_states[] array only has PM_SUSPEND_MAX elements so
this test is off by one.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
index 1d58583..4953dc0 100644
--- a/kernel/power/suspend.c
+++ b/kernel/power/suspend.c
@@ -321,7 +321,7 @@ int enter_state(suspend_state_t state)
 int pm_suspend(suspend_state_t state)
 {
 	int ret;
-	if (state > PM_SUSPEND_ON && state <= PM_SUSPEND_MAX) {
+	if (state > PM_SUSPEND_ON && state < PM_SUSPEND_MAX) {
 		ret = enter_state(state);
 		if (ret) {
 			suspend_stats.fail++;
