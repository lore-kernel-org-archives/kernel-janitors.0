From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Dec 2019 05:40:39 +0000
Subject: [PATCH] thermal/drivers/cpu_cooling: Fix an IS_ERR() vs NULL bug
Message-Id: <20191220053750.4wcxgieqmceyhwo5@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amit Daniel Kachhap <amit.kachhap@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Javi Merino <javi.merino@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

The idle_inject_register() function returns NULL on error, it never
returns error pointers.

Fixes: 1e044f70e5c2 ("thermal/drivers/cpu_cooling: Introduce the cpu idle cooling driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/thermal/cpuidle_cooling.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/cpuidle_cooling.c b/drivers/thermal/cpuidle_cooling.c
index 6d778acefeec..ab48387ce868 100644
--- a/drivers/thermal/cpuidle_cooling.c
+++ b/drivers/thermal/cpuidle_cooling.c
@@ -187,8 +187,8 @@ __init cpuidle_of_cooling_register(struct device_node *np,
 	}
 
 	ii_dev = idle_inject_register(drv->cpumask);
-	if (IS_ERR(ii_dev)) {
-		ret = PTR_ERR(ii_dev);
+	if (!ii_dev) {
+		ret = -ENOMEM;
 		goto out_id;
 	}
 
-- 
2.11.0
