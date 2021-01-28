From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 16:22:02 +0000
Subject: [PATCH] libertas: remove redundant initialization of variable ret
Message-Id: <20210128162202.642848-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/marvell/libertas/if_sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/libertas/if_sdio.c b/drivers/net/wireless/marvell/libertas/if_sdio.c
index 44fbd0acb87a..a63c5e622ee3 100644
--- a/drivers/net/wireless/marvell/libertas/if_sdio.c
+++ b/drivers/net/wireless/marvell/libertas/if_sdio.c
@@ -981,7 +981,7 @@ static int if_sdio_host_to_card(struct lbs_private *priv,
 
 static int if_sdio_enter_deep_sleep(struct lbs_private *priv)
 {
-	int ret = -1;
+	int ret;
 	struct cmd_header cmd;
 
 	memset(&cmd, 0, sizeof(cmd));
-- 
2.29.2
