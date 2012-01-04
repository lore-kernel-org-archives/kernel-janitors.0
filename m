From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jan 2012 07:24:29 +0000
Subject: [patch] cgroup: move assignement out of condition in
Message-Id: <20120104072429.GF30978@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Gcc complains about this: "kernel/cgroup.c:2179:4: warning: suggest
parentheses around assignment used as truth value [-Wparentheses]"

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I feel like the original developer may have left the parens out on
deliberately to stop checkpatch.pl complaining about long lines.  I so
much hate the long line warning...

diff --git a/kernel/cgroup.c b/kernel/cgroup.c
index cb3c131..6a057fe 100644
--- a/kernel/cgroup.c
+++ b/kernel/cgroup.c
@@ -2175,9 +2175,12 @@ static int cgroup_attach_proc(struct cgroup *cgrp, struct task_struct *leader)
 		oldcg = tc->task->cgroups;
 
 		/* if we don't already have it in the list get a new one */
-		if (!css_set_check_fetched(cgrp, tc->task, oldcg, &newcg_list))
-			if (retval = css_set_prefetch(cgrp, oldcg, &newcg_list))
+		if (!css_set_check_fetched(cgrp, tc->task, oldcg,
+					&newcg_list)) {
+			retval = css_set_prefetch(cgrp, oldcg, &newcg_list);
+			if (retval)
 				goto out_list_teardown;
+		}
 	}
 
 	/*
