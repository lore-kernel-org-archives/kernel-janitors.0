From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:15:17 +0000
Subject: [PATCH 03/27] drivers/net: fix sparse warning: returning void-valued
Message-Id: <20081222191517.11807.20718.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:

  drivers/net/niu.c:8850:2: warning: returning void-valued expression

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/niu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/niu.c b/drivers/net/niu.c
index 022866d..a4b6913 100644
--- a/drivers/net/niu.c
+++ b/drivers/net/niu.c
@@ -8847,7 +8847,7 @@ static u64 niu_pci_map_page(struct device *dev, struct page *page,
 static void niu_pci_unmap_page(struct device *dev, u64 dma_address,
 			       size_t size, enum dma_data_direction direction)
 {
-	return dma_unmap_page(dev, dma_address, size, direction);
+	dma_unmap_page(dev, dma_address, size, direction);
 }
 
 static u64 niu_pci_map_single(struct device *dev, void *cpu_addr,

