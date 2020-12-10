From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 10 Dec 2020 17:52:35 +0000
Subject: [PATCH] checkpatch: Fix "Missing a blank line after declarations" test on patches
Message-Id: <20201210175235.65657-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: apw@canonical.com, joe@perches.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

"Missing a blank line after declarations" is not triggered on patches.
Tweak the regex to match such cases.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is mostly a PoC. I don't know enough about checkpatch.pl to be
sure that the fix is the right thing to do.
At least, it works for me :)

The [\+ ] is taken from the test just above.

I also wonder if there is a missing ^ in the last test:
  (($prevline =~ /[\+ ](\s+)\S/) && $sline =~ /^[\+ ]$1\S/))
                  ^
                  |___ here
---
 scripts/checkpatch.pl | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b086d1cd6c2..854868b5dbbc 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3783,39 +3783,39 @@ sub process {
 		}
 
 # check for missing blank lines after declarations
-		if ($sline =~ /^\+\s+\S/ &&			#Not at char 1
+		if ($sline =~ /^[\+ ]\s+\S/ &&			#Not at char 1
 			# actual declarations
-		    ($prevline =~ /^\+\s+$Declare\s*$Ident\s*[=,;:\[]/ ||
+		    ($prevline =~ /^[\+ ]\s+$Declare\s*$Ident\s*[=,;:\[]/ ||
 			# function pointer declarations
-		     $prevline =~ /^\+\s+$Declare\s*\(\s*\*\s*$Ident\s*\)\s*[=,;:\[\(]/ ||
+		     $prevline =~ /^[\+ ]\s+$Declare\s*\(\s*\*\s*$Ident\s*\)\s*[=,;:\[\(]/ ||
 			# foo bar; where foo is some local typedef or #define
-		     $prevline =~ /^\+\s+$Ident(?:\s+|\s*\*\s*)$Ident\s*[=,;\[]/ ||
+		     $prevline =~ /^[\+ ]\s+$Ident(?:\s+|\s*\*\s*)$Ident\s*[=,;\[]/ ||
 			# known declaration macros
-		     $prevline =~ /^\+\s+$declaration_macros/) &&
+		     $prevline =~ /^[\+ ]\s+$declaration_macros/) &&
 			# for "else if" which can look like "$Ident $Ident"
-		    !($prevline =~ /^\+\s+$c90_Keywords\b/ ||
+		    !($prevline =~ /^[\+ ]\s+$c90_Keywords\b/ ||
 			# other possible extensions of declaration lines
 		      $prevline =~ /(?:$Compare|$Assignment|$Operators)\s*$/ ||
 			# not starting a section or a macro "\" extended line
 		      $prevline =~ /(?:\{\s*|\\)$/) &&
 			# looks like a declaration
-		    !($sline =~ /^\+\s+$Declare\s*$Ident\s*[=,;:\[]/ ||
+		    !($sline =~ /^[\+ ]\s+$Declare\s*$Ident\s*[=,;:\[]/ ||
 			# function pointer declarations
-		      $sline =~ /^\+\s+$Declare\s*\(\s*\*\s*$Ident\s*\)\s*[=,;:\[\(]/ ||
+		      $sline =~ /^[\+ ]\s+$Declare\s*\(\s*\*\s*$Ident\s*\)\s*[=,;:\[\(]/ ||
 			# foo bar; where foo is some local typedef or #define
-		      $sline =~ /^\+\s+$Ident(?:\s+|\s*\*\s*)$Ident\s*[=,;\[]/ ||
+		      $sline =~ /^[\+ ]\s+$Ident(?:\s+|\s*\*\s*)$Ident\s*[=,;\[]/ ||
 			# known declaration macros
-		      $sline =~ /^\+\s+$declaration_macros/ ||
+		      $sline =~ /^[\+ ]\s+$declaration_macros/ ||
 			# start of struct or union or enum
-		      $sline =~ /^\+\s+(?:static\s+)?(?:const\s+)?(?:union|struct|enum|typedef)\b/ ||
+		      $sline =~ /^[\+ ]\s+(?:static\s+)?(?:const\s+)?(?:union|struct|enum|typedef)\b/ ||
 			# start or end of block or continuation of declaration
-		      $sline =~ /^\+\s+(?:$|[\{\}\.\#\"\?\:\(\[])/ ||
+		      $sline =~ /^[\+ ]\s+(?:$|[\{\}\.\#\"\?\:\(\[])/ ||
 			# bitfield continuation
-		      $sline =~ /^\+\s+$Ident\s*:\s*\d+\s*[,;]/ ||
+		      $sline =~ /^[\+ ]\s+$Ident\s*:\s*\d+\s*[,;]/ ||
 			# other possible extensions of declaration lines
-		      $sline =~ /^\+\s+\(?\s*(?:$Compare|$Assignment|$Operators)/) &&
+		      $sline =~ /^[\+ ]\s+\(?\s*(?:$Compare|$Assignment|$Operators)/) &&
 			# indentation of previous and current line are the same
-		    (($prevline =~ /\+(\s+)\S/) && $sline =~ /^\+$1\S/)) {
+		    (($prevline =~ /[\+ ](\s+)\S/) && $sline =~ /^[\+ ]$1\S/)) {
 			if (WARN("LINE_SPACING",
 				 "Missing a blank line after declarations\n" . $hereprev) &&
 			    $fix) {
-- 
2.27.0
