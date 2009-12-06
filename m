From: Julia Lawall <julia@diku.dk>
Date: Sun, 06 Dec 2009 09:15:32 +0000
Subject: [PATCH 1/5] arch/xtensa/platforms/iss: correct size computation
Message-Id: <Pine.LNX.4.64.0912061015030.20858@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The size argument to alloc_bootmem should be the size of desired structure,
not the pointer to it.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@expression@
expression *x;
@@

x  <+...
-sizeof(x)
+sizeof(*x)
...+>// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/xtensa/platforms/iss/network.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/xtensa/platforms/iss/network.c b/arch/xtensa/platforms/iss/network.c
index 2f0b86b..54a0868 100644
--- a/arch/xtensa/platforms/iss/network.c
+++ b/arch/xtensa/platforms/iss/network.c
@@ -780,7 +780,8 @@ static int iss_net_setup(char *str)
 		return 1;
 	}
 
-	if ((new = alloc_bootmem(sizeof new)) = NULL) {
+	new = alloc_bootmem(sizeof(*new));
+	if (new = NULL) {
 		printk("Alloc_bootmem failed\n");
 		return 1;
 	}
