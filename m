From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Feb 2021 10:57:07 +0000
Subject: [PATCH] module: potential uninitialized return in module_kallsyms_on_each_symbol()
Message-Id: <YCO8AwE57IzaMamG@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Petr Mladek <pmladek@suse.com>, Miroslav Benes <mbenes@suse.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that:

	kernel/module.c:4472 module_kallsyms_on_each_symbol()
        error: uninitialized symbol 'ret'.

This warning looks like it could be correct if the &modules list is
empty.

Fixes: 013c1667cf78 ("kallsyms: refactor {,module_}kallsyms_on_each_symbol")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module.c b/kernel/module.c
index 95186c9d81ea..9bd3c821d029 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -4447,7 +4447,7 @@ int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
 {
 	struct module *mod;
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&module_mutex);
 	list_for_each_entry(mod, &modules, list) {
-- 
2.30.0
