From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jul 2019 16:50:37 +0000
Subject: [PATCH][next] gve: fix -ENOMEM null check on a page allocation
Message-Id: <20190703165037.3041-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Catherine Sullivan <csully@google.com>, Sagi Shahar <sagis@google.com>, Jon Olson <jonolson@google.com>, "David S . Miller" <davem@davemloft.net>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check to see if a page is allocated is incorrect
and is checking if the pointer page is null, not *page as
intended.  Fix this.

Addresses-Coverity: ("Dereference before null check")
Fixes: f5cedc84a30d ("gve: Add transmit and receive support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/google/gve/gve_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 6a147ed4627f..6ea74c364a4b 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -516,7 +516,7 @@ int gve_alloc_page(struct device *dev, struct page **page, dma_addr_t *dma,
 		   enum dma_data_direction dir)
 {
 	*page = alloc_page(GFP_KERNEL);
-	if (!page)
+	if (!*page)
 		return -ENOMEM;
 	*dma = dma_map_page(dev, *page, 0, PAGE_SIZE, dir);
 	if (dma_mapping_error(dev, *dma)) {
-- 
2.20.1
