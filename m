From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Mar 2019 23:47:13 +0000
Subject: [PATCH] drivers: net: atp: fix various indentation issues
Message-Id: <20190314234713.8587-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114153701.18203-1-colin.king@canonical.com>
In-Reply-To: <20190114153701.18203-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented incorrectly; replace
spaces with a tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/realtek/atp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/atp.c b/drivers/net/ethernet/realtek/atp.c
index cfb67b746595..58e0ca9093d3 100644
--- a/drivers/net/ethernet/realtek/atp.c
+++ b/drivers/net/ethernet/realtek/atp.c
@@ -482,7 +482,7 @@ static void hardware_init(struct net_device *dev)
 	write_reg_high(ioaddr, IMR, ISRh_RxErr);
 
 	lp->tx_unit_busy = 0;
-    lp->pac_cnt_in_tx_buf = 0;
+	lp->pac_cnt_in_tx_buf = 0;
 	lp->saved_tx_size = 0;
 }
 
-- 
2.20.1
