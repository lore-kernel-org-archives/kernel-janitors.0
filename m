From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Feb 2020 00:15:13 +0000
Subject: [PATCH][next] clone3: fix an unsigned args.cgroup comparison to less than zero
Message-Id: <20200222001513.43099-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian@brauner.io>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The less than zero comparison of args.cgroup is aways false because
args.cgroup is a u64 and can never be less than zero.  I believe the
correct check is to cast args.cgroup to a s64 first to ensure an
invalid value is not copied to kargs->cgroup.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: ef2c41cf38a7 ("clone3: allow spawning processes into cgroups")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 67a5d691ffa8..98513a122dd1 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2635,7 +2635,7 @@ noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
 		     !valid_signal(args.exit_signal)))
 		return -EINVAL;
 
-	if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
+	if ((args.flags & CLONE_INTO_CGROUP) && (s64)args.cgroup < 0)
 		return -EINVAL;
 
 	*kargs = (struct kernel_clone_args){
-- 
2.25.0
