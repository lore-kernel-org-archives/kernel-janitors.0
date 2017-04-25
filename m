From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 20:28:33 +0000
Subject: [PATCH 2/3] scsi: ufs: Delete an error message for a failed memory allocation in ufshcd_memory_alloc
Message-Id: <3d355c13-159a-2570-9ead-af93ad95c210@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75622f45-f46c-e52f-2b9e-6ff5ce32184a@users.sourceforge.net>
In-Reply-To: <75622f45-f46c-e52f-2b9e-6ff5ce32184a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, "James E. J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Vinayak Holikatti <vinholikatti@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 21:50:43 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus remove such a statement here.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/scsi/ufs/ufshcd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index ce385911a20e..5216e33e61a3 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -3274,8 +3274,7 @@ static int ufshcd_memory_alloc(struct ufs_hba *hba)
 				GFP_KERNEL);
-	if (!hba->lrb) {
-		dev_err(hba->dev, "LRB Memory allocation failed\n");
+	if (!hba->lrb)
 		goto out;
-	}
+
 	return 0;
 out:
 	return -ENOMEM;
-- 
2.12.2

