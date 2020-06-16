From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Jun 2020 09:19:49 +0000
Subject: [PATCH] thermal: ti-soc-thermal: Fix reversed condition in ti_thermal_expose_sensor()
Message-Id: <20200616091949.GA11940@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eduardo Valentin <edubezval@gmail.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Keerthy <j-keerthy@ti.com>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-pm@vger.kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This condition is reversed and will cause breakage.

Fixes: 7440f518dad9 ("thermal/drivers/ti-soc-thermal: Avoid dereferencing ERR_PTR")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
index 85776db4bf34..2ce4b19f312a 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -169,7 +169,7 @@ int ti_thermal_expose_sensor(struct ti_bandgap *bgp, int id,
 
 	data = ti_bandgap_get_sensor_data(bgp, id);
 
-	if (!IS_ERR_OR_NULL(data))
+	if (IS_ERR_OR_NULL(data))
 		data = ti_thermal_build_data(bgp, id);
 
 	if (!data)
-- 
2.27.0
