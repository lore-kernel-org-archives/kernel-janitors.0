From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 17 Oct 2019 03:53:51 +0000
Subject: [PATCH -next] CIFS: remove set but not used variables 'cinode' and 'netfid'
Message-Id: <20191017035351.125013-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

fs/cifs/file.c: In function 'cifs_flock':
fs/cifs/file.c:1704:8: warning:
 variable 'netfid' set but not used [-Wunused-but-set-variable]

fs/cifs/file.c:1702:24: warning:
 variable 'cinode' set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/cifs/file.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 936e03892e2a..02a81dc6861a 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -1699,9 +1699,7 @@ int cifs_flock(struct file *file, int cmd, struct file_lock *fl)
 	bool posix_lck = false;
 	struct cifs_sb_info *cifs_sb;
 	struct cifs_tcon *tcon;
-	struct cifsInodeInfo *cinode;
 	struct cifsFileInfo *cfile;
-	__u16 netfid;
 	__u32 type;
 
 	rc = -EACCES;
@@ -1716,8 +1714,6 @@ int cifs_flock(struct file *file, int cmd, struct file_lock *fl)
 	cifs_read_flock(fl, &type, &lock, &unlock, &wait_flag,
 			tcon->ses->server);
 	cifs_sb = CIFS_FILE_SB(file);
-	netfid = cfile->fid.netfid;
-	cinode = CIFS_I(file_inode(file));
 
 	if (cap_unix(tcon->ses) &&
 	    (CIFS_UNIX_FCNTL_CAP & le64_to_cpu(tcon->fsUnixInfo.Capability)) &&
