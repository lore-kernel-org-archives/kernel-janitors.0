From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Oct 2014 09:35:05 +0000
Subject: [patch] checkpatch: remove the ether_addr_copy warning
Message-Id: <20141003093505.GA7393@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Whitcroft <apw@canonical.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Joe Perches <joe@perches.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org

Most people sending checkpatch.pl fixes don't know how to verify the
alignment.  This checkpatch warning just encourages newbies to try
introduce bugs.  Patch submitters tell us that they just sed the code
and it's the job for the maintainer to check that it's correct.

If you want to work on these then you can get the same information by
typing `grep -nw memcpy drivers/net/ -R | grep ETH_ALEN`

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 52a223e..d540dd4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4698,16 +4698,6 @@ sub process {
 			}
 		}
 
-# Check for memcpy(foo, bar, ETH_ALEN) that could be ether_addr_copy(foo, bar)
-		if ($^V && $^V ge 5.10.0 &&
-		    $line =~ /^\+(?:.*?)\bmemcpy\s*\(\s*$FuncArg\s*,\s*$FuncArg\s*\,\s*ETH_ALEN\s*\)/s) {
-			if (WARN("PREFER_ETHER_ADDR_COPY",
-				 "Prefer ether_addr_copy() over memcpy() if the Ethernet addresses are __aligned(2)\n" . $herecurr) &&
-			    $fix) {
-				$fixed[$fixlinenr] =~ s/\bmemcpy\s*\(\s*$FuncArg\s*,\s*$FuncArg\s*\,\s*ETH_ALEN\s*\)/ether_addr_copy($2, $7)/;
-			}
-		}
-
 # typecasts on min/max could be min_t/max_t
 		if ($^V && $^V ge 5.10.0 &&
 		    defined $stat &&
