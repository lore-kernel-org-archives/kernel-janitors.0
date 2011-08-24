From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Aug 2011 11:31:39 +0000
Subject: [patch -next] wl12xx: fix recent change to wl1271_tm_cmd_nvs_push()
Message-Id: <20110824113139.GE5975@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Coelho <coelho@ti.com>, Shahar Levi <shahar_levi@ti.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "open list:WL1271 WIRELESS D..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

bc765bf3b9a "wl12xx: 1281/1283 support - Loading FW & NVS" had two
problems.  The condition was written so that it failed if "len" was
not equal to sizeof(struct wl1271_nvs_file).  Also we need to release
the locks on these new error paths.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/wl12xx/testmode.c b/drivers/net/wireless/wl12xx/testmode.c
index 88add68..10c1762 100644
--- a/drivers/net/wireless/wl12xx/testmode.c
+++ b/drivers/net/wireless/wl12xx/testmode.c
@@ -208,11 +208,17 @@ static int wl1271_tm_cmd_nvs_push(struct wl1271 *wl, struct nlattr *tb[])
 
 	kfree(wl->nvs);
 
-	if ((wl->chip.id = CHIP_ID_1283_PG20) &&
-	    (len != sizeof(struct wl128x_nvs_file)))
-		return -EINVAL;
-	else if (len != sizeof(struct wl1271_nvs_file))
-		return -EINVAL;
+	if (wl->chip.id = CHIP_ID_1283_PG20) {
+		if (len != sizeof(struct wl128x_nvs_file)) {
+			ret = -EINVAL;
+			goto out;
+		}
+	} else {
+		if (len != sizeof(struct wl1271_nvs_file)) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
 
 	wl->nvs = kzalloc(len, GFP_KERNEL);
 	if (!wl->nvs) {
