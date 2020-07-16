From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Jul 2020 15:47:20 +0000
Subject: [PATCH] staging: rtl8192u: fix a dubious looking mask before a shift
Message-Id: <20200716154720.1710252-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the masking of ret with 0xff and followed by a right shift
of 8 bits always leaves a zero result.  It appears the mask of 0xff
is incorrect and should be 0xff00, but I don't have the hardware to
test this. Fix this to mask the upper 8 bits before shifting.

[ Not tested ]

Addresses-Coverity: ("Operands don't affect result")
Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index fcfb9024a83f..6ec65187bef9 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2374,7 +2374,7 @@ static int rtl8192_read_eeprom_info(struct net_device *dev)
 				ret = eprom_read(dev, (EEPROM_TX_PW_INDEX_CCK >> 1));
 				if (ret < 0)
 					return ret;
-				priv->EEPROMTxPowerLevelCCK = ((u16)ret & 0xff) >> 8;
+				priv->EEPROMTxPowerLevelCCK = ((u16)ret & 0xff00) >> 8;
 			} else
 				priv->EEPROMTxPowerLevelCCK = 0x10;
 			RT_TRACE(COMP_EPROM, "CCK Tx Power Levl: 0x%02x\n", priv->EEPROMTxPowerLevelCCK);
-- 
2.27.0
