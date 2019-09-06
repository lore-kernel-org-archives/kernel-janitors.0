From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 16:39:45 +0000
Subject: [PATCH] scsi: fnic: make array dev_cmd_err static const, makes object smaller
Message-Id: <20190906163945.3889-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, Karan Tilak Kumar <kartilak@cisco.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array dev_cmd_err on the stack but instead make it
static const. Makes the object code smaller by 80 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  21461	   1564	      0	  23025	   59f1	drivers/scsi/fnic/vnic_dev.o

After:
   text	   data	    bss	    dec	    hex	filename
  21318	   1628	      0	  22946	   59a2	drivers/scsi/fnic/vnic_dev.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/fnic/vnic_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/fnic/vnic_dev.c b/drivers/scsi/fnic/vnic_dev.c
index 78af9cc2009b..f7f445c6b4fc 100644
--- a/drivers/scsi/fnic/vnic_dev.c
+++ b/drivers/scsi/fnic/vnic_dev.c
@@ -259,7 +259,7 @@ int vnic_dev_cmd1(struct vnic_dev *vdev, enum vnic_devcmd_cmd cmd, int wait)
 	struct vnic_devcmd __iomem *devcmd = vdev->devcmd;
 	int delay;
 	u32 status;
-	int dev_cmd_err[] = {
+	static const int dev_cmd_err[] = {
 		/* convert from fw's version of error.h to host's version */
 		0,	/* ERR_SUCCESS */
 		EINVAL,	/* ERR_EINVAL */
-- 
2.20.1
