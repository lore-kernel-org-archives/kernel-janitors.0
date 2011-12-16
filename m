From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2011 10:21:37 +0000
Subject: [patch 2/2] [SCSI] pmcraid: cpu_to_le32() => cpu_to_le64()
Message-Id: <20111216102137.GB4287@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anil Ravindranath <anil_ravindranath@pmc-sierra.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The cpu_to_le32() truncates the address to 32 bits.  All the other
places that set .address use cpu_to_le64().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
What about if dma_addr_t is 32 bits on a big endian system?  Can that
happen?

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index d6bc4e6..8a239ea 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -1242,7 +1242,7 @@ static struct pmcraid_cmd *pmcraid_init_hcam
 
 	ioadl[0].flags |= IOADL_FLAGS_READ_LAST;
 	ioadl[0].data_len = cpu_to_le32(rcb_size);
-	ioadl[0].address = cpu_to_le32(dma);
+	ioadl[0].address = cpu_to_le64(dma);
 
 	cmd->cmd_done = cmd_done;
 	return cmd;
