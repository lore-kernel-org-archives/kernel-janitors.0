From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 20 May 2010 15:18:53 +0000
Subject: [PATCH] checkpatch: warn on declaration with storage class not at the beginning
Message-Id: <1274368733-4386-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
Cc: Jean Delvare <khali@linux-fr.org>
---
 scripts/checkpatch.pl |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f2bbea9..4921473 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2586,6 +2586,11 @@ sub process {
 			CHK("architecture specific defines should be avoided\n" .  $herecurr);
 		}
 
+# Check that the storage class is at the beginning of a declaration
+		if ($line =~ /\b$Storage\b/ && $line !~ /^.\s*$Storage\b/) {
+			WARN("storage class should be at the beginning of the declaration\n" . $herecurr)
+		}
+
 # check the location of the inline attribute, that it is between
 # storage class and type.
 		if ($line =~ /\b$Type\s+$Inline\b/ ||
-- 
1.6.3.3

