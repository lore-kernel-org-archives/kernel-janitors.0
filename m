From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Jan 2013 09:06:20 +0000
Subject: [patch] [SCSI] bfa: fix strncpy() limiter in bfad_start_ops()
Message-Id: <20130110090620.GE23063@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anil Gurumurthy <agurumur@brocade.com>
Cc: Vijaya Mohan Guvva <vmohan@brocade.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The closing parenthesis is in the wrong place so it takes the sizeof a
pointer instead of the sizeof the buffer minus one.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/bfa/bfad.c b/drivers/scsi/bfa/bfad.c
index e6bf126..a5f7690 100644
--- a/drivers/scsi/bfa/bfad.c
+++ b/drivers/scsi/bfa/bfad.c
@@ -1034,7 +1034,7 @@ bfad_start_ops(struct bfad_s *bfad) {
 			sizeof(driver_info.host_os_patch) - 1);
 
 	strncpy(driver_info.os_device_name, bfad->pci_name,
-		sizeof(driver_info.os_device_name - 1));
+		sizeof(driver_info.os_device_name) - 1);
 
 	/* FCS driver info init */
 	spin_lock_irqsave(&bfad->bfad_lock, flags);
