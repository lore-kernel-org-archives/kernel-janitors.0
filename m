From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Sep 2017 16:32:47 +0000
Subject: [PATCH] staging: rtl8192u: fix incorrect mask when calculating TxPowerLevelCCK
Message-Id: <20170905163247.21875-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170721134252.25408-1-colin.king@canonical.com>
In-Reply-To: <20170721134252.25408-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, simran singhal <singhalsimran0@gmail.com>, Derek Robson <robsonde@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The mask of 0xff and right shift of 8 bits on ret always results in
a value of 0 for TxPowerLevelCCK.  I believe this should be a mask of
0xff00, however I do not have the hardware at hand to test this out,
so there is a distinct possibility I may be wrong on this.

Detected by CoverityScan CID#1357110 ("Operands don't affect result")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 46b3f19e0878..ecc887636173 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2510,7 +2510,7 @@ static int rtl8192_read_eeprom_info(struct net_device *dev)
 				ret = eprom_read(dev, (EEPROM_TxPwIndex_CCK >> 1));
 				if (ret < 0)
 					return ret;
-				priv->EEPROMTxPowerLevelCCK = ((u16)ret & 0xff) >> 8;
+				priv->EEPROMTxPowerLevelCCK = ((u16)ret & 0xff00) >> 8;
 			} else
 				priv->EEPROMTxPowerLevelCCK = 0x10;
 			RT_TRACE(COMP_EPROM, "CCK Tx Power Levl: 0x%02x\n", priv->EEPROMTxPowerLevelCCK);
-- 
2.14.1

