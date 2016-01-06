From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2016 09:58:09 +0000
Subject: [patch -next] fsl/fman: fix the pause_time test
Message-Id: <20160106095809.GC23185@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igal Liberman <igal.liberman@freescale.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

pause_time is unsigned so it can't be less than zero.  The bug means
that we allow invalid pause-times.

Fixes: 57ba4c9b56d8 ('fsl/fman: Add FMan MAC support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/freescale/fman/fman_dtsec.c b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
index d78e2ba..587f9b4 100644
--- a/drivers/net/ethernet/freescale/fman/fman_dtsec.c
+++ b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
@@ -934,7 +934,7 @@ int dtsec_set_tx_pause_frames(struct fman_mac *dtsec,
 
 	/* FM_BAD_TX_TS_IN_B_2_B_ERRATA_DTSEC_A003 Errata workaround */
 	if (dtsec->fm_rev_info.major = 2)
-		if (pause_time < 0 && pause_time <= 320) {
+		if (pause_time <= 320) {
 			pr_warn("pause-time: %d illegal.Should be > 320\n",
 				pause_time);
 			return -EINVAL;
