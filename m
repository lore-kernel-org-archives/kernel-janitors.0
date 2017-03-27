From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Mar 2017 17:51:18 +0000
Subject: [PATCH] HID: sony: remove redundant check for -ve err
Message-Id: <20170327175118.28322-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

err is being checked for failure each time it is being updated
so this err check is totally redundant and can be removed

Detected with CoverityScan, CID#1420665 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-sony.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index bb124e339d26..e3c6fe554056 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -2614,9 +2614,6 @@ static int sony_input_configured(struct hid_device *hdev,
 		ret = 0;
 	}
 
-	if (ret < 0)
-		goto err_stop;
-
 	if (sc->quirks & SONY_LED_SUPPORT) {
 		ret = sony_leds_init(sc);
 		if (ret < 0)
-- 
2.11.0

