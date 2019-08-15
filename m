From: Colin King <colin.king@canonical.com>
Date: Thu, 15 Aug 2019 08:40:34 +0000
Subject: [PATCH] staging: rtl8192u: fix up indentation of a statement
Message-Id: <20190815084034.13885-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented one level too deeply, remove
the extraneous tab.

Addresses-Coverity: ("Identation does not match nesting level")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8190_rtl8256.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8190_rtl8256.c b/drivers/staging/rtl8192u/r8190_rtl8256.c
index 92de92a3325a..0bedf88525cd 100644
--- a/drivers/staging/rtl8192u/r8190_rtl8256.c
+++ b/drivers/staging/rtl8192u/r8190_rtl8256.c
@@ -289,8 +289,8 @@ void phy_set_rf8256_ofdm_tx_power(struct net_device *dev, u8 powerlevel)
 			writeVal = 0x03030303;
 		} else {
 			writeVal = (byte3<<24) | (byte2<<16) | (byte1<<8) | byte0;
-			}
-			rtl8192_setBBreg(dev, RegOffset[index], 0x7f7f7f7f, writeVal);
+		}
+		rtl8192_setBBreg(dev, RegOffset[index], 0x7f7f7f7f, writeVal);
 	}
 	return;
 
-- 
2.20.1
