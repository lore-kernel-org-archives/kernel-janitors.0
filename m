From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Apr 2018 08:18:00 +0000
Subject: [PATCH] cpuidle: menu: tidy up some indenting
Message-Id: <20180411081800.GA4625@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Ramesh Thomas <ramesh.thomas@intel.com>, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These lines were indented 4 spaces less than they should have been.  It
was a little confusing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/cpuidle/governors/menu.c b/drivers/cpuidle/governors/menu.c
index 1bfe03ceb236..b733dc6aa42b 100644
--- a/drivers/cpuidle/governors/menu.c
+++ b/drivers/cpuidle/governors/menu.c
@@ -426,8 +426,8 @@ static int menu_select(struct cpuidle_driver *drv, struct cpuidle_device *dev,
 			 * tick, so try to correct that.
 			 */
 			for (i = idx - 1; i >= 0; i--) {
-			    if (drv->states[i].disabled ||
-			        dev->states_usage[i].disable)
+				if (drv->states[i].disabled ||
+				    dev->states_usage[i].disable)
 					continue;
 
 				idx = i;
