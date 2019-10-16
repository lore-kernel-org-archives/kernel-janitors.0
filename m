From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 16 Oct 2019 18:19:40 +0000
Subject: [PATCH 06/10] thermal: devfreq_cooling: Remove unneeded conversions to bool
Message-Id: <20191016181944.25106-3-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191016181944.25106-1-afd@ti.com>
In-Reply-To: <20191016181944.25106-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/thermal/devfreq_cooling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index ef59256887ff..e386a3241700 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -85,7 +85,7 @@ static int partition_enable_opps(struct devfreq_cooling_device *dfc,
 		struct dev_pm_opp *opp;
 		int ret = 0;
 		unsigned int freq = dfc->freq_table[i];
-		bool want_enable = i >= cdev_state ? true : false;
+		bool want_enable = i >= cdev_state;
 
 		opp = dev_pm_opp_find_freq_exact(dev, freq, !want_enable);
 
-- 
2.17.1
