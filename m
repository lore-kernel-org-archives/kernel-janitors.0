From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 28 Oct 2019 12:01:21 +0000
Subject: [PATCH net-next] ionic: Remove set but not used variable 'sg_desc'
Message-Id: <20191028120121.20743-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shannon Nelson <snelson@pensando.io>, Pensando Drivers <drivers@pensando.io>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/pensando/ionic/ionic_txrx.c: In function 'ionic_rx_empty':
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:405:28: warning:
 variable 'sg_desc' set but not used [-Wunused-but-set-variable]

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_txrx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_txrx.c b/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
index 0aeac3157160..97e79949b359 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
@@ -402,7 +402,6 @@ static void ionic_rx_fill_cb(void *arg)
 
 void ionic_rx_empty(struct ionic_queue *q)
 {
-	struct ionic_rxq_sg_desc *sg_desc;
 	struct ionic_desc_info *cur;
 	struct ionic_rxq_desc *desc;
 	unsigned int i;
@@ -412,7 +411,6 @@ void ionic_rx_empty(struct ionic_queue *q)
 		desc->addr = 0;
 		desc->len = 0;
 
-		sg_desc = cur->sg_desc;
 		for (i = 0; i < cur->npages; i++) {
 			if (likely(cur->pages[i].page)) {
 				ionic_rx_page_free(q, cur->pages[i].page,
