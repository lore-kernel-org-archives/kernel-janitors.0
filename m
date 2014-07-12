From: Joe Perches <joe@perches.com>
Date: Sat, 12 Jul 2014 02:09:30 +0000
Subject: [PATCH] checkpatch: Remove unnecessary + after {8,8}
Message-Id: <1405130970.6751.37.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013927.GA30781@kroah.com> <1405129612.6751.24.camel@joe-AO725>
	<20140712020114.GA12301@kroah.com> <20140712020520.GA18611@kroah.com>
In-Reply-To: <20140712020520.GA18611@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

There's a useless "+" use that needs to be removed as perl 5.20
emits a "Useless use of greediness modifier '+'" message each
time it's hit.

Reported-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Joe Perches <joe@perches.com>
---
On Fri, 2014-07-11 at 19:05 -0700, Greg KH wrote:
> Ok, with linux-next I get the same thing:

Thanks Greg.

 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d5ac001..370a974 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2376,7 +2376,7 @@ sub process {
 				"please, no space before tabs\n" . $herevet) &&
 			    $fix) {
 				while ($fixed[$fixlinenr] =~
-					   s/(^\+.*) {8,8}+\t/$1\t\t/) {}
+					   s/(^\+.*) {8,8}\t/$1\t\t/) {}
 				while ($fixed[$fixlinenr] =~
 					   s/(^\+.*) +\t/$1\t/) {}
 			}


