From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 20:31:30 +0000
Subject: [PATCH 1/2] pcmcia/rsrc_nonstatic: Delete an error message for a failed memory allocation in two fun
Message-Id: <83f35ec9-6c67-a321-290d-c4ad9b401171@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <19f2a908-8515-ce68-bbba-e74dd90d6ad2@users.sourceforge.net>
In-Reply-To: <19f2a908-8515-ce68-bbba-e74dd90d6ad2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 21:00:13 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/rsrc_nonstatic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index 5ef7b46a2578..91dc559e4a81 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -121,10 +121,9 @@ static int add_interval(struct resource_map *map, u_long base, u_long num)
 			break;
 	}
 	q = kmalloc(sizeof(struct resource_map), GFP_KERNEL);
-	if (!q) {
-		printk(KERN_WARNING "out of memory to update resources\n");
+	if (!q)
 		return -ENOMEM;
-	}
+
 	q->base = base; q->num = num;
 	q->next = p->next; p->next = q;
 	return 0;
@@ -160,10 +159,9 @@ static int sub_interval(struct resource_map *map, u_long base, u_long num)
 				/* Split the block into two pieces */
 				p = kmalloc(sizeof(struct resource_map),
 					GFP_KERNEL);
-				if (!p) {
-					printk(KERN_WARNING "out of memory to update resources\n");
+				if (!p)
 					return -ENOMEM;
-				}
+
 				p->base = base+num;
 				p->num = q->base+q->num - p->base;
 				q->num = base - q->base;
-- 
2.15.1

