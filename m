From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 24 Jul 2019 05:07:51 +0000
Subject: [PATCH] taskstats: Fix a typo - taskstsats --> taskstats
Message-Id: <20190724050751.30170-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bsingharora@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is an extra 's' in 'taskstsats', remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 kernel/taskstats.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index 13a0f2e6ebc2..30578b139d16 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -163,7 +163,7 @@ static void fill_stats(struct user_namespace *user_ns,
 	memset(stats, 0, sizeof(*stats));
 	/*
 	 * Each accounting subsystem adds calls to its functions to
-	 * fill in relevant parts of struct taskstsats as follows
+	 * fill in relevant parts of struct taskstats as follows
 	 *
 	 *	per-task-foo(stats, tsk);
 	 */
@@ -222,7 +222,7 @@ static int fill_stats_for_tgid(pid_t tgid, struct taskstats *stats)
 			continue;
 		/*
 		 * Accounting subsystem can call its functions here to
-		 * fill in relevant parts of struct taskstsats as follows
+		 * fill in relevant parts of struct taskstats as follows
 		 *
 		 *	per-task-foo(stats, tsk);
 		 */
-- 
2.20.1
