From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2019 07:06:06 +0000
Subject: [PATCH 1/4] misc: xilinx_sdfec: Fix a couple small information leaks
Message-Id: <20190821070606.GA26957@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Kiernan <derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

These structs have holes in them so we end up disclosing a few bytes of
uninitialized stack data.

drivers/misc/xilinx_sdfec.c:305 xsdfec_get_status() warn: check that 'status' doesn't leak information (struct has a hole after 'activity')
drivers/misc/xilinx_sdfec.c:449 xsdfec_get_turbo() warn: check that 'turbo_params' doesn't leak information (struct has a hole after 'scale')

We need to zero out the holes with memset().

Fixes: 6bd6a690c2e7 ("misc: xilinx_sdfec: Add stats & status ioctls")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/xilinx_sdfec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 912e939dec62..dc1b8b412712 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -295,6 +295,7 @@ static int xsdfec_get_status(struct xsdfec_dev *xsdfec, void __user *arg)
 	struct xsdfec_status status;
 	int err;
 
+	memset(&status, 0, sizeof(status));
 	spin_lock_irqsave(&xsdfec->error_data_lock, xsdfec->flags);
 	status.state = xsdfec->state;
 	xsdfec->state_updated = false;
@@ -440,6 +441,7 @@ static int xsdfec_get_turbo(struct xsdfec_dev *xsdfec, void __user *arg)
 	if (xsdfec->config.code = XSDFEC_LDPC_CODE)
 		return -EIO;
 
+	memset(&turbo_params, 0, sizeof(turbo_params));
 	reg_value = xsdfec_regread(xsdfec, XSDFEC_TURBO_ADDR);
 
 	turbo_params.scale = (reg_value & XSDFEC_TURBO_SCALE_MASK) >>
-- 
2.20.1
