From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 30 Oct 2018 20:28:08 +0000
Subject: [PATCH v2] kernel/SRCU: Fix ctags
Message-Id: <20181030202808.28027-1-semen.protsenko@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>

ctags indexing ("make tags" command) throws this warning:

    ctags: Warning: include/linux/notifier.h:125:
    null expansion of name pattern "\1"

This is the result of DEFINE_PER_CPU() macro expansion. Fix that by
getting rid of line break.

Similar fix was already done in commit 25528213fe9f ("tags: Fix
DEFINE_PER_CPU expansions"), but this one probably wasn't noticed.

Fixes: 9c80172b902d ("kernel/SRCU: provide a static initializer")
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 include/linux/notifier.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index f35c7bf76143..0096a05395e3 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -122,8 +122,7 @@ extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
 
 #ifdef CONFIG_TREE_SRCU
 #define _SRCU_NOTIFIER_HEAD(name, mod)				\
-	static DEFINE_PER_CPU(struct srcu_data,			\
-			name##_head_srcu_data);			\
+	static DEFINE_PER_CPU(struct srcu_data, name##_head_srcu_data); \
 	mod struct srcu_notifier_head name =			\
 			SRCU_NOTIFIER_INIT(name, name##_head_srcu_data)
 
-- 
2.19.1
