From: Joe Perches <joe@perches.com>
Date: Sun, 13 Mar 2016 19:19:30 +0000
Subject: [RFC PATCH] checkpatch: check formatting of __func__ output uses
Message-Id: <83a6236111861645daa6dee9ae7f7aeb03cd7b14.1457896085.git.joe@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>
Cc: Dan Carpenter <error27@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel@vger.kernel.org

Loggng messages that emit function names have many different forms.

Right now, grep shows these mixtures of forms:

13704	"%s:"
3839	"%s "
2787	"%s()"

Some of these are in macros.

Perhaps it'd be better for grep and consistency to exclusively use "%s:"

Unfortunately, checkpatch isn't an ideal tool to find all these uses.
It seems difficult to handle the possible macro definition styles.

Maybe coccinelle might be better at it, but here's a possible patch to
find the non-macro definition uses.

Signed-off-by: Joe Perches <joe@perches.com>
---
 scripts/checkpatch.pl | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 75ce6d0..727ab64 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1415,6 +1415,22 @@ sub raw_line {
 	return $line;
 }
 
+sub cooked_line {
+	my ($linenr, $cnt) = @_;
+
+	my $offset = $linenr - 1;
+	$cnt++;
+
+	my $line;
+	while ($cnt) {
+		$line = $lines[$offset++];
+		next if (defined($line) && $line =~ /^-/);
+		$cnt--;
+	}
+
+	return $line;
+}
+
 sub cat_vet {
 	my ($vet) = @_;
 	my ($res, $coded);
@@ -5681,6 +5697,33 @@ sub process {
 			}
 		}
 
+# check how __func__ is formatted, prefer "%s:...',  __func__
+		if ($^V && $^V ge 5.10.0 &&
+		    defined $stat &&
+		    $stat =~ /\b__func__\b/ &&
+		    $stat =~ /^\+\s*$logFunctions\s*\(\s*[^"]*$String\s*,\s*__func__\b/m &&
+		    (() = $stat =~ /^\+|\n\+/g) = 1 &&
+		    (() = $stat =~ /;/g) <= 1) {
+			my $herectx = $here . "\n";
+			my $cooked_linenr = -1;
+			my $cooked_line = "";
+			my $raw_line = "";
+			my $cnt = statement_rawlines($stat);
+			for (my $n = 0; $n < $cnt; $n++) {
+				$herectx .= raw_line($linenr, $n) . "\n";
+				if ($cooked_linenr = -1 && cooked_line($linenr, $n) =~ /$String/) {
+					$cooked_linenr = $linenr + $n;
+					$cooked_line = cooked_line($linenr, $n);
+					$raw_line = raw_line($linenr, $n);
+				}
+			}
+			my $qs = get_quoted_string($cooked_line, $raw_line);
+			if ($qs !~ /^"%s:/) {
+				WARN("FUNC_STYLE",
+				     "Prefer using formatting style '%s:' for __func__\n" . $herectx);
+			}
+		}
+
 # check for uses of __DATE__, __TIME__, __TIMESTAMP__
 		while ($line =~ /\b(__(?:DATE|TIME|TIMESTAMP)__)\b/g) {
 			ERROR("DATE_TIME",
-- 
2.6.3.368.gf34be46

