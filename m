From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 20 Sep 2020 07:57:22 +0000
Subject: [PATCH] scsi: pmcraid: Fix memory allocation in 'pmcraid_alloc_sglist()'
Message-Id: <20200920075722.376644-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, martin.petersen@oracle.com, bvanassche@acm.org, jthumshirn@suse.de, hare@suse.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

When the scatter list is allocated in 'pmcraid_alloc_sglist()', the
corresponding pointer should be stored in 'scatterlist' within the
'pmcraid_sglist' structure. Otherwise, 'scatterlist' is NULL.

This leads to a potential memory leak and NULL pointer dereference.

Fixes: ed4414cef2ad ("scsi: pmcraid: Use sgl_alloc_order() and sgl_free_order()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is completely speculative and untested.

Should it be correct, I think that their should be some trouble somewhere.
Either NULL pointer dereference or incorrect behavior.
The patch that introduced this potential bug is 2 years 1/2 old. This
should have been spotted earlier.

So unless this driver is mostly unused, this looks odd to me.
Feedback appreciated.
---
 drivers/scsi/pmcraid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index d99568fdf4af..00e155c88f03 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -3230,8 +3230,9 @@ static struct pmcraid_sglist *pmcraid_alloc_sglist(int buflen)
 		return NULL;
 
 	sglist->order = order;
-	sgl_alloc_order(buflen, order, false,
-			GFP_KERNEL | GFP_DMA | __GFP_ZERO, &sglist->num_sg);
+	sglist->scatterlist = sgl_alloc_order(buflen, order, false,
+					      GFP_KERNEL | GFP_DMA | __GFP_ZERO,
+					      &sglist->num_sg);
 
 	return sglist;
 }
-- 
2.25.1
