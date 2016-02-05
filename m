From: Kevin Wern <kevin.m.wern@gmail.com>
Date: Fri, 05 Feb 2016 08:29:52 +0000
Subject: [PATCH] checkpatch.pl: fix naked sscanf false positives
Message-Id: <20160205082952.GA18361@kwern-VirtualBox>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a section of checkpatch.pl that intends to ensure the return
value of sscanf is always checked.  However, in certain cases, like in
drivers/staging/dgnc/dgnc.mod.c, the symbol for sscanf is used without
calling the function:

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
...
{ 0x20c55ae0, __VMLINUX_SYMBOL_STR(sscanf) },
...
};

This currently results in a warning, which is undesirable. We should
adjust the script's first regex condition to match *calls* to sscanf,
not just the symbol itself.

Signed-off-by: Kevin Wern <kevin.m.wern@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0147c91..199247d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5452,7 +5452,7 @@ sub process {
 # check for naked sscanf
 		if ($^V && $^V ge 5.10.0 &&
 		    defined $stat &&
-		    $line =~ /\bsscanf\b/ &&
+		    $line =~ /\bsscanf\b\s*$balanced_parens/ &&
 		    ($stat !~ /$Ident\s*=\s*sscanf\s*$balanced_parens/ &&
 		     $stat !~ /\bsscanf\s*$balanced_parens\s*(?:$Compare)/ &&
 		     $stat !~ /(?:$Compare)\s*\bsscanf\s*$balanced_parens/)) {
-- 
1.9.1

