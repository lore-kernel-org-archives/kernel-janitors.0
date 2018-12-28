From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 28 Dec 2018 02:46:30 +0000
Subject: [PATCH -next] mm: Mark 'stack_vm_area' with __maybe_unused
Message-Id: <1545965190-2381-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Marcos Paulo de Souza <marcos.souza.org@gmail.com>, David Windsor <dave@nullcore.net>, Roman Gushchin <guro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Rik van Riel <riel@surriel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning when
CONFIG_VMAP_STACK is not set:

kernel/fork.c: In function 'dup_task_struct':
kernel/fork.c:843:20: warning:
 variable 'stack_vm_area' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 kernel/fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index e2a5156..b38c392 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -840,7 +840,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 {
 	struct task_struct *tsk;
 	unsigned long *stack;
-	struct vm_struct *stack_vm_area;
+	struct vm_struct *stack_vm_area __maybe_unused;
 	int err;
 
 	if (node = NUMA_NO_NODE)
