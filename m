From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Jan 2020 17:52:34 +0000
Subject: [PATCH] misc: tsl2550: remove redundant initialization to variable r
Message-Id: <20200107175234.121298-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable r is being initialized with a value that is never
read and it is being updated later with a new value. Remove
the redundant initialization and move the declaration into a
deeper code block.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/tsl2550.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/tsl2550.c b/drivers/misc/tsl2550.c
index 09db397df287..6d71865c8042 100644
--- a/drivers/misc/tsl2550.c
+++ b/drivers/misc/tsl2550.c
@@ -148,16 +148,14 @@ static int tsl2550_calculate_lux(u8 ch0, u8 ch1)
 	u16 c0 = count_lut[ch0];
 	u16 c1 = count_lut[ch1];
 
-	/*
-	 * Calculate ratio.
-	 * Note: the "128" is a scaling factor
-	 */
-	u8 r = 128;
-
 	/* Avoid division by 0 and count 1 cannot be greater than count 0 */
 	if (c1 <= c0)
 		if (c0) {
-			r = c1 * 128 / c0;
+			/*
+			 * Calculate ratio.
+			 * Note: the "128" is a scaling factor
+			 */
+			u8 r = c1 * 128 / c0;
 
 			/* Calculate LUX */
 			lux = ((c0 - c1) * ratio_lut[r]) / 256;
-- 
2.24.0
