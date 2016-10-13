From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 08:56:57 +0000
Subject: [patch] liquidio: CN23XX: fix a loop timeout
Message-Id: <20161013085657.GL16198@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>
Cc: Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is supposed to loop 1000 times and then give up.  The problem is
it's a post-op and after the loop we test if "loop" is zero when really
it would be -1.  Fix this by making it a pre-op.

Fixes: 1b7c55c4538b ("liquidio: CN23XX queue manipulation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c b/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c
index bddb198..380a641 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c
@@ -693,7 +693,7 @@ static int cn23xx_enable_io_queues(struct octeon_device *oct)
 				while ((reg_val & CN23XX_PKT_INPUT_CTL_RST) &&
 				       !(reg_val &
 					 CN23XX_PKT_INPUT_CTL_QUIET) &&
-				       loop--) {
+				       --loop) {
 					reg_val = octeon_read_csr64(
 					    oct,
 					    CN23XX_SLI_IQ_PKT_CONTROL64(q_no));
