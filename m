From: Colin King <colin.king@canonical.com>
Date: Fri, 29 Mar 2019 00:02:44 +0000
Subject: [PATCH] staging: rtl8192u: fix incorrect mask for EEPROMTxPowerLevelCCK setting
Message-Id: <20190329000244.16528-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Whitmore <johnfwhitmore@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the lower 8 bits of ret are being masked and left
shifted by 8 bits always leaving a result of zero. The mask
appears to be incorrect and should probably be 0xff00 instead
of 0xff.  Fix this.  (Note: not tested).

Fixes: 16feab644fd1 ("staging: rtl8192u: check return value eprom_read")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index f1eaab337dca..a173884d31c8 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2454,7 +2454,7 @@ static int rtl8192_read_eeprom_info(struct net_device *dev)
 				ret = eprom_read(dev, (EEPROM_TX_PW_INDEX_CCK >> 1));
 				if (ret < 0)
 					return ret;
-				priv->EEPROMTxPowerLevelCCK = ((u16)ret & 0xff) >> 8;
+				priv->EEPROMTxPowerLevelCCK = ((u16)ret & 0xff00) >> 8;
 			} else
 				priv->EEPROMTxPowerLevelCCK = 0x10;
 			RT_TRACE(COMP_EPROM, "CCK Tx Power Levl: 0x%02x\n", priv->EEPROMTxPowerLevelCCK);
-- 
2.20.1
