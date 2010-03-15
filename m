From: Dan Carpenter <error27@gmail.com>
Date: Mon, 15 Mar 2010 08:21:48 +0000
Subject: [patch] sched: remove some dead code
Message-Id: <20100315082148.GD18181@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dhaval Giani <dhaval.giani@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kay Sievers <kay.sievers@vrfy.org>, Ingo Molnar <mingo@elte.hu>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This was left over from "7c9414385e sched: Remove USER_SCHED"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/user.c b/kernel/user.c
index 766467b..ec3b222 100644
--- a/kernel/user.c
+++ b/kernel/user.c
@@ -178,8 +178,6 @@ struct user_struct *alloc_uid(struct user_namespace *ns, uid_t uid)
 
 	return up;
 
-	put_user_ns(new->user_ns);
-	kmem_cache_free(uid_cachep, new);
 out_unlock:
 	return NULL;
 }
