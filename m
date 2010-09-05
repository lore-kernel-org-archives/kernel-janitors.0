From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 18:33:12 +0000
Subject: [PATCH 14/14] mm: oom_kill: use IS_ERR() instead of strict checking
Message-Id: <1283711592-7669-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Vasiliy Kulikov <segooon@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, David Rientjes <rientjes@google.com>, Minchan Kim <minchan.kim@gmail.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

From: Vasiliy Kulikov <segooon@gmail.com>

Use IS_ERR() instead of strict checking.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 mm/oom_kill.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index fc81cb2..2ee3350 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -514,7 +514,7 @@ void mem_cgroup_out_of_memory(struct mem_cgroup *mem, gfp_t gfp_mask)
 	read_lock(&tasklist_lock);
 retry:
 	p = select_bad_process(&points, limit, mem, NULL);
-	if (!p || PTR_ERR(p) = -1UL)
+	if (IS_ERR_OR_NULL(p))
 		goto out;
 
 	if (oom_kill_process(p, gfp_mask, 0, points, limit, mem, NULL,
@@ -691,7 +691,7 @@ retry:
 	p = select_bad_process(&points, totalpages, NULL,
 			constraint = CONSTRAINT_MEMORY_POLICY ? nodemask :
 								 NULL);
-	if (PTR_ERR(p) = -1UL)
+	if (IS_ERR(p))
 		goto out;
 
 	/* Found nothing?!?! Either we hang forever, or we panic. */
-- 
1.7.0.4

