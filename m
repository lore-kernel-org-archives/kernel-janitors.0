From: Wang YanQing <udknight@gmail.com>
Date: Sun, 03 May 2020 12:34:35 +0000
Subject: [PATCH] checkpatch: add support for title acrosses three lines in commit id description
Message-Id: <20200503123435.GD10332@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>, Markus.Elfring@web.de, kernel-janitors@vger.kernel.org

The current GIT_COMMIT_ID will report error when the title in commit id
description acrosses three lines, take changelog of commit 87b0f983f66f
("net: mscc: ocelot: fix untagged packet drops when enslaving to vlan
aware bridge") as a example.

It make senses to support three lines title, because three lines could only
have about two lines length title, see above example, but I think we don't
need to add support for more than three lines length title, ~225 (75 * 3)
shoud be enough for any sensible title.

This patch adds support for three lines title in the commit id description,
and emit diagnostics info when the title acrosses more than three lines.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 Hi! Joe
 This is the third patch based on previous two patches.

 Thanks.
 
 scripts/checkpatch.pl | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index a1e4113..e9c46d3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2899,15 +2899,27 @@ sub process {
 				$orig_desc = $1;
 				$has_parens_and_dqm = 1;
 			} elsif ($line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\(".+$/i &&
-				 defined $rawlines[$linenr] &&
-				 $rawlines[$linenr] =~ /^\s*.+"\)/) {
-				$line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\("(.+)$/i;
-				$orig_desc = $1;
-				$rawlines[$linenr] =~ /^\s*(.+)"\)/;
-				$orig_desc .= " " . $1;
-				$has_parens_and_dqm = 1;
-
-				if ($prefix eq "Fixes:") {
+				 defined $rawlines[$linenr]) {
+				 if ($rawlines[$linenr] =~ /^\s*.+"\)/) {
+					$line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\("(.+)$/i;
+					$orig_desc = $1;
+					$rawlines[$linenr] =~ /^\s*(.+)"\)/;
+					$orig_desc .= " " . $1;
+					$has_parens_and_dqm = 1;
+				 } elsif (defined $rawlines[$linenr + 1] &&
+					  $rawlines[$linenr + 1] =~ /^\s*.+"\)/) {
+					$line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\("(.+)$/i;
+					$orig_desc = $1;
+					$rawlines[$linenr] =~ /^\s*(.+)/;
+					$orig_desc .= " " . $1;
+					$rawlines[$linenr + 1] =~ /^\s*(.+)"\)/;
+					$orig_desc .= " " . $1;
+					$has_parens_and_dqm = 1;
+				 } else {
+					$diagnostics .= "Missing terminal '\")' at the end of title or the title acrosses more than 3 lines.\n";
+				 }
+
+				if ($has_parens_and_dqm && $prefix eq "Fixes:") {
 					$acrosslines = 1;
 					$diagnostics .= "The title acrosses lines.\n";
 				}
-- 
1.8.5.6.2.g3d8a54e.dirty
