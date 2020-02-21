From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Feb 2020 15:51:45 +0000
Subject: [PATCH][next] lib/test_lockup: fix spelling mistake "iteraions" -> "iterations"
Message-Id: <20200221155145.79522-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_notice message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/test_lockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_lockup.c b/lib/test_lockup.c
index f91cd44ad75a..b45afd3ad7cb 100644
--- a/lib/test_lockup.c
+++ b/lib/test_lockup.c
@@ -490,7 +490,7 @@ static int __init test_lockup_init(void)
 		return -EINVAL;
 	}
 
-	pr_notice("START pid=%d time=%u +%u ns cooldown=%u +%u ns iteraions=%u state=%s %s%s%s%s%s%s%s%s%s%s%s\n",
+	pr_notice("START pid=%d time=%u +%u ns cooldown=%u +%u ns iterations=%u state=%s %s%s%s%s%s%s%s%s%s%s%s\n",
 		  main_task->pid, time_secs, time_nsecs,
 		  cooldown_secs, cooldown_nsecs, iterations, state,
 		  all_cpus ? "all_cpus " : "",
-- 
2.25.0
