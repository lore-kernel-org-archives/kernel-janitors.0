From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Sat, 17 Mar 2007 06:21:32 +0000
Subject: [KJ] [PATCH 2.6.21-rc4] kernel/exit: Fix a comment and code
Message-Id: <20070317062132.GA11326@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org
Cc: trivial@kernel.org

Hi list,

Comment in release_task() claims that group leader's parent process 
is signalled only if it desires so, which is not true.

Signed-off-by: Ahmed S. Darwish <darwish.07@gmail.com>
---

To save your time, here's the contradictory code which don't appear in 
the patch (appears after its last line):

      leader = p->group_leader;
      if (leader != p && thread_group_empty(leader) && leader->exit_state = EXIT_ZOMBIE) {
		BUG_ON(leader->exit_signal = -1);
		do_notify_parent(leader, leader->exit_signal);


diff --git a/kernel/exit.c b/kernel/exit.c
index f132349..4a0a35f 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -152,7 +152,7 @@ repeat:
 	/*
 	 * If we are the last non-leader member of the thread
 	 * group, and the leader is zombie, then notify the
-	 * group leader's parent process. (if it wants notification.)
+	 * group leader's parent process.
 	 */
 	zap_leader = 0;
 	leader = p->group_leader;

-- 
Ahmed S. Darwish
http://darwish.07.googlepages.com

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
