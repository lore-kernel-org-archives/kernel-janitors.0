From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 05:34:01 +0000
Subject: [PATCH 11/15] scsi: kzalloc() returns void pointer, no need to cast in hpsa driver
Message-Id: <1429767245-32453-12-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

kmalloc() returns a void pointer - no need to cast it in
drivers/scsi/hpsa.c::hpsa_big_passthru_ioctl()

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/scsi/hpsa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c
index 8eab107..e7d3444b 100644
--- a/drivers/scsi/hpsa.c
+++ b/drivers/scsi/hpsa.c
@@ -4992,8 +4992,7 @@ static int hpsa_big_passthru_ioctl(struct ctlr_info *h, void __user *argp)
 		return -EINVAL;
 	if (!capable(CAP_SYS_RAWIO))
 		return -EPERM;
-	ioc = (BIG_IOCTL_Command_struct *)
-	    kmalloc(sizeof(*ioc), GFP_KERNEL);
+	ioc = kmalloc(sizeof(*ioc), GFP_KERNEL);
 	if (!ioc) {
 		status = -ENOMEM;
 		goto cleanup1;
-- 
2.1.0

