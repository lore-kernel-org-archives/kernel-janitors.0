From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Nov 2019 22:52:10 +0000
Subject: [PATCH] rtc: meson: remove redundant assignment to variable retries
Message-Id: <20191122225210.109172-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kevin Hilman <khilman@baylibre.com>, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retries is being initialized with a value that is never
read and it is being updated later with a new value in a for-loop.
The initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index 9bd8478db34b..47ebcf834cc2 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -131,7 +131,7 @@ static u32 meson_rtc_get_data(struct meson_rtc *rtc)
 
 static int meson_rtc_get_bus(struct meson_rtc *rtc)
 {
-	int ret, retries = 3;
+	int ret, retries;
 	u32 val;
 
 	/* prepare bus for transfers, set all lines low */
-- 
2.24.0
