From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 14:03:38 +0000
Subject: [PATCH 2/2] pcmcia: Delete an error message for a failed memory allocation in two functions
Message-Id: <735d7330-c00d-618f-54c2-ddf54f3e06cc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d48eee5-11d8-e44e-8c11-6370ae7a7ea1@users.sourceforge.net>
In-Reply-To: <0d48eee5-11d8-e44e-8c11-6370ae7a7ea1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 15:23:42 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/rsrc_nonstatic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index 2e03dd8f1157..7b5bc6f6f496 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -124,7 +124,6 @@ static int add_interval(struct resource_map *map, u_long base, u_long num)
-	if (!q) {
-		printk(KERN_WARNING "out of memory to update resources\n");
+	if (!q)
 		return -ENOMEM;
-	}
+
 	q->base = base; q->num = num;
 	q->next = p->next; p->next = q;
 	return 0;
@@ -162,7 +161,6 @@ static int sub_interval(struct resource_map *map, u_long base, u_long num)
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
2.13.0

