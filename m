From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Nov 2018 15:23:50 +0000
Subject: [PATCH] sched/debug: fix spelling mistake "logaritmic" -> "logarithmic"
Message-Id: <20181128152350.13622-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in one of the scaling names in array
sched_tunable_scaling_names, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/sched/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 02bd5f969b21..ac3b616d2a6f 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -698,7 +698,7 @@ do {									\
 
 static const char *sched_tunable_scaling_names[] = {
 	"none",
-	"logaritmic",
+	"logarithmic",
 	"linear"
 };
 
-- 
2.19.1
