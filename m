From: Julia Lawall <julia@diku.dk>
Date: Fri, 30 Jul 2010 15:17:28 +0000
Subject: [PATCH 2/2] arch/arm/common: Eliminate use after free
Message-Id: <Pine.LNX.4.64.1007301717040.17618@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <julia@diku.dk>

__sa1111_remove always frees its argument, so the subsequent reference to
sachip->saved_state represents a use after free.  __sa1111_remove does not
appear to use the saved_state field, so the patch simply frees it first.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E,E2;
@@

__sa1111_remove(E)
...
(
  E = E2
|
* E
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
arch/arm/common/sa1111.c            |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index ac2fd44..517d50d 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -1025,13 +1025,12 @@ static int sa1111_remove(struct platform_device *pdev)
 	struct sa1111 *sachip = platform_get_drvdata(pdev);
 
 	if (sachip) {
-		__sa1111_remove(sachip);
-		platform_set_drvdata(pdev, NULL);
-
 #ifdef CONFIG_PM
 		kfree(sachip->saved_state);
 		sachip->saved_state = NULL;
 #endif
+		__sa1111_remove(sachip);
+		platform_set_drvdata(pdev, NULL);
 	}
 
 	return 0;
