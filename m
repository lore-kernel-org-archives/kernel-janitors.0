From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 25 Sep 2018 14:30:36 +0000
Subject: [PATCH -next] ANDROID: binder: make symbol 'binder_free_buf' static
Message-Id: <1537885836-18996-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/android/binder.c:3312:1: warning:
 symbol 'binder_free_buf' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/android/binder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 1b54bb5..cb30a52 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3308,7 +3308,7 @@ static void binder_transaction(struct binder_proc *proc,
  *
  * Cleanup buffer and free it.
  */
-void
+static void
 binder_free_buf(struct binder_proc *proc, struct binder_buffer *buffer)
 {
 	if (buffer->transaction) {
