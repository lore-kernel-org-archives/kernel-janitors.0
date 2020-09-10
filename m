From: Colin King <colin.king@canonical.com>
Date: Thu, 10 Sep 2020 15:12:21 +0000
Subject: [PATCH][next] binder: remove redundant assignment to pointer n
Message-Id: <20200910151221.751464-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <christian@brauner.io>, Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer n is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/android/binder_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index 910c53ba2c91..2f846b7ae8b8 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -347,7 +347,7 @@ static void debug_low_async_space_locked(struct binder_alloc *alloc, int pid)
 	 * and at some point we'll catch them in the act. This is more efficient
 	 * than keeping a map per pid.
 	 */
-	struct rb_node *n = alloc->free_buffers.rb_node;
+	struct rb_node *n;
 	struct binder_buffer *buffer;
 	size_t total_alloc_size = 0;
 	size_t num_buffers = 0;
-- 
2.27.0
