From: Dan Carpenter <error27@gmail.com>
Date: Tue, 29 Mar 2011 03:18:04 +0000
Subject: [patch] [SCSI] tcm_loop: off by one in tcm_loop_make_naa_tpg()
Message-Id: <20110329031804.GB9856@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: James Bottomley <James.Bottomley@suse.de>, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an off by one that could result in memory corruption.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/target/loopback/tcm_loop.c b/drivers/target/loopback/tcm_loop.c
index aed4e46..2bb5062 100644
--- a/drivers/target/loopback/tcm_loop.c
+++ b/drivers/target/loopback/tcm_loop.c
@@ -1239,7 +1239,7 @@ struct se_portal_group *tcm_loop_make_naa_tpg(
 	tpgt_str += 5; /* Skip ahead of "tpgt_" */
 	tpgt = (unsigned short int) simple_strtoul(tpgt_str, &end_ptr, 0);
 
-	if (tpgt > TL_TPGS_PER_HBA) {
+	if (tpgt >= TL_TPGS_PER_HBA) {
 		printk(KERN_ERR "Passed tpgt: %hu exceeds TL_TPGS_PER_HBA:"
 				" %u\n", tpgt, TL_TPGS_PER_HBA);
 		return ERR_PTR(-EINVAL);
