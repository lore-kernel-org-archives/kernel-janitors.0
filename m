From: Joe Perches <joe@perches.com>
Date: Tue, 09 Sep 2014 20:38:13 +0000
Subject: [PATCH] checkpatch: Warn on macros with flow control statements
Message-Id: <1410295093.12560.60.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1410106715-9573-6-git-send-email-Julia.Lawall@lip6.fr>
	 <20140909125410.GJ6549@mwanda>
In-Reply-To: <20140909125410.GJ6549@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Whitcroft <apw@canonical.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, "Dilger, Andreas" <andreas.dilger@intel.com>, Peng Tao <bergwolf@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Drokin, Oleg" <oleg.drokin@intel.com>

Macros with flow control statements (goto and return) are
not very nice to read as any flow movement is unexpected.

Try to highlight them and emit a warning on their definition.

Avoid warning on macros that use argument concatenation as
those macros commonly create another function where the
concatenation is used in the function name definition like:
	#define FOO_FUNC(name, rtn_type)	\
	rtn_type func##name(arg1, ...)		\
	{					\
		rtn_type rtn;			\
		[code...]			\
		return rtn;			\
	}

Signed-off-by: Joe Perches <joe@perches.com>
---
>    460  #define OBD_CHECK_DT_OP(obd, op, err)                      \
>    461  do {                                                        \
>    462          if (!OBT(obd) || !OBP((obd), op)) {                  \
>    463                  if (err)                                        \
>    464                          CERROR("obd_" #op ": dev %d no operation\n",    \
>    465                                 obd->obd_minor);          \
>    466                  return err;                                 \
>    467          }                                                      \
>    468  } while (0)
> 
> Wow!  What a terrible macro!  None of the '\' are in a line.  There is
> a hidden return statement in it which is a terrible thing and flow
> control statements are not allowed inside macros.

 scripts/checkpatch.pl | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index da7b2d4..dc5434a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4071,12 +4071,17 @@ sub process {
 			my $cnt = $realcnt;
 			my ($off, $dstat, $dcond, $rest);
 			my $ctx = '';
+			my $has_flow_statement = 0;
+			my $has_arg_concat = 0;
 			($dstat, $dcond, $ln, $cnt, $off)  				ctx_statement_block($linenr, $realcnt, 0);
 			$ctx = $dstat;
 			#print "dstat<$dstat> dcond<$dcond> cnt<$cnt> off<$off>\n";
 			#print "LINE<$lines[$ln-1]> len<" . length($lines[$ln-1]) . "\n";
 
+			$has_flow_statement = 1 if ($ctx =~ /\b(goto|return)\b/);
+			$has_arg_concat = 1 if ($ctx =~ /\#\#/);
+
 			$dstat =~ s/^.\s*\#\s*define\s+$Ident(?:\([^\)]*\))?\s*//;
 			$dstat =~ s/$;//g;
 			$dstat =~ s/\\\n.//g;
@@ -4141,6 +4146,19 @@ sub process {
 				}
 			}
 
+# check for macros with flow control, but without ## concatenation
+# ## concatenation is commonly a macro that defines a function so ignore those
+			if ($has_flow_statement && !$has_arg_concat) {
+				my $herectx = $here . "\n";
+				my $cnt = statement_rawlines($ctx);
+
+				for (my $n = 0; $n < $cnt; $n++) {
+					$herectx .= raw_line($linenr, $n) . "\n";
+				}
+				WARN("MACRO_WITH_FLOW_CONTROL",
+				     "Macros with flow control statements should be avoided\n" . "$herectx");
+			}
+
 # check for line continuations outside of #defines, preprocessor #, and asm
 
 		} else {


