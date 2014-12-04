From: Wesley Wiser <wwiser@gmail.com>
Date: Thu, 04 Dec 2014 02:38:41 +0000
Subject: [PATCH] checkpatch: allow uppercase logging function names
Message-Id: <1417660721-13330-1-git-send-email-wwiser@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some kernel logging functions are prefixed with uppercase letters such
as TP_printk, DUMP_printk, DBG_printk, DEBC_printk, etc. The previous
behavior only allowed logging functions (which may exceed the 80
character line limit) to be prefixed by lowercase letters and numbers.

Signed-off-by: Wesley Wiser <wwiser@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 374abf4..3b08f1e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -343,7 +343,7 @@ our $typeTypedefs = qr{(?x:
 
 our $logFunctions = qr{(?x:
 	printk(?:_ratelimited|_once|)|
-	(?:[a-z0-9]+_){1,2}(?:printk|emerg|alert|crit|err|warning|warn|notice|info|debug|dbg|vdbg|devel|cont|WARN)(?:_ratelimited|_once|)|
+	(?:[a-zA-Z0-9]+_){1,2}(?:printk|emerg|alert|crit|err|warning|warn|notice|info|debug|dbg|vdbg|devel|cont|WARN)(?:_ratelimited|_once|)|
 	WARN(?:_RATELIMIT|_ONCE|)|
 	panic|
 	MODULE_[A-Z_]+|
-- 
1.8.4.5

