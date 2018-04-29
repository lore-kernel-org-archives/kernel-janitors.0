From: Colin King <colin.king@canonical.com>
Date: Sun, 29 Apr 2018 12:10:56 +0000
Subject: [PATCH] ARM: sun8i: v3s: fix spelling mistake: "disbaled" -> "disabled"
Message-Id: <20180429121056.10501-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in status text string

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
index d1311098ea45..ad173605b1b8 100644
--- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
+++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
@@ -51,7 +51,7 @@
 
 	leds {
 		/* The LEDs use PG0~2 pins, which conflict with MMC1 */
-		status = "disbaled";
+		status = "disabled";
 	};
 };
 
-- 
2.17.0

