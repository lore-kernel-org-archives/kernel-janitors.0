From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:15:25 +0000
Subject: [PATCH 10/15] fs: cifs: check kmalloc() result
Message-Id: <1279296925-25147-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Kleikamp <shaggy-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If kmalloc() fails exit with -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 fs/cifs/readdir.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/fs/cifs/readdir.c b/fs/cifs/readdir.c
index daf1753..d5e591f 100644
--- a/fs/cifs/readdir.c
+++ b/fs/cifs/readdir.c
@@ -847,6 +847,11 @@ int cifs_readdir(struct file *file, void *direntry, filldir_t filldir)
 		end_of_smb = cifsFile->srch_inf.ntwrk_buf_start + max_len;
 
 		tmp_buf = kmalloc(UNICODE_NAME_MAX, GFP_KERNEL);
+		if (tmp_buf = NULL) {
+			rc = -ENOMEM;
+			break;
+		}
+
 		for (i = 0; (i < num_to_fill) && (rc = 0); i++) {
 			if (current_entry = NULL) {
 				/* evaluate whether this case is an error */
-- 
1.7.0.4

