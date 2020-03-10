From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 10 Mar 2020 17:34:09 +0000
Subject: Re: [PATCH] RDMA/bnxt_re: Remove a redundant 'memset'
Message-Id: <20200310173409.GA21962@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200308065442.5415-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200308065442.5415-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: selvin.xavier@broadcom.com, devesh.sharma@broadcom.com, somnath.kotur@broadcom.com, sriharsha.basavapatna@broadcom.com, dledford@redhat.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Mar 08, 2020 at 07:54:42AM +0100, Christophe JAILLET wrote:
> 'wqe' is already zeroed at the top of the 'while' loop, just a few lines
> below, and is not used outside of the loop.
> So there is no need to zero it here as well.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/infiniband/hw/bnxt_re/ib_verbs.c | 1 -
>  1 file changed, 1 deletion(-)

Applied to for-next, I reworked it a bit:

diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
index 47b0b50b71e70b..95f6d493d1b98d 100644
--- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
+++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
@@ -2470,15 +2470,12 @@ static int bnxt_re_post_send_shadow_qp(struct bnxt_re_dev *rdev,
 				       struct bnxt_re_qp *qp,
 				       const struct ib_send_wr *wr)
 {
-	struct bnxt_qplib_swqe wqe;
 	int rc = 0, payload_sz = 0;
 	unsigned long flags;
 
 	spin_lock_irqsave(&qp->sq_lock, flags);
-	memset(&wqe, 0, sizeof(wqe));
 	while (wr) {
-		/* House keeping */
-		memset(&wqe, 0, sizeof(wqe));
+		struct bnxt_qplib_swqe wqe = {};
 
 		/* Common */
 		wqe.num_sge = wr->num_sge;
