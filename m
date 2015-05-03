From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 03 May 2015 13:21:43 +0000
Subject: [PATCH 2/3] drivers: staging: lustre: lustre: Replace OBD_CPT_ALLOC etc by kzalloc_node
Message-Id: <1430659304-26354-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430659304-26354-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430659304-26354-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Replace OBD_CPT_ALLOC, OBD_CPT_ALLOC_PTR, and OBD_CPT_ALLOC_GFP by
corresponding calls to kzalloc_node.  The semantic patch for the
OBD_CPT_ALLOC case is as follows: (http://coccinelle.lip6.fr/).

// <smpl>
@@ expression ptr,cptab,cpt,size; @@
- OBD_CPT_ALLOC(ptr, cptab, cpt, size)
+ ptr = kzalloc_node(size, GFP_NOFS, cfs_cpt_spread_node(cptab, cpt))
// </smpl>

Note that the original OBD macros would check if the cptab argument was
NULL and fall back on kzalloc in that case.  Oleg Drokin argues that this
test is not needed because the code containing these calls is only invoked
after initialization has been completed, in which case the possible cptab
arguments are not NULL.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c b/drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c
index 2eefa25..6a61c85 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c
@@ -80,7 +80,9 @@ static int nrs_fifo_start(struct ptlrpc_nrs_policy *policy)
 {
 	struct nrs_fifo_head *head;
 
-	OBD_CPT_ALLOC_PTR(head, nrs_pol2cptab(policy), nrs_pol2cptid(policy));
+	head = kzalloc_node(sizeof(*head), GFP_NOFS,
+			    cfs_cpt_spread_node(nrs_pol2cptab(policy),
+						nrs_pol2cptid(policy)));
 	if (head = NULL)
 		return -ENOMEM;
 

