From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 May 2015 07:44:08 +0000
Subject: [patch] watchdog: double lock typo in watchdog_nmi_enable_all()
Message-Id: <20150520074408.GC18278@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The mutex_lock() should obviously be mutex_unlock().

Fixes: ab992dc38f9a ('watchdog: Fix merge 'conflict'')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This bug is already in mainline.

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index c57e67d..a6ffa43 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -628,7 +628,7 @@ void watchdog_nmi_enable_all(void)
 	put_online_cpus();
 
 unlock:
-	mutex_lock(&watchdog_proc_mutex);
+	mutex_unlock(&watchdog_proc_mutex);
 }
 
 void watchdog_nmi_disable_all(void)
