From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 30 Oct 2018 15:14:59 +0000
Subject: [PATCH 1/2] thermal: armada: constify thermal_zone_of_device_ops structure
Message-Id: <1540912500-21941-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540912500-21941-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540912500-21941-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>
Cc: kernel-janitors@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

The thermal_zone_of_device_ops structure can be const as it is only
passed as the last argument of devm_thermal_zone_of_sensor_register
and the corresponding parameter is declared as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/thermal/armada_thermal.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
--- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -395,7 +395,7 @@ unlock_mutex:
 	return ret;
 }
 
-static struct thermal_zone_of_device_ops of_ops = {
+static const struct thermal_zone_of_device_ops of_ops = {
 	.get_temp = armada_get_temp,
 };
 
