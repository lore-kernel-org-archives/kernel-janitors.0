From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Apr 2012 10:57:02 +0000
Subject: [patch] wlcore: release lock on error in wl1271_op_suspend()
Message-Id: <20120416105702.GA25234@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Coelho <coelho@ti.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Eliad Peller <eliad@wizery.com>, Arik Nemtsov <arik@wizery.com>, Shahar Levi <shahar_levi@ti.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We should release this lock before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless/ti/wlcore/main.c
index 2b0f987..23fc0d2 100644
--- a/drivers/net/wireless/ti/wlcore/main.c
+++ b/drivers/net/wireless/ti/wlcore/main.c
@@ -1364,6 +1364,7 @@ static int wl1271_op_suspend(struct ieee80211_hw *hw,
 	wl12xx_for_each_wlvif(wl, wlvif) {
 		ret = wl1271_configure_suspend(wl, wlvif);
 		if (ret < 0) {
+			mutex_unlock(&wl->mutex);
 			wl1271_warning("couldn't prepare device to suspend");
 			return ret;
 		}
