From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Feb 2012 09:20:04 +0000
Subject: [patch] wl12xx: remove some dead code in wl1271_plt_init()
Message-Id: <20120208092004.GB6554@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Coelho <coelho@ti.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Shahar Levi <shahar_levi@ti.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" has already been checked at this point, and we don't need to check
it again.  This was left around from a previous patch 49d750ca14
"wl12xx: 1281/1283 support - New radio structs and functions".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/wl12xx/main.c b/drivers/net/wireless/wl12xx/main.c
index f8748ce..96d90e7 100644
--- a/drivers/net/wireless/wl12xx/main.c
+++ b/drivers/net/wireless/wl12xx/main.c
@@ -672,8 +672,6 @@ static int wl1271_plt_init(struct wl1271 *wl)
 		if (ret < 0)
 			return ret;
 	}
-	if (ret < 0)
-		return ret;
 
 	/* Chip-specific initializations */
 	ret = wl1271_chip_specific_init(wl);
