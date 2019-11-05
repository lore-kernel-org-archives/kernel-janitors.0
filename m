From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 05 Nov 2019 18:56:23 +0000
Subject: [PATCH 2/2] misc: xilinx_sdfec: Combine three condition checks into one statement in xsdfec_add_ldpc
Message-Id: <b927be91-a380-1bba-2b10-f0ca49c477b5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af1ff373-56c0-ca49-36dd-15666d183c95@web.de>
In-Reply-To: <af1ff373-56c0-ca49-36dd-15666d183c95@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Derek Kiernan <derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@xilinx.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Nov 2019 19:32:25 +0100

The same return code was set after three condition checks.
Thus use a single statement instead.

Fixes: 20ec628e8007ec75c2f884e00004f39eab6289b5 ("misc: xilinx_sdfec: Add ability to configure LDPC")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/xilinx_sdfec.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index a622fcf4954a..322d5c6e6d12 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -653,18 +653,10 @@ static int xsdfec_add_ldpc(struct xsdfec_dev *xsdfec, void __user *arg)
 	if (IS_ERR(ldpc))
 		return PTR_ERR(ldpc);

-	if (xsdfec->config.code == XSDFEC_TURBO_CODE) {
-		ret = -EIO;
-		goto err_out;
-	}
-
-	/* Verify Device has not started */
-	if (xsdfec->state == XSDFEC_STARTED) {
-		ret = -EIO;
-		goto err_out;
-	}
-
-	if (xsdfec->config.code_wr_protect) {
+	if (xsdfec->config.code == XSDFEC_TURBO_CODE ||
+	    /* Verify device has not started */
+	    xsdfec->state == XSDFEC_STARTED ||
+	    xsdfec->config.code_wr_protect) {
 		ret = -EIO;
 		goto err_out;
 	}
--
2.24.0
