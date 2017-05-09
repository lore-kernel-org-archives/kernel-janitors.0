From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 May 2017 19:00:06 +0000
Subject: [PATCH] checkpatch: Adjust regular expressions in $logFunctions
Message-Id: <a2178c87-9229-978d-c94e-6c124755c440@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 May 2017 20:40:51 +0200

* Two alternations contained an empty element. Use the question mark
  metacharacter instead to express optional items in the search pattern.

* Some alternation elements shared a common prefix (like an underscore).
  Improve the specification of this detail by more non-capturing groups.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/checkpatch.pl | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4b9569fa931b..8561de02d9b8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -427,12 +427,12 @@ our $typeTypedefs = qr{(?x:
 our $zero_initializer = qr{(?:(?:0[xX])?0+$Int_type?|NULL|false)\b};
 
 our $logFunctions = qr{(?x:
-	printk(?:_ratelimited|_once|_deferred_once|_deferred|)|
-	(?:[a-z0-9]+_){1,2}(?:printk|emerg|alert|crit|err|warning|warn|notice|info|debug|dbg|vdbg|devel|cont|WARN)(?:_ratelimited|_once|)|
-	WARN(?:_RATELIMIT|_ONCE|)|
+	printk(?:_(?:ratelimited|once|deferred(?:_once)?))?|
+	(?:[a-z0-9]+_){1,2}(?:printk|emerg|alert|crit|err|warning|warn|notice|info|debug|dbg|vdbg|devel|cont|WARN)(?:_(?:ratelimited|once))?|
+	WARN(?:_(?:RATELIMIT|ONCE))?|
 	panic|
 	MODULE_[A-Z_]+|
-	seq_vprintf|seq_printf|seq_puts
+	seq_(?:v?printf|puts)
 )};
 
 our $signature_tags = qr{(?xi:
-- 
2.12.2

