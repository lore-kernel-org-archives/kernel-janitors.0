From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 10 Apr 2017 20:20:39 +0000
Subject: [PATCH 3/3] thermal: int340x: Use kcalloc() in int340x_thermal_zone_add()
Message-Id: <26087e0f-74a0-3eb1-7e54-2dafe45d633f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3ba36cc1-8445-462c-ca75-2b0928f3290a@users.sourceforge.net>
In-Reply-To: <3ba36cc1-8445-462c-ca75-2b0928f3290a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 10 Apr 2017 21:56:58 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/thermal/int340x_thermal/int340x_thermal_zone.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/int340x_thermal/int340x_thermal_zone.c b/drivers/thermal/int340x_thermal/int340x_thermal_zone.c
index 145a5c53ff5c..a611f3367168 100644
--- a/drivers/thermal/int340x_thermal/int340x_thermal_zone.c
+++ b/drivers/thermal/int340x_thermal/int340x_thermal_zone.c
@@ -239,9 +239,10 @@ struct int34x_thermal_zone *int340x_thermal_zone_add(struct acpi_device *adev,
 	if (ACPI_FAILURE(status))
 		trip_cnt = 0;
 	else {
-		int34x_thermal_zone->aux_trips = kzalloc(
-				sizeof(*int34x_thermal_zone->aux_trips) *
-				trip_cnt, GFP_KERNEL);
+		int34x_thermal_zone->aux_trips
+			= kcalloc(trip_cnt,
+				  sizeof(*int34x_thermal_zone->aux_trips),
+				  GFP_KERNEL);
 		if (!int34x_thermal_zone->aux_trips) {
 			ret = -ENOMEM;
 			goto err_trip_alloc;
-- 
2.12.2

