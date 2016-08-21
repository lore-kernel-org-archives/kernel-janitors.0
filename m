From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 07:22:58 +0000
Subject: [PATCH 3/7] aacraid: Delete unnecessary initialisations in aac_send_raw_srb()
Message-Id: <4d56e32b-3a42-8bcf-29e9-c000922b14cb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <40d8607f-3934-c31f-3791-ef6a67d65d45@users.sourceforge.net>
In-Reply-To: <40d8607f-3934-c31f-3791-ef6a67d65d45@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, aacraid@microsemi.com, "James E. J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Aug 2016 21:25:20 +0200

Six local variables will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/scsi/aacraid/commctrl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/aacraid/commctrl.c b/drivers/scsi/aacraid/commctrl.c
index 6dcdf91..49a664f 100644
--- a/drivers/scsi/aacraid/commctrl.c
+++ b/drivers/scsi/aacraid/commctrl.c
@@ -476,20 +476,20 @@ static int aac_send_raw_srb(struct aac_dev* dev, void __user * arg)
 {
 	struct fib* srbfib;
 	int status;
-	struct aac_srb *srbcmd = NULL;
-	struct user_aac_srb *user_srbcmd = NULL;
+	struct aac_srb *srbcmd;
+	struct user_aac_srb *user_srbcmd;
 	struct user_aac_srb __user *user_srb = arg;
 	struct aac_srb_reply __user *user_reply;
 	struct aac_srb_reply* reply;
-	u32 fibsize = 0;
-	u32 flags = 0;
+	u32 fibsize;
+	u32 flags;
 	s32 rcode = 0;
 	u32 data_dir;
 	void __user *sg_user[32];
 	void *sg_list[32];
 	u32 sg_indx = 0;
-	u32 byte_count = 0;
-	u32 actual_fibsize64, actual_fibsize = 0;
+	u32 byte_count;
+	u32 actual_fibsize64, actual_fibsize;
 	int i;
 
 
-- 
2.9.3

