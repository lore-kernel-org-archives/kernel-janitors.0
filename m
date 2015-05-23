From: Joe Perches <joe@perches.com>
Date: Sat, 23 May 2015 06:28:14 +0000
Subject: [PATCH] checkpatch: Categorize some long line length checks
Message-Id: <1432362494.29657.40.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
	 <1432237849-53947-11-git-send-email-shuey@purdue.edu>
	 <1432242004.20840.68.camel@perches.com>
In-Reply-To: <1432242004.20840.68.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org, Dan Carpenter <dan.carpenter@oracle.com>, Mike Shuey <shuey@purdue.edu>

Many lines of code extend beyond the maximum line length.
Some of these are possibly justified by use type.

For instance:

structure definitions where comments are added per member like

struct foo {
	type member;		/* some long description */
}

And lines that don't fit the typical logging message style
where a string constant is used like:

	SOME_MACRO(args, "Some long string");

Categorize these long line types so that checkpatch can use
a command-line --ignore=<type> option to avoid emitting some
long line warnings.

Comment the code a bit better too.

Signed-off-by: Joe Perches <joe@perches.com>
---
 scripts/checkpatch.pl | 54 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 89b1df4..99ce3f4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2510,16 +2510,50 @@ sub process {
 # check we are in a valid source file if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|s|S|pl|sh|dtsi|dts)$/);
 
-#line length limit
-		if ($line =~ /^\+/ && $prevrawline !~ /\/\*\*/ &&
-		    $rawline !~ /^.\s*\*\s*\@$Ident\s/ &&
-		    !($line =~ /^\+\s*$logFunctions\s*\(\s*(?:(KERN_\S+\s*|[^"]*))?$String\s*(?:|,|\)\s*;)\s*$/ ||
-		      $line =~ /^\+\s*$String\s*(?:\s*|,|\)\s*;)\s*$/ ||
-		      $line =~ /^\+\s*#\s*define\s+\w+\s+$String$/) &&
-		    $length > $max_line_length)
-		{
-			WARN("LONG_LINE",
-			     "line over $max_line_length characters\n" . $herecurr);
+# line length limit (with some exclusions)
+#
+# There are 3 different line length message types:
+# LONG_LINE_COMMENT	a comment starts before but extends beyond length
+# LONG_LINE_STRING	a string starts before but extends beyond length
+# LONG_LINE		all other lines longer than $max_line_length
+#
+# if LONG_LINE is ignored, the other 2 types are also ignored
+#
+# LONG_LINE has a few types of lines that may extend beyong $max_line_length
+#	kernel-doc arguments
+#	logging functions like pr_info that end in a string
+#	lines with a single string
+#	#defines that are a single string
+
+		if ($length > $max_line_length) {
+			my $msg_type = "";
+
+			# comment starts before $max_line_length
+			if ($line =~ /([\s$;]+)$/ &&
+			    length(expand_tabs(substr($line, 1, length($line) - length($1) - 1))) <= $max_line_length) {
+				$msg_type = "LONG_LINE_COMMENT"
+
+			# quoted string starts before $max_line_length
+			} elsif ($sline =~ /\s*($String(?:\s*(?:\\|,\s*|\)\s*;\s*))?)$/ &&
+				 length(expand_tabs(substr($line, 1, length($line) - length($1) - 1))) <= $max_line_length) {
+				$msg_type = "LONG_LINE_STRING"
+
+			# general long longs
+				# exclude kernel-doc argument lines
+			} elsif ($line =~ /^\+/ && $prevrawline !~ /\/\*\*/ &&
+				 $rawline !~ /^.\s*\*\s*\@$Ident\s/ &&
+				# exclude logging functions that end in a string
+				 !($line =~ /^\+\s*$logFunctions\s*\(\s*(?:(KERN_\S+\s*|[^"]*))?$String\s*(?:|,|\)\s*;)\s*$/ ||
+				# exclude lines with only strings
+				   $line =~ /^\+\s*$String\s*(?:\s*|,|\)\s*;)\s*$/ ||
+				# exclude #defines with only strings
+				   $line =~ /^\+\s*#\s*define\s+\w+\s+$String$/)) {
+				$msg_type = "LONG_LINE";
+			}
+			if ($msg_type ne "" && show_type("LONG_LINE")) {
+				WARN($msg_type,
+				     "line over $max_line_length characters\n" . $herecurr);
+			}
 		}
 
 # check for adding lines without a newline.


