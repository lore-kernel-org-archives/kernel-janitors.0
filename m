From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 08 Aug 2017 15:09:01 +0000
Subject: [PATCH 7/9 v2] thermal: bcm2835: constify thermal_zone_of_device_ops structures
Message-Id: <1502204943-20075-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502204943-20075-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502204943-20075-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The thermal_zone_of_device_ops structure is only passed as the fourth
argument to thermal_zone_of_sensor_register, which is declared as const.
Thus the thermal_zone_of_device_ops structure itself can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

v2: This patch was present in the original series

 drivers/thermal/broadcom/bcm2835_thermal.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal/broadcom/bcm2835_thermal.c
index e6863c8..a4d6a0e 100644
--- a/drivers/thermal/broadcom/bcm2835_thermal.c
+++ b/drivers/thermal/broadcom/bcm2835_thermal.c
@@ -145,7 +145,7 @@ static void bcm2835_thermal_debugfs(struct platform_device *pdev)
 	debugfs_create_regset32("regset", 0444, data->debugfsdir, regset);
 }
 
-static struct thermal_zone_of_device_ops bcm2835_thermal_ops = {
+static const struct thermal_zone_of_device_ops bcm2835_thermal_ops = {
 	.get_temp = bcm2835_thermal_get_temp,
 };
 

