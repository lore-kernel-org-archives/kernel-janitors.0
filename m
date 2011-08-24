From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Aug 2011 11:27:46 +0000
Subject: [patch -next] HID: unlock on error path in hid_device_probe()
Message-Id: <20110824112745.GB5975@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>, dh.herrmann@googlemail.com
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

We recently introduced locking into this function, but we missed an
error path which needs an unlock.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 582be00..ed0cd09 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1643,8 +1643,10 @@ static int hid_device_probe(struct device *dev)
 
 	if (!hdev->driver) {
 		id = hid_match_device(hdev, hdrv);
-		if (id = NULL)
-			return -ENODEV;
+		if (id = NULL) {
+			ret = -ENODEV;
+			goto unlock;
+		}
 
 		hdev->driver = hdrv;
 		if (hdrv->probe) {
@@ -1657,7 +1659,7 @@ static int hid_device_probe(struct device *dev)
 		if (ret)
 			hdev->driver = NULL;
 	}
-
+unlock:
 	up(&hdev->driver_lock);
 	return ret;
 }
