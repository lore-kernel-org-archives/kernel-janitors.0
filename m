From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 17:56:00 +0000
Subject: [PATCH] file: remove redundant assignment to variable err
Message-Id: <20201204175600.1147876-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/file.c b/fs/file.c
index 412033d8cfdf..5d1d1b2a5c97 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -1086,7 +1086,7 @@ int __receive_fd(int fd, struct file *file, int __user *ufd, unsigned int o_flag
 
 static int ksys_dup3(unsigned int oldfd, unsigned int newfd, int flags)
 {
-	int err = -EBADF;
+	int err;
 	struct file *file;
 	struct files_struct *files = current->files;
 
-- 
2.29.2
