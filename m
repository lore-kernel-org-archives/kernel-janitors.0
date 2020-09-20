From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 11:26:16 +0000
Subject: [PATCH 04/14] dmaengine: sh: drop double zeroing
Message-Id: <1600601186-7420-5-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: kernel-janitors@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

sg_init_table zeroes its first argument, so the allocation of that argument
doesn't have to.

the semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,n,flags;
@@

x = 
- kcalloc
+ kmalloc_array
  (n,sizeof(*x),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/dma/sh/shdma-base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
--- a/drivers/dma/sh/shdma-base.c
+++ b/drivers/dma/sh/shdma-base.c
@@ -728,7 +728,7 @@ static struct dma_async_tx_descriptor *s
 	 * Allocate the sg list dynamically as it would consumer too much stack
 	 * space.
 	 */
-	sgl = kcalloc(sg_len, sizeof(*sgl), GFP_KERNEL);
+	sgl = kmalloc_array(sg_len, sizeof(*sgl), GFP_KERNEL);
 	if (!sgl)
 		return NULL;
 
