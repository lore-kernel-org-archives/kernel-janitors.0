From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Jan 2019 00:03:26 +0000
Subject: [PATCH] net: jme: fix indentation issues
Message-Id: <20190117000326.29632-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guo-Fu Tseng <cooldavid@cooldavid.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two lines that have indentation issues, fix these. Also remove
an empty line.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/jme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/jme.c b/drivers/net/ethernet/jme.c
index a5ab6f3403ae..763ee5281177 100644
--- a/drivers/net/ethernet/jme.c
+++ b/drivers/net/ethernet/jme.c
@@ -2034,10 +2034,9 @@ static void jme_drop_tx_map(struct jme_adapter *jme, int startidx, int count)
 				ctxbi->len,
 				PCI_DMA_TODEVICE);
 
-				ctxbi->mapping = 0;
-				ctxbi->len = 0;
+		ctxbi->mapping = 0;
+		ctxbi->len = 0;
 	}
-
 }
 
 static int
-- 
2.19.1
