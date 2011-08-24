From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Aug 2011 11:30:28 +0000
Subject: [patch -next] bna: off by one in bfa_msgq_rspq_pi_update()
Message-Id: <20110824113028.GD5975@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasesh Mody <rmody@brocade.com>
Cc: Debashis Dutt <ddutt@brocade.com>, "open list:BROCADE BNA 10 GI..." <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

The rspq->rsphdlr[] array has BFI_MC_MAX elements, so this test was
off by one.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/ethernet/brocade/bna/bfa_msgq.c b/drivers/net/ethernet/brocade/bna/bfa_msgq.c
index ed52187..dd36427 100644
--- a/drivers/net/ethernet/brocade/bna/bfa_msgq.c
+++ b/drivers/net/ethernet/brocade/bna/bfa_msgq.c
@@ -483,7 +483,7 @@ bfa_msgq_rspq_pi_update(struct bfa_msgq_rspq *rspq, struct bfi_mbmsg *mb)
 		mc = msghdr->msg_class;
 		num_entries = ntohs(msghdr->num_entries);
 
-		if ((mc > BFI_MC_MAX) || (rspq->rsphdlr[mc].cbfn = NULL))
+		if ((mc >= BFI_MC_MAX) || (rspq->rsphdlr[mc].cbfn = NULL))
 			break;
 
 		(rspq->rsphdlr[mc].cbfn)(rspq->rsphdlr[mc].cbarg, msghdr);
