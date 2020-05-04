From: Wang YanQing <udknight@gmail.com>
Date: Mon, 04 May 2020 08:37:06 +0000
Subject: [PATCH v2] checkpatch: allow commit description spans across three lines
Message-Id: <20200504083706.GA30290@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>, Markus.Elfring@web.de, kernel-janitors@vger.kernel.org

The current GIT_COMMIT_ID will report error when the commit description
spans across three lines, for examples:
"...
To rehash a previous explanation given in commit 1c44ce560b4d ("net:
mscc: ocelot: fix vlan_filtering when enslaving to bridge before link is
up"), the switch driver operates the in a mode where a single VLAN can
be transmitted as untagged on a particular egress port. That is the
"native VLAN on trunk port" use case.
..."

The above changelog comes from commit 87b0f983f66f ("net: mscc: ocelot:
fix untagged packet drops when enslaving to vlan aware bridge").

"...
With the optimizations for TLB invalidation from commit 0cef77c7798a
("powerpc/64s/radix: flush remote CPUs out of single-threaded
mm_cpumask"), the scope of a TLBI (global vs. local) can now be
..."

The above changelog comes from commit cca19f0b684f ("powerpc/64s/radix: Fix
missing global invalidations when removing copro").

The total length of commit description ("commit"+"12+ SHA1"+("title line"))
exceeds 85 isn't uncommon thing, and it isn't uncommon thing that the ~85
characters span across three lines, see above examples.

This patch adds support to recognize commit description which spans across
three lines, then it will not emit error message for such situation.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 Hi! Joe
 
 I have tested with below command:
 git log -10000 --format=%H -i --grep=" commit " | \
 while read commit ; do \
    echo $commit; \
    ./scripts/checkpatch.pl --git $commit --types=GIT_COMMIT_ID --quiet --nosummary --color=never; \
    done

 There are ~50 properly formed commit descriptions belong to this class, and I haven't check for
 the non-standard commit descriptions, for examples:
 3403e56b41c176f6531a2a6d77d85b46fa34169c
 a78945c357f58665d6a5da8a69e085898e831c70
 87b0f983f66f23762921129fd35966eddc3f2dae
 ac8517440344dbe598f7c1c23e686c800b563061
 cca19f0b684f4ed6aabf6ad07ae3e15e77bfd78a
 53406ed1bcfdabe4b5bc35e6d17946c6f9f563e2

 This number isn't big, but they are all in properly formed format, so I think we should support them
 and avoid emitting false positive error report.

 v2:
 1: Reword the title line.
 2: Reword the changelog.
 3: Rewrite the implementation.

 scripts/checkpatch.pl | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ef34716..8cfc3a9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2900,6 +2900,16 @@ sub process {
 				 $rawlines[$linenr] =~ /^\s*\("(.+)"\)/) {
 				$orig_desc = $1;
 				$has_parens_and_dqm = 1;
+			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s*$/i &&
+				 defined $rawlines[$linenr] &&
+				 $rawlines[$linenr] =~ /^\s*\(".+$/ &&
+				 defined $rawlines[$linenr + 1] &&
+				 $rawlines[$linenr + 1] =~ /^\s*.+"\)/) {
+				$rawlines[$linenr] =~ /^\s*\("(.+)$/i;
+				$orig_desc = $1;
+				$rawlines[$linenr + 1] =~ /^\s*(.+)"\)/;
+				$orig_desc .= " " . $1;
+				$has_parens_and_dqm = 1;
 			} elsif ($line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\(".+$/i &&
 				 defined $rawlines[$linenr] &&
 				 $rawlines[$linenr] =~ /^\s*.+"\)/) {
@@ -2913,12 +2923,29 @@ sub process {
 					$acrosslines = 1;
 					$diagnostics .= "The $name spans across lines.\n";
 				}
+			} elsif ($line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\(".+$/i &&
+				 defined $rawlines[$linenr] &&
+				 $rawlines[$linenr] !~ /^\s*.+"\)/ &&
+				 defined $rawlines[$linenr + 1] &&
+				 $rawlines[$linenr + 1] =~ /^\s*.+"\)/) {
+				$line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\("(.+)$/i;
+				$orig_desc = $1;
+				$rawlines[$linenr] =~ /^\s*(.+)/;
+				$orig_desc .= " " . $1;
+				$rawlines[$linenr + 1] =~ /^\s*(.+)"\)/;
+				$orig_desc .= " " . $1;
+				$has_parens_and_dqm = 1;
+
+				if ($prefix eq "Fixes:") {
+					$acrosslines = 1;
+					$diagnostics .= "The $name spans across lines.\n";
+				}
 			} elsif (($line =~ /\bcommit\s+[0-9a-f]{5,}\s*$/i &&
 				  defined $rawlines[$linenr] &&
 				  $rawlines[$linenr] =~ /^\s*\("/) ||
 				 $line =~ /\b$prefix\s+[0-9a-f]{5,}\s+\(".+$/i) {
 				$diagnostics .= "Missing right '\")' at the end of title line?\n";
-				$diagnostics .= "The $name spans across more than two lines?\n";
+				$diagnostics .= "The $name spans across more than three lines?\n";
 			} elsif ($hasprefix && !$space2) {
 				$diagnostics .= "No title line in '(\"<$title>\")' format is found.\n";
 			}
-- 
1.8.5.6.2.g3d8a54e.dirty
