From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Feb 2018 14:00:56 +0000
Subject: [PATCH] sfc: falcon: remove duplicated bit-wise or of LOOPBACK_SGMII
Message-Id: <20180223140056.27219-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>, Bert Kenward <bkenward@solarflare.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Bit pattern LOOPBACK_SGMII is being bit-wise or'd twice; remove the
redundant 2nd LOOPBACK_SGMII

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/sfc/falcon/enum.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/falcon/enum.h b/drivers/net/ethernet/sfc/falcon/enum.h
index 30a1136fc909..4824fcf5c3d4 100644
--- a/drivers/net/ethernet/sfc/falcon/enum.h
+++ b/drivers/net/ethernet/sfc/falcon/enum.h
@@ -81,7 +81,6 @@ enum ef4_loopback_mode {
 			    (1 << LOOPBACK_XAUI) |		\
 			    (1 << LOOPBACK_GMII) |		\
 			    (1 << LOOPBACK_SGMII) |		\
-			    (1 << LOOPBACK_SGMII) |		\
 			    (1 << LOOPBACK_XGBR) |		\
 			    (1 << LOOPBACK_XFI) |		\
 			    (1 << LOOPBACK_XAUI_FAR) |		\
-- 
2.15.1

