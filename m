From: Julia Lawall <julia@diku.dk>
Date: Sun, 09 Nov 2008 16:55:49 +0000
Subject: [PATCH 5/8] drivers/mtd/maps/nettel.c: use ARRAY_SIZE
Message-Id: <Pine.LNX.4.64.0811091755280.32509@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

ARRAY_SIZE is more concise to use when the size of an array is divided by
the size of its type or the size of its first element.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@i@
@@

#include <linux/kernel.h>

@depends on i using "paren.iso"@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(E[...]))
+ ARRAY_SIZE(E)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/nettel.c     |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/nettel.c b/drivers/mtd/maps/nettel.c
index 965e6c6..f38e92c 100644
--- a/drivers/mtd/maps/nettel.c
+++ b/drivers/mtd/maps/nettel.c
@@ -362,8 +362,7 @@ static int __init nettel_init(void)
 
 	intel_mtd->owner = THIS_MODULE;
 
-	num_intel_partitions = sizeof(nettel_intel_partitions) /
-		sizeof(nettel_intel_partitions[0]);
+	num_intel_partitions = ARRAY_SIZE(nettel_intel_partitions);
 
 	if (intelboot) {
 		/*
