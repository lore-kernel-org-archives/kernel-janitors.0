From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Nov 2014 10:37:59 +0000
Subject: [patch 2/2] bnx2fc: fix an error code in _bnx2fc_create()
Message-Id: <20141104103759.GB19096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@qlogic.com
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We should be returning an error code here instead of success.  Either
-ENODEV or -ENOMEM would work.  There is also a failure message in
printk().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index dfed4be..251b114 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -2195,6 +2195,7 @@ static int _bnx2fc_create(struct net_device *netdev,
 	interface = bnx2fc_interface_create(hba, netdev, fip_mode);
 	if (!interface) {
 		printk(KERN_ERR PFX "bnx2fc_interface_create failed\n");
+		rc = -ENOMEM;
 		goto ifput_err;
 	}
 
