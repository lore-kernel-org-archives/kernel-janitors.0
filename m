From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Apr 2020 09:42:44 +0000
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in ingenic_drm_probe()
Message-Id: <20200408094244.GM2001@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
In-Reply-To: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 06, 2020 at 07:48:52PM +0200, Christophe JAILLET wrote:
> Nevertheless, I wrote another script (see below), which triggers ~2800 times
> in ./drivers only.
> Some are false positives, but most look valid.

I did a quick grep and you're right there are a ton of these!

> 
> Not sure that fixing this kind of stuff really make sense.
> 
> A better approach could be to teach ./checkpatch.pl, but I don't have the
> knowledge for that.

Yeah.  I think so too.  Here is what I tried.  $logFunctions ends up
catching too many functions like process_mcheck_info() so maybe we need
a stricter regex for that.

regards,
dan carpenter

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d64c67b67e3c..1bcfa9e18059 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5493,6 +5493,13 @@ sub process {
 			     "Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst\n" . $herecurr);
 		}
 
+# check for missing newline
+		if ($line =~ /\t$logFunctions\b.*$String[,)]/ && $rawline !~ /\\n/ &&
+			$rawline !~ / "[,)]/ &&
+			$line !~ /debugfs_/ && $line !~ /MODULE_/) {
+			WARN("MISSING_NEWLINE", "Missing newline?\n" . $herecurr);
+		}
+
 # Check for user-visible strings broken across lines, which breaks the ability
 # to grep for the string.  Make exceptions when the previous string ends in a
 # newline (multiple lines in one string constant) or '\t', '\r', ';', or '{'
