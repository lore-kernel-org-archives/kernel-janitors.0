From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Oct 2014 07:56:25 +0000
Subject: [patch] staging: lustre: silence a static checker warning
Message-Id: <20141016075625.GB29096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Static checkers warn that if  cfs_cpt_table_print() returns an error
other than -EFBIG, then it would lead to a double free.  This is true
but cfs_cpt_table_print() only returns -EFBIG on error so it also won't
happen in real life.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-proc.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-proc.c
index bbe2c68..83d3f08 100644
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-proc.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-proc.c
@@ -365,8 +365,8 @@ static int __proc_cpt_table(void *data, int write,
 		if (rc >= 0)
 			break;
 
-		LIBCFS_FREE(buf, len);
 		if (rc = -EFBIG) {
+			LIBCFS_FREE(buf, len);
 			len <<= 1;
 			continue;
 		}
