From: Wang YanQing <udknight@gmail.com>
Date: Wed, 29 Apr 2020 16:36:45 +0000
Subject: [PATCH] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <20200429163645.GA13810@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: joe@perches.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andy Whitcroft <apw@canonical.com>, Markus.Elfring@web.de, mcroce@redhat.com

According to submitting-patches.rst, 'Fixes:' tag has a little
stricter condition about the one line summary than normal git
commit description:
“...
Do not split the tag across multiple
lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
parsing scripts
...”

And there is no sanity check for 'Fixes:' tag format in checkpatch the same
as GIT_COMMIT_ID for git commit description, so let's expand the GIT_COMMIT_ID
to add 'Fixes:' tag format check support.

Based on original patch by Joe Perches <joe@perches.com>

Link: https://lore.kernel.org/lkml/40bfc40958fca6e2cc9b86101153aa0715fac4f7.camel@perches.com/
Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 scripts/checkpatch.pl | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 23a001a..879dcf4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2818,11 +2818,13 @@ sub process {
 		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
 		    $line !~ /^This reverts commit [0-9a-f]{7,40}/ &&
 		    ($line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
+		     $line =~ /\bfixes:\s+[0-9a-f]{5,}\b/i ||
 		     ($line =~ /(?:\s|^)[0-9a-f]{12,40}(?:[\s"'\(\[]|$)/i &&
-		      $line !~ /[\<\[][0-9a-f]{12,40}[\>\]]/i &&
-		      $line !~ /\bfixes:\s*[0-9a-f]{12,40}/i))) {
+		      $line !~ /[\<\[][0-9a-f]{12,40}[\>\]]/i))) {
 			my $init_char = "c";
 			my $orig_commit = "";
+			my $prefix = "commit";
+			my $prefix_case = "[Cc]ommit";
 			my $short = 1;
 			my $long = 0;
 			my $case = 1;
@@ -2832,19 +2834,28 @@ sub process {
 			my $id = '0123456789ab';
 			my $orig_desc = "commit description";
 			my $description = "";
+			my $acrosslines = 0;
+			my $title = "title line";
 
-			if ($line =~ /\b(c)ommit\s+([0-9a-f]{5,})\b/i) {
+			if ($line =~ /\b(f)ixes:\s+([0-9a-f]{5,})\b/i) {
+				$init_char = $1;
+				$orig_commit = lc($2);
+				$prefix = "Fixes:";
+				$prefix_case = "Fixes:";
+				$init_char = "F";
+				$title = "a single line title (without line breaks)";
+			} elsif ($line =~ /\b(c)ommit\s+([0-9a-f]{5,})\b/i) {
 				$init_char = $1;
 				$orig_commit = lc($2);
 			} elsif ($line =~ /\b([0-9a-f]{12,40})\b/i) {
 				$orig_commit = lc($1);
 			}
 
-			$short = 0 if ($line =~ /\bcommit\s+[0-9a-f]{12,40}/i);
-			$long = 1 if ($line =~ /\bcommit\s+[0-9a-f]{41,}/i);
-			$space = 0 if ($line =~ /\bcommit [0-9a-f]/i);
-			$case = 0 if ($line =~ /\b[Cc]ommit\s+[0-9a-f]{5,40}[^A-F]/);
-			if ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)"\)/i) {
+			$short = 0 if ($line =~ /\b$prefix\s+[0-9a-f]{12,40}/i);
+			$long = 1 if ($line =~ /\b$prefix\s+[0-9a-f]{41,}/i);
+			$space = 0 if ($line =~ /\b$prefix [0-9a-f]/i);
+			$case = 0 if ($line =~ /\b$prefix_case\s+[0-9a-f]{5,40}[^A-F]/);
+			if ($line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\("([^"]+)"\)/i) {
 				$orig_desc = $1;
 				$hasparens = 1;
 			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s*$/i &&
@@ -2852,23 +2863,24 @@ sub process {
 				 $rawlines[$linenr] =~ /^\s*\("([^"]+)"\)/) {
 				$orig_desc = $1;
 				$hasparens = 1;
-			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("[^"]+$/i &&
+			} elsif ($line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\("[^"]+$/i &&
 				 defined $rawlines[$linenr] &&
 				 $rawlines[$linenr] =~ /^\s*[^"]+"\)/) {
-				$line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)$/i;
+				$line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\("([^"]+)$/i;
 				$orig_desc = $1;
 				$rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
 				$orig_desc .= " " . $1;
 				$hasparens = 1;
+				$acrosslines = 1 if ($prefix eq "Fixes:");
 			}
 
 			($id, $description) = git_commit_info($orig_commit,
 							      $id, $orig_desc);
 
 			if (defined($id) &&
-			   ($short || $long || $space || $case || ($orig_desc ne $description) || !$hasparens)) {
+			   ($short || $long || $space || $case || ($orig_desc ne $description) || !$hasparens || $acrosslines)) {
 				ERROR("GIT_COMMIT_ID",
-				      "Please use git commit description style 'commit <12+ chars of sha1> (\"<title line>\")' - ie: '${init_char}ommit $id (\"$description\")'\n" . $herecurr);
+				      "Please use git commit description style '$prefix <12+ chars of sha1> (\"<$title>\")' - ie: '${init_char}" . substr($prefix, 1) . " $id (\"$description\")'\n" . $herecurr);
 			}
 		}
 
-- 
1.8.5.6.2.g3d8a54e.dirty
