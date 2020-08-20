From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Thu, 20 Aug 2020 08:51:33 +0000
Subject: [PATCH 4/6] staging: wfx/debug.c: Fix spelling mistake "carefull" => "careful"
Message-Id: <ec3e765875adfe59f1d8d8ef2c610d6423116f55.1597913333.git.usuraj35@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
In-Reply-To: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jerome.pouiller@silabs.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/wfx/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/debug.c b/drivers/staging/wfx/debug.c
index 3f1712b7c919..5772e2375370 100644
--- a/drivers/staging/wfx/debug.c
+++ b/drivers/staging/wfx/debug.c
@@ -299,7 +299,7 @@ static ssize_t wfx_send_hif_msg_read(struct file *file, char __user *user_buf,
 		return ret;
 	if (context->ret < 0)
 		return context->ret;
-	// Be carefull, write() is waiting for a full message while read()
+	// Be careful, write() is waiting for a full message while read()
 	// only return a payload
 	if (copy_to_user(user_buf, context->reply, count))
 		return -EFAULT;
-- 
2.17.1
