From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Dec 2009 11:40:39 +0000
Subject: [PATCH 1/9] arch/mips/alchemy: Correct code taking the size of a
Message-Id: <Pine.LNX.4.64.0912131240100.24267@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

sizeof(dp) is just the size of the pointer.  Change it to the size of the
referenced structure.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
expression f;
type T;
@@

*f(...,(T)x,...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/mips/alchemy/common/dbdma.c    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/alchemy/common/dbdma.c b/arch/mips/alchemy/common/dbdma.c
index 4851308..40071bd 100644
--- a/arch/mips/alchemy/common/dbdma.c
+++ b/arch/mips/alchemy/common/dbdma.c
@@ -612,7 +612,7 @@ u32 au1xxx_dbdma_put_source(u32 chanid, dma_addr_t buf, int nbytes, u32 flags)
 	dma_cache_wback_inv((unsigned long)buf, nbytes);
 	dp->dscr_cmd0 |= DSCR_CMD0_V;	/* Let it rip */
 	au_sync();
-	dma_cache_wback_inv((unsigned long)dp, sizeof(dp));
+	dma_cache_wback_inv((unsigned long)dp, sizeof(*dp));
 	ctp->chan_ptr->ddma_dbell = 0;
 
 	/* Get next descriptor pointer.	*/
@@ -674,7 +674,7 @@ u32 au1xxx_dbdma_put_dest(u32 chanid, dma_addr_t buf, int nbytes, u32 flags)
 	dma_cache_inv((unsigned long)buf, nbytes);
 	dp->dscr_cmd0 |= DSCR_CMD0_V;	/* Let it rip */
 	au_sync();
-	dma_cache_wback_inv((unsigned long)dp, sizeof(dp));
+	dma_cache_wback_inv((unsigned long)dp, sizeof(*dp));
 	ctp->chan_ptr->ddma_dbell = 0;
 
 	/* Get next descriptor pointer.	*/
