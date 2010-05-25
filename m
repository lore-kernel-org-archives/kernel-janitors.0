From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 21:54:01 +0000
Subject: [patch] mempolicy: ERR_PTR dereference in mpol_shared_policy_init()
Message-Id: <20100525215401.GA2506@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lee Schermerhorn <lee.schermerhorn@hp.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Christoph Lameter <cl@linux-foundation.org>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

The original code called mpol_put(new) while "new" was an ERR_PTR.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 7575101..5d6fb33 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2098,7 +2098,7 @@ void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol)
 		/* contextualize the tmpfs mount point mempolicy */
 		new = mpol_new(mpol->mode, mpol->flags, &mpol->w.user_nodemask);
 		if (IS_ERR(new))
-			goto put_free; /* no valid nodemask intersection */
+			goto free_scratch; /* no valid nodemask intersection */
 
 		task_lock(current);
 		ret = mpol_set_nodemask(new, &mpol->w.user_nodemask, scratch);
@@ -2114,6 +2114,7 @@ void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol)
 
 put_free:
 		mpol_put(new);			/* drop initial ref */
+free_scratch:
 		NODEMASK_SCRATCH_FREE(scratch);
 	}
 }
