From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Nov 2016 11:47:35 +0000
Subject: [patch net-next] liquidio CN23XX: bitwise vs logical AND typo
Message-Id: <20161118114734.GB3281@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>
Cc: Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We obviously intended a bitwise AND here, not a logical one.

Fixes: 8c978d059224 ("liquidio CN23XX: Mailbox support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c b/drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c
index 5309384..73696b42 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c
@@ -301,7 +301,7 @@ int octeon_mbox_process_message(struct octeon_mbox *mbox)
 		       sizeof(struct octeon_mbox_cmd));
 		if (!mbox_cmd.msg.s.resp_needed) {
 			mbox->state &= ~OCTEON_MBOX_STATE_REQUEST_RECEIVED;
-			if (!(mbox->state &&
+			if (!(mbox->state &
 			      OCTEON_MBOX_STATE_RESPONSE_PENDING))
 				mbox->state = OCTEON_MBOX_STATE_IDLE;
 			writeq(OCTEON_PFVFSIG, mbox->mbox_read_reg);
