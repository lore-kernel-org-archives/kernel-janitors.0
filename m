From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Apr 2020 14:58:44 +0000
Subject: [PATCH] platform/chrome: cros_ec_sensorhub: Add missing '\n' in log messages
Message-Id: <20200411145844.29542-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407092935.GJ68494@mwanda>
In-Reply-To: <20200407092935.GJ68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bleung@chromium.org, enric.balletbo@collabora.com, groeck@chromium.org, andy.shevchenko@gmail.com, Jonathan.Cameron@huawei.com
Cc: gwendal@chromium.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 230e6cf3da2f..c51af569708f 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -820,7 +820,7 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
 	if (fifo_info->count > sensorhub->fifo_size ||
 	    fifo_info->size != sensorhub->fifo_size) {
 		dev_warn(sensorhub->dev,
-			 "Mismatch EC data: count %d, size %d - expected %d",
+			 "Mismatch EC data: count %d, size %d - expected %d\n",
 			 fifo_info->count, fifo_info->size,
 			 sensorhub->fifo_size);
 		goto error;
@@ -851,14 +851,14 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
 		}
 		if (number_data > fifo_info->count - i) {
 			dev_warn(sensorhub->dev,
-				 "Invalid EC data: too many entry received: %d, expected %d",
+				 "Invalid EC data: too many entry received: %d, expected %d\n",
 				 number_data, fifo_info->count - i);
 			break;
 		}
 		if (out + number_data >
 		    sensorhub->ring + fifo_info->count) {
 			dev_warn(sensorhub->dev,
-				 "Too many samples: %d (%zd data) to %d entries for expected %d entries",
+				 "Too many samples: %d (%zd data) to %d entries for expected %d entries\n",
 				 i, out - sensorhub->ring, i + number_data,
 				 fifo_info->count);
 			break;
-- 
2.20.1
