From: Craig Inches <craig@craiginches.com>
Date: Sat, 21 May 2016 13:15:58 +0000
Subject: [PATCH] Staging: Android: Fix bracket alignment style issue in sync.c
Message-Id: <1463836558-7905-1-git-send-email-craig@craiginches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1463165927-14288-1-git-send-email-craig@craiginches.com>
In-Reply-To: <1463165927-14288-1-git-send-email-craig@craiginches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: arve@android.com, riandrews@android.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org, Craig Inches <craig@craiginches.com>, Craig Inches <Craig@craiginches.com>

This patch changes 3 bracket alignment errors found by checkpatch.

Signed-off-by: Craig Inches <Craig@craiginches.com>
---
 drivers/staging/android/sync.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/android/sync.c b/drivers/staging/android/sync.c
index 3a8f210..4a64bdd 100644
--- a/drivers/staging/android/sync.c
+++ b/drivers/staging/android/sync.c
@@ -430,7 +430,7 @@ static unsigned int sync_file_poll(struct file *file, poll_table *wait)
 }
 
 static long sync_file_ioctl_merge(struct sync_file *sync_file,
-				   unsigned long arg)
+				  unsigned long arg)
 {
 	int fd = get_unused_fd_flags(O_CLOEXEC);
 	int err;
@@ -500,7 +500,7 @@ static int sync_fill_fence_info(struct fence *fence, void *data, int size)
 }
 
 static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
-					unsigned long arg)
+				       unsigned long arg)
 {
 	struct sync_file_info *info;
 	__u32 size;
@@ -552,7 +552,7 @@ out:
 }
 
 static long sync_file_ioctl(struct file *file, unsigned int cmd,
-			     unsigned long arg)
+			    unsigned long arg)
 {
 	struct sync_file *sync_file = file->private_data;
 
-- 
2.7.3

