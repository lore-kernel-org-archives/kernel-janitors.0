From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Mar 2018 15:25:17 +0000
Subject: [PATCH][net-next] net: mvpp2: make function mvpp2_check_hw_buf_num static
Message-Id: <20180306152517.2770-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Antoine Tenart <antoine.tenart@bootlin.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function mvpp2_check_hw_buf_num is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
drivers/net/ethernet/marvell/mvpp2.c:4298:5: warning: symbol
'mvpp2_check_hw_buf_num' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/marvell/mvpp2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2.c b/drivers/net/ethernet/marvell/mvpp2.c
index ac0a0dc8f157..61c6896d0d62 100644
--- a/drivers/net/ethernet/marvell/mvpp2.c
+++ b/drivers/net/ethernet/marvell/mvpp2.c
@@ -4295,7 +4295,8 @@ static void mvpp2_bm_bufs_free(struct device *dev, struct mvpp2 *priv,
 }
 
 /* Check number of buffers in BM pool */
-int mvpp2_check_hw_buf_num(struct mvpp2 *priv, struct mvpp2_bm_pool *bm_pool)
+static int mvpp2_check_hw_buf_num(struct mvpp2 *priv,
+				  struct mvpp2_bm_pool *bm_pool)
 {
 	int buf_num = 0;
 
-- 
2.15.1

