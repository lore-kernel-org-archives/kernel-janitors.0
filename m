From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Apr 2012 14:36:21 +0000
Subject: [patch v2] cifs: fix revalidation test in cifs_llseek()
Message-Id: <20120430143621.GK6447@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120419210619.GA19074@elgon.mountain>
	<CAKywueQrrHdqXXrHQbP=vjs_MLjksvR09cpax0iWw-PS6ms=fg@mail.gmail.com>
In-Reply-To: <CAKywueQrrHdqXXrHQbP=vjs_MLjksvR09cpax0iWw-PS6ms=fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org, Josef Bacik <josef@redhat.com>

This test is always true so it means we revalidate the length every
time, which generates more network traffic.  When it is SEEK_SET or
SEEK_CUR, then we don't need to revalidate.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  I had the test reversed in the first version.

diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
index 811245b..4a6ad20 100644
--- a/fs/cifs/cifsfs.c
+++ b/fs/cifs/cifsfs.c
@@ -699,7 +699,7 @@ static loff_t cifs_llseek(struct file *file, loff_t offset, int origin)
 	 * origin = SEEK_END || SEEK_DATA || SEEK_HOLE => we must revalidate
 	 * the cached file length
 	 */
-	if (origin != SEEK_SET || origin != SEEK_CUR) {
+	if (origin != SEEK_SET && origin != SEEK_CUR) {
 		int rc;
 		struct inode *inode = file->f_path.dentry->d_inode;
 
