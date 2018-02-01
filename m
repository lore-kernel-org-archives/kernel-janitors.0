From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 01 Feb 2018 09:20:55 +0000
Subject: [PATCH] Coccinelle: coccicheck: fix typo
Message-Id: <1517476855-5235-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Correct spelling of "coccinelle".

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccicheck |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index ecfac64..9fedca6 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -177,7 +177,7 @@ coccinelle () {
     REQ_NUM=$(echo $REQ | ${DIR}/scripts/ld-version.sh)
     if [ "$REQ_NUM" != "0" ] ; then
 	    if [ "$SPATCH_VERSION_NUM" -lt "$REQ_NUM" ] ; then
-		    echo "Skipping coccinele SmPL patch: $COCCI"
+		    echo "Skipping coccinelle SmPL patch: $COCCI"
 		    echo "You have coccinelle:           $SPATCH_VERSION"
 		    echo "This SmPL patch requires:      $REQ"
 		    return

