From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Nov 2018 11:32:35 +0000
Subject: [PATCH] EDAC, skx: clean up a debug printk
Message-Id: <20181127113235.7mxd7cxojtzbkbid@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

I've removed the 0x prefix for the row and col because the %#x format
already adds a 0x.

Fixes: e235dd43d8b0 ("EDAC, skx: Prepend hex formatting with '0x'")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/edac/skx_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/skx_edac.c b/drivers/edac/skx_edac.c
index 93ef161bb5e1..354d2a4b2c64 100644
--- a/drivers/edac/skx_edac.c
+++ b/drivers/edac/skx_edac.c
@@ -389,7 +389,7 @@ static int get_dimm_info(u32 mtr, u32 amap, struct dimm_info *dimm,
 	size = ((1ull << (rows + cols + ranks)) * banks) >> (20 - 3);
 	npages = MiB_TO_PAGES(size);
 
-	edac_dbg(0, "mc#%d: channel %d, dimm %d, %lld MiB (%d pages) bank: %d, rank: %d, row: 0x%#x, col: 0x%#x\n",
+	edac_dbg(0, "mc#%d: channel %d, dimm %d, %lld MiB (%d pages) bank: %d, rank: %d, row: %#x, col: %#x\n",
 		 imc->mc, chan, dimmno, size, npages,
 		 banks, 1 << ranks, rows, cols);
 
-- 
2.11.0
