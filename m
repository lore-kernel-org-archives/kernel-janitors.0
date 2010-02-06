From: Julia Lawall <julia@diku.dk>
Date: Sat, 06 Feb 2010 08:43:41 +0000
Subject: [PATCH 6/11] drivers/dma: Correct NULL test
Message-Id: <Pine.LNX.4.64.1002060943220.8092@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

cohd_fin has already been verified not to be NULL, so the argument to
BUG_ON cannot be true.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression *x;
expression e;
identifier l;
@@

if (x = NULL || ...) {
    ... when forall
    return ...; }
... when != goto l;
    when != x = e
    when != &x
*x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/dma/coh901318.c             |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
index b5f2ee0..64a9372 100644
--- a/drivers/dma/coh901318.c
+++ b/drivers/dma/coh901318.c
@@ -613,8 +613,6 @@ static void dma_tasklet(unsigned long data)
 	cohd_fin->pending_irqs--;
 	cohc->completed = cohd_fin->desc.cookie;
 
-	BUG_ON(cohc->nbr_active_done && cohd_fin = NULL);
-
 	if (cohc->nbr_active_done = 0)
 		return;
 
