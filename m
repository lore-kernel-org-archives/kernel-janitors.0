From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 05 Aug 2017 20:37:15 +0000
Subject: [PATCH 2/4] thermal: zx2967: constify thermal_zone_of_device_ops structures
Message-Id: <1501965437-30730-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501965437-30730-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501965437-30730-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

The thermal_zone_of_device_ops structure is only passed as the fourth
argument to thermal_zone_of_sensor_register, which is declared as const.
Thus the thermal_zone_of_device_ops structure itself can be const.

Done with the help of Coccinelle.

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct thermal_zone_of_device_ops i@p = { ... };

@ok1@
identifier r.i;
expression e1,e2,e3;
position p;
@@
thermal_zone_of_sensor_register(e1,e2,e3,&i@p)

@bad@
position p != {r.p,ok1.p};
identifier r.i;
struct thermal_zone_of_device_ops e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct thermal_zone_of_device_ops i = { ... };
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/thermal/zx2967_thermal.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/zx2967_thermal.c b/drivers/thermal/zx2967_thermal.c
index a5670ad..6acce0b 100644
--- a/drivers/thermal/zx2967_thermal.c
+++ b/drivers/thermal/zx2967_thermal.c
@@ -111,7 +111,7 @@ static int zx2967_thermal_get_temp(void *data, int *temp)
 	return ret;
 }
 
-static struct thermal_zone_of_device_ops zx2967_of_thermal_ops = {
+static const struct thermal_zone_of_device_ops zx2967_of_thermal_ops = {
 	.get_temp = zx2967_thermal_get_temp,
 };
 

