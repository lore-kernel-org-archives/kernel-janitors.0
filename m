From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Feb 2011 16:47:42 +0000
Subject: [patch] wl12xx: change type from u8 to int
Message-Id: <20110207164742.GE4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Coelho <coelho@ti.com>, shahar_levi@ti.com
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

ret is used to store int types.  Using an u8 will break the error
handling.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/wl12xx/init.c b/drivers/net/wireless/wl12xx/init.c
index 70b3dc8..e430b2a 100644
--- a/drivers/net/wireless/wl12xx/init.c
+++ b/drivers/net/wireless/wl12xx/init.c
@@ -470,7 +470,7 @@ static void wl1271_check_ba_support(struct wl1271 *wl)
 static int wl1271_set_ba_policies(struct wl1271 *wl)
 {
 	u8 tid_index;
-	u8 ret = 0;
+	int ret = 0;
 
 	/* Reset the BA RX indicators */
 	wl->ba_rx_bitmap = 0;
