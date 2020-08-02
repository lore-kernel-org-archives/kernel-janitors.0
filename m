From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 02 Aug 2020 13:53:48 +0000
Subject: [PATCH 2/2] net: spider_net: Remove a useless memset
Message-Id: <20200802135348.691046-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kou.ishizaki@toshiba.co.jp, davem@davemloft.net, kuba@kernel.org, linas@austin.ibm.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Avoid a memset after a call to 'dma_alloc_coherent()'.
This is useless since
commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
NOT compile tested, because I don't have the configuration for that
---
 drivers/net/ethernet/toshiba/spider_net.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/spider_net.c b/drivers/net/ethernet/toshiba/spider_net.c
index 2d61400144a2..e1a2057fbf21 100644
--- a/drivers/net/ethernet/toshiba/spider_net.c
+++ b/drivers/net/ethernet/toshiba/spider_net.c
@@ -314,8 +314,6 @@ spider_net_init_chain(struct spider_net_card *card,
 	if (!chain->hwring)
 		return -ENOMEM;
 
-	memset(chain->ring, 0, chain->num_desc * sizeof(struct spider_net_descr));
-
 	/* Set up the hardware pointers in each descriptor */
 	descr = chain->ring;
 	hwdescr = chain->hwring;
-- 
2.25.1
