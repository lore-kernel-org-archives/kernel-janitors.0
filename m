From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Feb 2018 19:30:33 +0000
Subject: [PATCH 2/2] cpufreq: powernow-k8: Delete an unnecessary return statement in two functions
Message-Id: <f673f072-86f3-ed72-e715-bed883551be4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4dd36236-fc39-19e6-c1a7-a094cf13469c@users.sourceforge.net>
In-Reply-To: <4dd36236-fc39-19e6-c1a7-a094cf13469c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Feb 2018 20:14:32 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/cpufreq/powernow-k8.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 460bf22a8a2b..782a8c2a359d 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -122,14 +122,12 @@ static int query_current_values_with_pending_wait(struct powernow_k8_data *data)
 static void count_off_irt(struct powernow_k8_data *data)
 {
 	udelay((1 << data->irt) * 10);
-	return;
 }
 
 /* the voltage stabilization time */
 static void count_off_vst(struct powernow_k8_data *data)
 {
 	udelay(data->vstable * VST_UNITS_20US);
-	return;
 }
 
 /* need to init the control msr to a safe value (for each cpu) */
-- 
2.16.1

