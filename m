From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:18 +0000
Subject: [PATCH 10/14] thermal: devfreq_cooling: Remove unneeded conversions to bool
Message-Id: <20170315162322.12096-10-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/thermal/devfreq_cooling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 7743a78d4723..b72e2ccc8e40 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -75,7 +75,7 @@ static int partition_enable_opps(struct devfreq_cooling_device *dfc,
 		struct dev_pm_opp *opp;
 		int ret = 0;
 		unsigned int freq = dfc->freq_table[i];
-		bool want_enable = i >= cdev_state ? true : false;
+		bool want_enable = i >= cdev_state;
 
 		opp = dev_pm_opp_find_freq_exact(dev, freq, !want_enable);
 
-- 
2.11.0

