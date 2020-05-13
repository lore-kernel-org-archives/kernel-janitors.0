From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 May 2020 09:37:03 +0000
Subject: [PATCH] scsi: aacraid: Fix an Oops in error handling
Message-Id: <20200513093703.GB347693@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adaptec OEM Raid Solutions <aacraid@microsemi.com>, Zou Wei <zou_wei@huawei.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

If the memdup_user() function fails then it results in an Oops in the
error handling code when we try to kfree() and error pointer.

Fixes: 8d925b1f00e6 ("scsi: aacraid: Use memdup_user() as a cleanup")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/aacraid/commctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/aacraid/commctrl.c b/drivers/scsi/aacraid/commctrl.c
index 102658bdc15a..34e65dea992e 100644
--- a/drivers/scsi/aacraid/commctrl.c
+++ b/drivers/scsi/aacraid/commctrl.c
@@ -516,6 +516,7 @@ static int aac_send_raw_srb(struct aac_dev* dev, void __user * arg)
 	user_srbcmd = memdup_user(user_srb, fibsize);
 	if (IS_ERR(user_srbcmd)) {
 		rcode = PTR_ERR(user_srbcmd);
+		user_srbcmd = NULL;
 		goto cleanup;
 	}
 
-- 
2.26.2
