From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Jul 2018 09:08:02 +0000
Subject: [PATCH] userfaultfd: remove redundant pointer uwq
Message-Id: <20180717090802.18357-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer uwq is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'uwq' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/userfaultfd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 594d192b2331..0bc422ae8a46 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -1847,17 +1847,14 @@ static void userfaultfd_show_fdinfo(struct seq_file *m, struct file *f)
 {
 	struct userfaultfd_ctx *ctx = f->private_data;
 	wait_queue_entry_t *wq;
-	struct userfaultfd_wait_queue *uwq;
 	unsigned long pending = 0, total = 0;
 
 	spin_lock(&ctx->fault_pending_wqh.lock);
 	list_for_each_entry(wq, &ctx->fault_pending_wqh.head, entry) {
-		uwq = container_of(wq, struct userfaultfd_wait_queue, wq);
 		pending++;
 		total++;
 	}
 	list_for_each_entry(wq, &ctx->fault_wqh.head, entry) {
-		uwq = container_of(wq, struct userfaultfd_wait_queue, wq);
 		total++;
 	}
 	spin_unlock(&ctx->fault_pending_wqh.lock);
-- 
2.17.1

