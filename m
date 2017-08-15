From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Aug 2017 14:08:28 +0000
Subject: [PATCH] scsi: add missing indent on a for loop statement
Message-Id: <20170815140828.26133-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Willem Riede <osst@riede.org>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, osst-users@lists.sourceforge.net, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The for loop is statement is missing an indent, add it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/osst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/osst.c b/drivers/scsi/osst.c
index 97ab5f160bc6..241908aca468 100644
--- a/drivers/scsi/osst.c
+++ b/drivers/scsi/osst.c
@@ -5434,7 +5434,7 @@ static int append_to_buffer(const char __user *ubp, struct osst_buffer *st_bp, i
 
 	for (i=0, offset=st_bp->buffer_bytes;
 	     i < st_bp->sg_segs && offset >= st_bp->sg[i].length; i++)
-	offset -= st_bp->sg[i].length;
+		offset -= st_bp->sg[i].length;
 	if (i = st_bp->sg_segs) {  /* Should never happen */
 		printk(KERN_WARNING "osst :A: Append_to_buffer offset overflow.\n");
 		return (-EIO);
-- 
2.11.0

