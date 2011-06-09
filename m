From: Dan Carpenter <error27@gmail.com>
Date: Thu, 09 Jun 2011 07:09:34 +0000
Subject: [patch] b43: check for allocation failures
Message-Id: <20110609070934.GE4069@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefano Brivio <stefano.brivio@polimi.it>
Cc: "John W. Linville" <linville@tuxdriver.com>, "open list:B43 WIRELESS DRIVER" <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

Add some error handling if the allocation fails.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/b43/bus.c b/drivers/net/wireless/b43/bus.c
index 6c63aec..8a10b82 100644
--- a/drivers/net/wireless/b43/bus.c
+++ b/drivers/net/wireless/b43/bus.c
@@ -83,7 +83,11 @@ void b43_bus_ssb_block_write(struct b43_bus_dev *dev, const void *buffer,
 
 struct b43_bus_dev *b43_bus_dev_ssb_init(struct ssb_device *sdev)
 {
-	struct b43_bus_dev *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	struct b43_bus_dev *dev;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return NULL;
 
 	dev->bus_type = B43_BUS_SSB;
 	dev->sdev = sdev;
diff --git a/drivers/net/wireless/b43/main.c b/drivers/net/wireless/b43/main.c
index cae3146..c8131a0 100644
--- a/drivers/net/wireless/b43/main.c
+++ b/drivers/net/wireless/b43/main.c
@@ -5025,6 +5025,8 @@ int b43_ssb_probe(struct ssb_device *sdev, const struct ssb_device_id *id)
 	int first = 0;
 
 	dev = b43_bus_dev_ssb_init(sdev);
+	if (!dev)
+		return -ENOMEM;
 
 	wl = ssb_get_devtypedata(sdev);
 	if (!wl) {
