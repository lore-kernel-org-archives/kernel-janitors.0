From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 15:00:00 +0000
Subject: [patch] aacraid: information leak in aac_send_raw_srb()
Message-Id: <20170207150000.GA1757@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adaptec OEM Raid Solutions <aacraid@microsemi.com>, Raghava Aditya Renukunta <RaghavaAditya.Renukunta@microsemi.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The aac_srb_reply struct ends in a 2 byte hole so we end up leaking a
bit of information to user space.

Fixes: 423400e64d37 ("scsi: aacraid: Include HBA direct interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/aacraid/commctrl.c b/drivers/scsi/aacraid/commctrl.c
index 614842a9eb07..12dc867b7c74 100644
--- a/drivers/scsi/aacraid/commctrl.c
+++ b/drivers/scsi/aacraid/commctrl.c
@@ -948,6 +948,7 @@ static int aac_send_raw_srb(struct aac_dev* dev, void __user * arg)
 			&((struct aac_native_hba *)srbfib->hw_fib_va)->resp.err;
 		struct aac_srb_reply reply;
 
+		memset(&reply, 0, sizeof(reply));
 		reply.status = ST_OK;
 		if (srbfib->flags & FIB_CONTEXT_FLAG_FASTRESP) {
 			/* fast response */
