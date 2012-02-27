From: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Date: Mon, 27 Feb 2012 08:39:44 +0000
Subject: [PATCH] Change type for binder_debug_no_lock switch to bool
Message-Id: <1330331985-20767-1-git-send-email-ruan.zhengwang@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

GCC warns that module_param_named() indirectly returns a bool type value
which is different from 'int' type binder_debug_no_lock declared. Change
it to bool because it is a internal switch for debugging.

Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>
---
 drivers/staging/android/binder.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
index f0b7e66..4350425 100644
--- a/drivers/staging/android/binder.c
+++ b/drivers/staging/android/binder.c
@@ -103,7 +103,7 @@ static uint32_t binder_debug_mask = BINDER_DEBUG_USER_ERROR |
 	BINDER_DEBUG_FAILED_TRANSACTION | BINDER_DEBUG_DEAD_TRANSACTION;
 module_param_named(debug_mask, binder_debug_mask, uint, S_IWUSR | S_IRUGO);
 
-static int binder_debug_no_lock;
+static bool binder_debug_no_lock;
 module_param_named(proc_no_lock, binder_debug_no_lock, bool, S_IWUSR | S_IRUGO);
 
 static DECLARE_WAIT_QUEUE_HEAD(binder_user_error_wait);
-- 
1.6.0.4

