From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 05 Jul 2010 08:00:54 +0000
Subject: [PATCH] kernel/watchdog: Initialize 'result'
Message-Id: <1278316854-28442-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Don Zickus <dzickus@redhat.com>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org

Variable on the stack is not initialized to zero, do it explicitly.

This patch silences a compiler warning:
kernel/watchdog.c:463: warning: ‘result’ may be used uninitialized in this function

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 kernel/watchdog.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 91b0b26..613bc1f 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -460,7 +460,7 @@ static void watchdog_disable(int cpu)
 static void watchdog_enable_all_cpus(void)
 {
 	int cpu;
-	int result;
+	int result = 0;
 
 	for_each_online_cpu(cpu)
 		result += watchdog_enable(cpu);
-- 
1.7.0.4

