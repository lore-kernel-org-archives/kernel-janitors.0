From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jul 2019 11:31:51 +0000
Subject: [PATCH][next] intel_th: msu: fix overflow in shift of an unsigned int
Message-Id: <20190726113151.8967-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The shift of the unsigned int win->nr_blocks by PAGE_SHIFT may
potentially overflow. Note that the intended return of this shift
is expected to be a size_t however the shift is being performed as
an unsigned int.  Fix this by casting win->nr_blocks to a size_t
before performing the shift.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 615c164da0eb ("intel_th: msu: Introduce buffer interface")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwtracing/intel_th/msu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index fc9f15f36ad4..4892ac446c01 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -327,7 +327,7 @@ static size_t msc_win_total_sz(struct msc_window *win)
 		struct msc_block_desc *bdesc = sg_virt(sg);
 
 		if (msc_block_wrapped(bdesc))
-			return win->nr_blocks << PAGE_SHIFT;
+			return (size_t)win->nr_blocks << PAGE_SHIFT;
 
 		size += msc_total_sz(bdesc);
 		if (msc_block_last_written(bdesc))
-- 
2.20.1
