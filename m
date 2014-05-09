From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 May 2014 11:56:17 +0000
Subject: [patch] iio: hid-sensors: typo leads to potential forever loop
Message-Id: <20140509115617.GC32027@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

The "i < " was missing in this condition.

Fixes: 5d02edfc3957 ('iio: hid-sensors: Convert units and exponent')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c b/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
index 3729646..3052eb1 100644
--- a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
+++ b/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
@@ -327,7 +327,7 @@ int hid_sensor_format_scale(u32 usage_id,
 	*val0 = 1;
 	*val1 = 0;
 
-	for (i = 0; ARRAY_SIZE(unit_conversion); ++i) {
+	for (i = 0; i < ARRAY_SIZE(unit_conversion); ++i) {
 		if (unit_conversion[i].usage_id = usage_id &&
 			unit_conversion[i].unit = attr_info->units) {
 			exp  = hid_sensor_convert_exponent(
