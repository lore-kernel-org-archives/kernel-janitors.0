From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jan 2015 19:13:51 +0000
Subject: [patch] mv64x60_edac: fix an error code in probe()
Message-Id: <20150128191351.GC10259@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If edac_mc_add_mc() fails then we should preserve the error code, but
instead the current code returns success.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/edac/mv64x60_edac.c b/drivers/edac/mv64x60_edac.c
index 6366e88..0574e1b 100644
--- a/drivers/edac/mv64x60_edac.c
+++ b/drivers/edac/mv64x60_edac.c
@@ -789,7 +789,8 @@ static int mv64x60_mc_err_probe(struct platform_device *pdev)
 	ctl = (ctl & 0xff00ffff) | 0x10000;
 	out_le32(pdata->mc_vbase + MV64X60_SDRAM_ERR_ECC_CNTL, ctl);
 
-	if (edac_mc_add_mc(mci)) {
+	res = edac_mc_add_mc(mci);
+	if (res) {
 		edac_dbg(3, "failed edac_mc_add_mc()\n");
 		goto err;
 	}
