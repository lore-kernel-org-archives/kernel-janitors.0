From: Julia Lawall <julia@diku.dk>
Date: Tue, 03 Aug 2010 21:33:43 +0000
Subject: [PATCH 4/9] arch/powerpc/platforms/powermac: Drop unnecessary null
Message-Id: <Pine.LNX.4.64.1008032333250.20393@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

for_each_node_by_name binds its first argument to a non-null value, and
thus any null test on the value of that argument is superfluous.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
iterator I;
expression x,E;
@@

I(x,...) { <...
(
- (x != NULL) &&
  E
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/platforms/powermac/feature.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 9e1b9fd..537957b 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -2867,7 +2867,7 @@ set_initial_features(void)
 
 		/* Switch airport off */
 		for_each_node_by_name(np, "radio") {
-			if (np && np->parent = macio_chips[0].of_node) {
+			if (np->parent = macio_chips[0].of_node) {
 				macio_chips[0].flags |= MACIO_FLAG_AIRPORT_ON;
 				core99_airport_enable(np, 0, 0);
 			}
