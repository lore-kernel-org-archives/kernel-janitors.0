From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Mar 2015 11:21:44 +0000
Subject: [patch] thermal: cpu_cooling: check for allocation failure
Message-Id: <20150330112144.GC27144@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>, Javi Merino <javi.merino@arm.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

If this fails, then we're likely in trouble anyway, but it's nice to
keep the code free from static checker warnings so you don't miss more
important bugs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/thermal/cpu_cooling.c b/drivers/thermal/cpu_cooling.c
index c497414..3a01dfd 100644
--- a/drivers/thermal/cpu_cooling.c
+++ b/drivers/thermal/cpu_cooling.c
@@ -329,6 +329,10 @@ static int build_dyn_power_table(struct cpufreq_cooling_device *cpufreq_device,
 	}
 
 	power_table = kcalloc(num_opps, sizeof(*power_table), GFP_KERNEL);
+	if (!power_table) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
 
 	for (freq = 0, i = 0;
 	     opp = dev_pm_opp_find_freq_ceil(dev, &freq), !IS_ERR(opp);
