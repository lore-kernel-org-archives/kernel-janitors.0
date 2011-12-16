From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2011 10:15:54 +0000
Subject: [patch 1/2] [SCSI] pmcraid: remove unneeded check
Message-Id: <20111216101553.GA4287@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anil Ravindranath <anil_ravindranath@pmc-sierra.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, Dan Rosenberg <drosenberg@vsecurity.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

request_size is zero here so this condition is always false.  Also we
already handled negative values some lines earlier so it's not negative
for that reason as well.

It looks like Dan Rosenberg's fix was applied twice by mistake:
b5b515445f4 "[SCSI] pmcraid: reject negative request size"
5f6279da376 "[SCSI] pmcraid: reject negative request size"

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index 5163edb..d6bc4e6 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -3870,9 +3870,6 @@ static long pmcraid_ioctl_passthrough(
 			pmcraid_err("couldn't build passthrough ioadls\n");
 			goto out_free_buffer;
 		}
-	} else if (request_size < 0) {
-		rc = -EINVAL;
-		goto out_free_buffer;
 	}
 
 	/* If data is being written into the device, copy the data from user
