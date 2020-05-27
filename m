From: Colin King <colin.king@canonical.com>
Date: Wed, 27 May 2020 13:45:25 +0000
Subject: [PATCH] statx: remove redundant assignment to variable error
Message-Id: <20200527134525.175992-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable error is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/stat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/stat.c b/fs/stat.c
index 3213d1b2750e..d0d5b8cbe4b2 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -192,7 +192,7 @@ int vfs_statx(int dfd, const char __user *filename, int flags,
 	      struct kstat *stat, u32 request_mask)
 {
 	struct path path;
-	int error = -EINVAL;
+	int error;
 	unsigned lookup_flags;
 
 	if (vfs_stat_set_lookup_flags(&lookup_flags, flags))
-- 
2.25.1
