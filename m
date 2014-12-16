From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Dec 2014 23:55:53 +0000
Subject: [patch] thermal: cpu_cooling: small memory leak on error
Message-Id: <20141216235553.GG31467@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

There was a left over return here so the error handling isn't run.
It leads to a small memory leak and a static checker warning.

	drivers/thermal/cpu_cooling.c:351 __cpufreq_cooling_register()
	info: ignoring unreachable code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/thermal/cpu_cooling.c b/drivers/thermal/cpu_cooling.c
index 051eb48..9b45f64 100644
--- a/drivers/thermal/cpu_cooling.c
+++ b/drivers/thermal/cpu_cooling.c
@@ -347,7 +347,6 @@ __cpufreq_cooling_register(struct device_node *np,
 	cpufreq_dev->freq_table = kmalloc(sizeof(*cpufreq_dev->freq_table) *
 					  cpufreq_dev->max_level, GFP_KERNEL);
 	if (!cpufreq_dev->freq_table) {
-		return ERR_PTR(-ENOMEM);
 		cool_dev = ERR_PTR(-ENOMEM);
 		goto free_cdev;
 	}
