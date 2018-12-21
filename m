From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Dec 2018 22:39:44 +0000
Subject: [PATCH] drivers: misc: ad525x_dpot: clean indentation issue, remove tabs
Message-Id: <20181221223944.15128-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Hennerich <michael.hennerich@analog.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a hunk of code in a case statement that is indented one level
too deeply, fix this by removing extra tabs. Also remove one empty line.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/ad525x_dpot.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/misc/ad525x_dpot.c b/drivers/misc/ad525x_dpot.c
index a0afadefcc49..1f6d008e0036 100644
--- a/drivers/misc/ad525x_dpot.c
+++ b/drivers/misc/ad525x_dpot.c
@@ -202,22 +202,20 @@ static s32 dpot_read_i2c(struct dpot_data *dpot, u8 reg)
 		return dpot_read_r8d8(dpot, ctrl);
 	case DPOT_UID(AD5272_ID):
 	case DPOT_UID(AD5274_ID):
-			dpot_write_r8d8(dpot,
+		dpot_write_r8d8(dpot,
 				(DPOT_AD5270_1_2_4_READ_RDAC << 2), 0);
 
-			value = dpot_read_r8d16(dpot,
-				DPOT_AD5270_1_2_4_RDAC << 2);
-
-			if (value < 0)
-				return value;
-			/*
-			 * AD5272/AD5274 returns high byte first, however
-			 * underling smbus expects low byte first.
-			 */
-			value = swab16(value);
+		value = dpot_read_r8d16(dpot, DPOT_AD5270_1_2_4_RDAC << 2);
+		if (value < 0)
+			return value;
+		/*
+		 * AD5272/AD5274 returns high byte first, however
+		 * underling smbus expects low byte first.
+		 */
+		value = swab16(value);
 
-			if (dpot->uid = DPOT_UID(AD5274_ID))
-				value = value >> 2;
+		if (dpot->uid = DPOT_UID(AD5274_ID))
+			value = value >> 2;
 		return value;
 	default:
 		if ((reg & DPOT_REG_TOL) || (dpot->max_pos > 256))
-- 
2.19.1
