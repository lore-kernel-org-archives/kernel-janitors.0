From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jul 2019 10:06:14 +0000
Subject: [PATCH] ipw2x00: remove redundant assignment to err
Message-Id: <20190726100614.6924-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable err is initialized to a value that is never read and it
is re-assigned later.  The initialization is redundant and can
be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/ipw2x00/ipw2100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2100.c b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
index 75c0c29d81f0..8dfbaff2d1fe 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2100.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
@@ -4413,7 +4413,7 @@ static void ipw2100_kill_works(struct ipw2100_priv *priv)
 
 static int ipw2100_tx_allocate(struct ipw2100_priv *priv)
 {
-	int i, j, err = -EINVAL;
+	int i, j, err;
 	void *v;
 	dma_addr_t p;
 
-- 
2.20.1
