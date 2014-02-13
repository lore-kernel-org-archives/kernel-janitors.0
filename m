From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Feb 2014 11:17:38 +0000
Subject: [patch] EDAC: remove an unneeded condition in i5100_init_csrows()
Message-Id: <20140213111738.GB15549@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We checked that "npages" was not zero a couple lines earlier so we can
remove this and pull the code in one indent level.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/edac/i5100_edac.c b/drivers/edac/i5100_edac.c
index 36a38ee94fa8..6247d186177e 100644
--- a/drivers/edac/i5100_edac.c
+++ b/drivers/edac/i5100_edac.c
@@ -869,16 +869,13 @@ static void i5100_init_csrows(struct mem_ctl_info *mci)
 			       chan, rank, 0);
 
 		dimm->nr_pages = npages;
-		if (npages) {
-			dimm->grain = 32;
-			dimm->dtype = (priv->mtr[chan][rank].width = 4) ?
-					DEV_X4 : DEV_X8;
-			dimm->mtype = MEM_RDDR2;
-			dimm->edac_mode = EDAC_SECDED;
-			snprintf(dimm->label, sizeof(dimm->label),
-				"DIMM%u",
-				i5100_rank_to_slot(mci, chan, rank));
-		}
+		dimm->grain = 32;
+		dimm->dtype = (priv->mtr[chan][rank].width = 4) ?
+				DEV_X4 : DEV_X8;
+		dimm->mtype = MEM_RDDR2;
+		dimm->edac_mode = EDAC_SECDED;
+		snprintf(dimm->label, sizeof(dimm->label), "DIMM%u",
+			 i5100_rank_to_slot(mci, chan, rank));
 
 		edac_dbg(2, "dimm channel %d, rank %d, size %ld\n",
 			 chan, rank, (long)PAGES_TO_MiB(npages));
