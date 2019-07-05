From: Colin King <colin.king@canonical.com>
Date: Fri, 05 Jul 2019 08:17:34 +0000
Subject: [PATCH] libertas: remove redundant assignment to variable ret
Message-Id: <20190705081734.15292-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/marvell/libertas/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/libertas/main.c b/drivers/net/wireless/marvell/libertas/main.c
index 5968852b65a7..2233b59cdf44 100644
--- a/drivers/net/wireless/marvell/libertas/main.c
+++ b/drivers/net/wireless/marvell/libertas/main.c
@@ -1046,7 +1046,7 @@ int lbs_rtap_supported(struct lbs_private *priv)
 int lbs_start_card(struct lbs_private *priv)
 {
 	struct net_device *dev = priv->dev;
-	int ret = -1;
+	int ret;
 
 	/* poke the firmware */
 	ret = lbs_setup_firmware(priv);
-- 
2.20.1
