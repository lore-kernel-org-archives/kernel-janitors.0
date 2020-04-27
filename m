From: Wang YanQing <udknight@gmail.com>
Date: Mon, 27 Apr 2020 14:53:32 +0000
Subject: [PATCH v2] checkpatch: add dedicated checker for 'Fixes:' tag
Message-Id: <20200427145332.GA18830@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andy Whitcroft <apw@canonical.com>, Markus.Elfring@web.de

According to submitting-patches.rst, 'Fixes:' tag has a little
stricter condition about the one line summary:
"
Do not split the tag across multiple
lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
parsing scripts
"
And the current 'Fixes:' checker in "# Check for git id commit length and
improperly formed commit descriptions" doesn't check for invalid commit id
length, so this patch adds dedicated checker to fix these issues.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 scripts/checkpatch.pl | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

 v1-v2:
 1: Reword commit log (Markus Elfring).
 2: Allow more than 12 characters of SHA-1 id (Markus Elfring).
 3: Update the error message according to reflect the second update.
 4: Add missing (?:...).

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 23a001a..d74683a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2820,7 +2820,7 @@ sub process {
 		    ($line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
 		     ($line =~ /(?:\s|^)[0-9a-f]{12,40}(?:[\s"'\(\[]|$)/i &&
 		      $line !~ /[\<\[][0-9a-f]{12,40}[\>\]]/i &&
-		      $line !~ /\bfixes:\s*[0-9a-f]{12,40}/i))) {
+		      $line !~ /^\s*fixes:\s*(?:[0-9a-f]{6,40})\s*(?:.*)/i))) {
 			my $init_char = "c";
 			my $orig_commit = "";
 			my $short = 1;
@@ -2979,6 +2979,13 @@ sub process {
 			}
 		}
 
+		if ($in_commit_log && $line =~ /^\s*fixes:\s*([0-9a-f]{6,40})\s*(.*)/i) {
+		    if (length($1) < 12 || $2 !~ /^\(\"(?:.*)\"\)$/i) {
+				ERROR("FIXES_TAG",
+					"please use the 'Fixes:' tag with at least the first 12 characters of the SHA-1 ID, and the one line summary(no across multiple lines)\n" . $herecurr);
+			}
+		}
+
 # ignore non-hunk lines and lines being removed
 		next if (!$hunk_line || $line =~ /^-/);
 
-- 
1.8.5.6.2.g3d8a54e.dirty
