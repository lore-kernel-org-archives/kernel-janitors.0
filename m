From: Dan Carpenter <error27@gmail.com>
Date: Tue, 04 Jan 2011 05:59:00 +0000
Subject: [patch] checkpatch: putting the && or || on the wrong line
Message-Id: <20110104055900.GA5062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Whitcroft <apw@canonical.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, joe@perches.com

This patch makes checkpatch.pl complain if you break up conditions in
the wrong way.

Wrong:
	if ((really_long_condition)
		&& (second_condition)) { ...
Right:
	if ((really_long_condition) &&
		(second_condition)) { ...

If you do it in the wrong way the message is:  "put the && or || at the
end of the previous line"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e3c7fc0..0a813db 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1509,6 +1509,11 @@ sub process {
 			WARN("please, no space before tabs\n" . $herevet);
 		}
 
+# check for && or || at the start of a line
+		if ($rawline =~ /^\+\W+(&&|\|\|)/) {
+			WARN("put the && or || at the end of the previous line\n" . $herecurr);
+		}
+
 # check for spaces at the beginning of a line.
 # Exceptions:
 #  1) within comments
