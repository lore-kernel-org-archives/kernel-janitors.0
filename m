From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Feb 2017 16:41:53 +0000
Subject: [PATCH] jump_label: fix spelling mistake: "allocatote" -> "allocate"
Message-Id: <20170221164153.25102-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jason Baron <jbaron@akamai.com>, Paolo Bonzini <pbonzini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Rusty Russell <rusty@rustcorp.com.au>, David Matlack <dmatlack@google.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/jump_label.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index 6c9cb20..aa123dd 100644
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@ -595,7 +595,7 @@ jump_label_module_notify(struct notifier_block *self, unsigned long val,
 		jump_label_lock();
 		ret = jump_label_add_module(mod);
 		if (ret) {
-			WARN(1, "Failed to allocatote memory: jump_label may not work properly.\n");
+			WARN(1, "Failed to allocate memory: jump_label may not work properly.\n");
 			jump_label_del_module(mod);
 		}
 		jump_label_unlock();
-- 
2.10.2

