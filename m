From: Wang YanQing <udknight@gmail.com>
Date: Sat, 02 May 2020 18:50:41 +0000
Subject: [PATCH] checkpatch: fix can't check for too long invalid commit id
Message-Id: <20200502185041.GA9082@udknight>
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
 After this patch, in another patch 'checkpatch: add support to check 'Fixes:' tag format',
 I will delete UNKNOWN_COMMIT_ID, because we don't need it anymore after GIT_COMMIT_ID could
 do the same check as UNKNOWN_COMMIT_ID for 'Fixes:' tag.

 scripts/checkpatch.pl | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 23a001a..143bb43 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2865,8 +2865,18 @@ sub process {
 			($id, $description) = git_commit_info($orig_commit,
 							      $id, $orig_desc);
 
+			if (!defined($id)) {
+			    if ($long) {
+				ERROR("GIT_COMMIT_ID",
+				      "Unknown commit id '$orig_commit' is too long, maybe misspelled?\n" . $herecurr);
+			    } else {
+				ERROR("GIT_COMMIT_ID",
+				      "Unknown commit id '$orig_commit', maybe rebased or not pulled?\n" . $herecurr);
+			    }
+			}
+
 			if (defined($id) &&
-			   ($short || $long || $space || $case || ($orig_desc ne $description) || !$hasparens)) {
+			   ($short || $space || $case || ($orig_desc ne $description) || !$hasparens)) {
 				ERROR("GIT_COMMIT_ID",
 				      "Please use git commit description style 'commit <12+ chars of sha1> (\"<title line>\")' - ie: '${init_char}ommit $id (\"$description\")'\n" . $herecurr);
 			}
@@ -2969,7 +2979,7 @@ sub process {
 		}
 
 # check for invalid commit id
-		if ($in_commit_log && $line =~ /(^fixes:|\bcommit)\s+([0-9a-f]{6,40})\b/i) {
+		if ($in_commit_log && $line =~ /(^fixes:)\s+([0-9a-f]{6,40})\b/i) {
 			my $id;
 			my $description;
 			($id, $description) = git_commit_info($2, undef, undef);
-- 
1.8.5.6.2.g3d8a54e.dirty
