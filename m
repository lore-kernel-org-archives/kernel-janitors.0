From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Jul 2017 13:42:52 +0000
Subject: [PATCH] staging: rtl8192u: fix incorrect mask and shift on u8 data
Message-Id: <20170721134252.25408-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Scott Matheina <scott@matheina.com>, "David S . Miller" <davem@davemloft.net>, simran singhal <singhalsimran0@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Derek Robson <robsonde@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The cfg_action bit comes from the high bit of pmsg[4] so the
current mask and shift are in correct and always result in
zero.  Fix this by using the correct mask and shif to get the
correct cfg_action bit value.

Detected by CoverityScan, CID#142890 ("Operands don't affect result")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r819xU_cmdpkt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r819xU_cmdpkt.c b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
index 87ab3ba760fc..ae9a4f1ac8fd 100644
--- a/drivers/staging/rtl8192u/r819xU_cmdpkt.c
+++ b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
@@ -294,7 +294,7 @@ static void cmpk_handle_query_config_rx(struct net_device *dev, u8 *pmsg)
 	 * windows OS. So we have to read the content byte by byte or transfer
 	 * endian type before copy the message copy.
 	 */
-	rx_query_cfg.cfg_action		= (pmsg[4] & 0x80000000) >> 31;
+	rx_query_cfg.cfg_action		= (pmsg[4] & 0x80) >> 7;
 	rx_query_cfg.cfg_type		= (pmsg[4] & 0x60) >> 5;
 	rx_query_cfg.cfg_size		= (pmsg[4] & 0x18) >> 3;
 	rx_query_cfg.cfg_page		= (pmsg[6] & 0x0F) >> 0;
-- 
2.11.0

