From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Mar 2015 07:39:42 +0000
Subject: [patch] staging: dgnc: off by one in dgnc_mgmt_ioctl()
Message-Id: <20150310073942.GA14438@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"dgnc_NumBoards" is the number of initialized elements in the
dgnc_Board[] array so the comparison should be ">=" instead of ">" so we
don't read invalid data.  We can remove the special handling of the
empty array now that we've fixed this bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/dgnc/dgnc_mgmt.c b/drivers/staging/dgnc/dgnc_mgmt.c
index 5544a8e..b89bd59 100644
--- a/drivers/staging/dgnc/dgnc_mgmt.c
+++ b/drivers/staging/dgnc/dgnc_mgmt.c
@@ -153,8 +153,7 @@ long dgnc_mgmt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&brd, uarg, sizeof(int)))
 			return -EFAULT;
 
-		if ((brd < 0) || (brd > dgnc_NumBoards) ||
-		    (dgnc_NumBoards = 0))
+		if (brd < 0 || brd >= dgnc_NumBoards)
 			return -ENODEV;
 
 		memset(&di, 0, sizeof(di));
