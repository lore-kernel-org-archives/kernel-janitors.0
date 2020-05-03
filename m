From: Wang YanQing <udknight@gmail.com>
Date: Sun, 03 May 2020 11:54:06 +0000
Subject: [PATCH v2] checkpatch: fix can't check for too long invalid commit id
Message-Id: <20200503115406.GB10332@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>, Markus.Elfring@web.de, kernel-janitors@vger.kernel.org

The current UNKNOWN_COMMIT_ID doesn't check for 41+ length commit id,
and although GIT_COMMIT_ID will check for 41+ length commit id, but
it willn't warn anything about it due to 41+ length commit will never
be defined.

This patch moves the unknown commit id check for normal commit description
to GIT_COMMIT_ID, and uses ERROR instead of WARN, because unknown commit
id is total useless to track change history in changelog, it deserves the
ERROR.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 v2:
 1: Fix annonying "Invalid commit id" reports for non commit id number string.
 2: Fix indentaton issue, reported by Joe Perches.
 3: Reword the error message in code, suggested by Joe Perches.
 4: Delete unnecessary capture group in UNKNOWN_COMMIT_ID, suggested by Joe Perches.

 scripts/checkpatch.pl | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 23a001a..9b47584 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2829,18 +2829,21 @@ sub process {
 			my $space = 1;
 			my $hasdesc = 0;
 			my $hasparens = 0;
+			my $hasprefix = 1;
 			my $id = '0123456789ab';
 			my $orig_desc = "commit description";
 			my $description = "";
+			my $sha1_length_min = 12;
 
 			if ($line =~ /\b(c)ommit\s+([0-9a-f]{5,})\b/i) {
 				$init_char = $1;
 				$orig_commit = lc($2);
 			} elsif ($line =~ /\b([0-9a-f]{12,40})\b/i) {
 				$orig_commit = lc($1);
+				$hasprefix = 0;
 			}
 
-			$short = 0 if ($line =~ /\bcommit\s+[0-9a-f]{12,40}/i);
+			$short = 0 if ($line =~ /\bcommit\s+[0-9a-f]{$sha1_length_min,40}/i);
 			$long = 1 if ($line =~ /\bcommit\s+[0-9a-f]{41,}/i);
 			$space = 0 if ($line =~ /\bcommit [0-9a-f]/i);
 			$case = 0 if ($line =~ /\b[Cc]ommit\s+[0-9a-f]{5,40}[^A-F]/);
@@ -2865,10 +2868,21 @@ sub process {
 			($id, $description) = git_commit_info($orig_commit,
 							      $id, $orig_desc);
 
+			if ($hasprefix && !defined($id)) {
+				if ($long) {
+					ERROR("GIT_COMMIT_ID",
+					      "Invalid commit id '$orig_commit' length '" . length($orig_commit) . "' exceeds allowed maxium of 40
+					      ($sha1_length_min+ chars of sha1 is recommended).\n" . $herecurr);
+				} else {
+					ERROR("GIT_COMMIT_ID",
+					      "Unknown commit id '$orig_commit', maybe rebased or not pulled?\n" . $herecurr);
+				}
+			}
+
 			if (defined($id) &&
-			   ($short || $long || $space || $case || ($orig_desc ne $description) || !$hasparens)) {
+			   ($short || $space || $case || ($orig_desc ne $description) || !$hasparens)) {
 				ERROR("GIT_COMMIT_ID",
-				      "Please use git commit description style 'commit <12+ chars of sha1> (\"<title line>\")' - ie: '${init_char}ommit $id (\"$description\")'\n" . $herecurr);
+				      "Please use git commit description style 'commit <$sha1_length_min+ chars of sha1> (\"<title line>\")' - ie: '${init_char}ommit $id (\"$description\")'\n" . $herecurr);
 			}
 		}
 
@@ -2969,13 +2983,13 @@ sub process {
 		}
 
 # check for invalid commit id
-		if ($in_commit_log && $line =~ /(^fixes:|\bcommit)\s+([0-9a-f]{6,40})\b/i) {
+		if ($in_commit_log && $line =~ /^fixes:\s+([0-9a-f]{6,40})\b/i) {
 			my $id;
 			my $description;
-			($id, $description) = git_commit_info($2, undef, undef);
+			($id, $description) = git_commit_info($1, undef, undef);
 			if (!defined($id)) {
 				WARN("UNKNOWN_COMMIT_ID",
-				     "Unknown commit id '$2', maybe rebased or not pulled?\n" . $herecurr);
+				     "Unknown commit id '$1', maybe rebased or not pulled?\n" . $herecurr);
 			}
 		}
 
-- 
1.8.5.6.2.g3d8a54e.dirty
