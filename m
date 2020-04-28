From: Wang YanQing <udknight@gmail.com>
Date: Tue, 28 Apr 2020 02:02:23 +0000
Subject: [PATCH v3] checkpatch: add dedicated checker for 'Fixes:' tag
Message-Id: <20200428020223.GA28074@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andy Whitcroft <apw@canonical.com>, Markus.Elfring@web.de, mcroce@redhat.com

According to submitting-patches.rst, 'Fixes:' tag has a little
stricter condition about the one line summary:
...
Do not split the tag across multiple
lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
parsing scripts
...

And there is no 'Fixes:' tag format checker in checkpatch to check
the commit id length too, so let's add dedicated checker to check
these conditions for 'Fixes:' tag.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 scripts/checkpatch.pl | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

 v2-v3
 1:No modification to GIT_COMMIT_ID checker.
   I make a mistake previously, GIT_COMMIT_ID doesn't check 'Fixes:' tag in any way,
   it isn't designed to do it, so let's don't touch it.
 2:Check for too long commit id too.
 3:Check for title line mismatch too.
 4:Move invalid commit id check for 'Fixes:' tag from UNKNOWN_COMMIT_ID to FIXES_TAG checker.
 5:Reword the error message (Markus Elfring).
 6:Reword the commit log (Markus Elfring).

 v1-v2:
 1: Reword commit log (Markus Elfring).
 2: Allow more than 12 characters of SHA-1 id (Markus Elfring).
 3: Update the error message according to reflect the second update.
 4: Add missing (?:...).


diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 23a001a..4de05b5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2969,7 +2969,7 @@ sub process {
 		}
 
 # check for invalid commit id
-		if ($in_commit_log && $line =~ /(^fixes:|\bcommit)\s+([0-9a-f]{6,40})\b/i) {
+		if ($in_commit_log && $line =~ /(\bcommit)\s+([0-9a-f]{6,40})\b/i) {
 			my $id;
 			my $description;
 			($id, $description) = git_commit_info($2, undef, undef);
@@ -2979,6 +2979,45 @@ sub process {
 			}
 		}
 
+		if ($in_commit_log && $line =~ /^fixes:\s*[0-9a-f]{6,40}\b/i) {
+		    my $short = 1;
+		    my $long = 0;
+		    my $lines = 1;
+		    my $orig_commit = "";
+		    my $id = '0123456789ab';
+		    my $orig_desc = "commit description";
+		    my $description;
+
+		    $short = 0 if ($line =~ /\bfixes:\s+[0-9a-f]{12,40}/i);
+		    $long = 0 if ($line =~ /\bfixes:\s+[0-9a-f]{41,}/i);
+
+		    if ($line =~ /^\s*fixes:\s*[0-9a-f]{6,40}\s*(.*)/i) {
+			$lines = 0 if ($1 =~ /^\(\"(?:.*)\"\)$/i);
+		    }
+
+		    if ($line =~ /^\s*fixes:\s*([0-9a-f]{6,40})\s+\("([^"]+)"\)/i) {
+			$orig_commit = lc($1);
+			$orig_desc = $2
+		    }
+
+		    ($id, $description) = git_commit_info($orig_commit,
+							  $id, $orig_desc);
+
+		    if (!defined($id)) {
+			WARN("FIXES_TAG",
+			     "Unknown commit id '$orig_commit', maybe rebased or not pulled?\n" . $herecurr);
+		    } elsif ($orig_desc ne $description) {
+			WARN("FIXES_TAG",
+			     "Provided title line doesn't match the original title line of commit '$id', maybe misspelled?\n" . $herecurr);
+		    }
+
+		    if ($short || $long || $lines) {
+				my $fixes_tag_fmt = "Fixes: 54a4f0239f2e (\"KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed\")";
+				ERROR("FIXES_TAG",
+					"Please use 'Fixes:' tag with commit description style '<12+ chars of sha1> (\"<title line>\")', and the title line doesn't across multiple lines - ie: '$fixes_tag_fmt'\n" . $herecurr);
+			}
+		}
+
 # ignore non-hunk lines and lines being removed
 		next if (!$hunk_line || $line =~ /^-/);
 
-- 
1.8.5.6.2.g3d8a54e.dirty
