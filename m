From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 15:20:34 +0000
Subject: [PATCH] coccicheck: use $KBUILD_EXTMOD when available
Message-Id: <1278170438-8136-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix@diku.dk>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joerg Roedel <joerg.roedel@amd.com>, cocci@diku.dk, linux-kernel@vger.kernel.org

Use $KBUILD_EXTMOD instead of $srctree when the latter is not null
to use make M=somedir.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 scripts/coccicheck |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index b8bcf1f..7d66a55 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -1,5 +1,11 @@
 #!/bin/sh
 
+if [ -n "$KBUILD_EXTMOD" ]; then
+	CHECK_DIR="$KBUILD_EXTMOD"
+else
+	CHECK_DIR="$srctree"
+fi
+
 SPATCH="`which ${SPATCH:=spatch}`"
 
 if [ "$C" = "1" -o "$C" = "2" ]; then
@@ -64,7 +70,7 @@ coccinelle () {
 	echo ' http://coccinelle.lip6.fr/'
 	echo ''
 
-	$SPATCH -D $MODE $FLAGS -sp_file $COCCI $OPT -dir $srctree || exit 1
+	$SPATCH -D $MODE $FLAGS -sp_file $COCCI $OPT -dir $CHECK_DIR || exit 1
     else
 	$SPATCH -D $MODE $FLAGS -sp_file $COCCI $OPT $OPTIONS || exit 1
     fi
-- 
1.7.0.4

