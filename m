From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 20:18:57 +0000
Subject: [PATCH 3/7] HID: sensor-hub: Adjust two checks for null pointers in sensor_hub_probe()
Message-Id: <89ec267f-cae0-66b2-bcd7-27d786af3a5f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2d526d72-a740-367b-04a9-ed698435f8ed@users.sourceforge.net>
In-Reply-To: <2d526d72-a740-367b-04a9-ed698435f8ed@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-iio@vger.kernel.org, linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Henrik Rydberg <rydberg@bitmath.org>, Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 20:00:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-sensor-hub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index feb4bb8ee3ec..4eadaef19e6a 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -675,7 +675,7 @@ static int sensor_hub_probe(struct hid_device *hdev,
 			       dev_cnt,
 			       sizeof(*sd->hid_sensor_hub_client_devs),
 			       GFP_KERNEL);
-	if (sd->hid_sensor_hub_client_devs = NULL) {
+	if (!sd->hid_sensor_hub_client_devs) {
 		ret = -ENOMEM;
 		goto err_stop_hw;
 	}
@@ -711,7 +711,7 @@ static int sensor_hub_probe(struct hid_device *hdev,
 			name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
 					      "HID-SENSOR-%x",
 					      collection->usage);
-			if (name = NULL) {
+			if (!name) {
 				hid_err(hdev, "Failed MFD device name\n");
 				ret = -ENOMEM;
 				goto err_stop_hw;
-- 
2.12.2

