From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 14:06:15 +0000
Subject: [PATCH] of/address: check for invalid range.cpu_addr
Message-Id: <20200810140615.6113-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently invalid CPU addresses are not being sanity checked resulting in
SATA setup failure on a SynQuacer SC2A11 development machine. The original
check was removed by and earlier commit, so add a sanity check back in
to avoid this regression.

Fixes: 7a8b64d17e35 ("of/address: use range parser for of_dma_get_range")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/of/address.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 590493e04b01..764c8b94ec35 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -985,6 +985,11 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 			/* Don't error out as we'd break some existing DTs */
 			continue;
 		}
+		if (range.cpu_addr = OF_BAD_ADDR) {
+			pr_warn("Translation of DMA address (%llx) to CPU address failed on node (%pOF)\n",
+				range.cpu_addr, node);
+			continue;
+		}
 		dma_offset = range.cpu_addr - range.bus_addr;
 
 		/* Take lower and upper limits */
-- 
2.25.1
