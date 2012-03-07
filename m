From: <ruan.zhengwang@gmail.com>
Date: Wed, 07 Mar 2012 02:49:09 +0000
Subject: [PATCH 1/2 v2] Staging:android: Change type for binder_debug_no_lock switch to bool
Message-Id: <1331088550-15632-1-git-send-email-ruan.zhengwang@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330337871-27830-1-git-send-email-ruan.zhengwang@gmail.com>
In-Reply-To: <1330337871-27830-1-git-send-email-ruan.zhengwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, arve@android.com, chris+android@zenthought.org
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Zhengwang Ruan <ruan.zhengwang@gmail.com>

GCC warns that module_param_named() indirectly returns a bool type value
which is different from 'int' type binder_debug_no_lock declared. Change
it to bool because it is a internal switch for debugging.

Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>
---
v2: added a subsystem prefix to the subject
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

