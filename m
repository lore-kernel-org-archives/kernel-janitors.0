From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Jan 2018 18:23:36 +0000
Subject: [PATCH] Coccinelle: memdup: drop spurious line
Message-Id: <1517077416-17848-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

The kmemdup line in the non-patch case was left over from the added kmemdup
line in the patch case.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/api/memdup.cocci |    1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/coccinelle/api/memdup.cocci b/scripts/coccinelle/api/memdup.cocci
index 3d1aa71..1249b72 100644
--- a/scripts/coccinelle/api/memdup.cocci
+++ b/scripts/coccinelle/api/memdup.cocci
@@ -49,7 +49,6 @@ statement S;
 @@
 
 *  to = \(kmalloc@p\|kzalloc@p\)(size,flag);
-   to = kmemdup(from,size,flag);
    if (to=NULL || ...) S
 *  memcpy(to, from, size);
 

