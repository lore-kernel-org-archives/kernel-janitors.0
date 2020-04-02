From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Apr 2020 10:50:00 +0000
Subject: [PATCH] binderfs: remove redundant assignment to pointer ctx
Message-Id: <20200402105000.506296-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <christian@brauner.io>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer ctx is being initialized with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/android/binderfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 9ecad74183a3..8352a3d160bf 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -747,7 +747,7 @@ static const struct fs_context_operations binderfs_fs_context_ops = {
 
 static int binderfs_init_fs_context(struct fs_context *fc)
 {
-	struct binderfs_mount_opts *ctx = fc->fs_private;
+	struct binderfs_mount_opts *ctx;
 
 	ctx = kzalloc(sizeof(struct binderfs_mount_opts), GFP_KERNEL);
 	if (!ctx)
-- 
2.25.1
