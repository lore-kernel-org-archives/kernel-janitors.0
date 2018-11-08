From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 08 Nov 2018 11:36:02 +0000
Subject: [PATCH -next] cifs: remove set but not used variable 'cifsi'
Message-Id: <1541676962-125306-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Yue Haibing <yuehaibing@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

fs/cifs/smb2ops.c: In function 'smb3_punch_hole':
fs/cifs/smb2ops.c:2122:24: warning:
 variable 'cifsi' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit
31742c5a3317 ("enable fallocate punch hole ("fallocate -p") for SMB3")

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 fs/cifs/smb2ops.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 15c7cbd..c9a4a2c 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -2119,7 +2119,6 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
 			    loff_t offset, loff_t len)
 {
 	struct inode *inode;
-	struct cifsInodeInfo *cifsi;
 	struct cifsFileInfo *cfile = file->private_data;
 	struct file_zero_data_information fsctl_buf;
 	long rc;
@@ -2129,7 +2128,6 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
 	xid = get_xid();
 
 	inode = d_inode(cfile->dentry);
-	cifsi = CIFS_I(inode);
 
 	/* Need to make file sparse, if not already, before freeing range. */
 	/* Consider adding equivalent for compressed since it could also work */
