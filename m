From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 14:02:20 +0000
Subject: [PATCH 1/2] pcmcia: Improve a size determination in three functions
Message-Id: <8be57460-344a-8393-9300-8ef164784a0c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d48eee5-11d8-e44e-8c11-6370ae7a7ea1@users.sourceforge.net>
In-Reply-To: <0d48eee5-11d8-e44e-8c11-6370ae7a7ea1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 15:13:00 +0200

Replace the specification of three data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/rsrc_nonstatic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index 5ef7b46a2578..2e03dd8f1157 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -120,5 +120,5 @@ static int add_interval(struct resource_map *map, u_long base, u_long num)
 		if ((p->next = map) || (p->next->base > base+num-1))
 			break;
 	}
-	q = kmalloc(sizeof(struct resource_map), GFP_KERNEL);
+	q = kmalloc(sizeof(*q), GFP_KERNEL);
 	if (!q) {
@@ -158,6 +158,5 @@ static int sub_interval(struct resource_map *map, u_long base, u_long num)
 				q->num = base - q->base;
 			} else {
 				/* Split the block into two pieces */
-				p = kmalloc(sizeof(struct resource_map),
-					GFP_KERNEL);
+				p = kmalloc(sizeof(*p), GFP_KERNEL);
 				if (!p) {
@@ -1018,7 +1017,7 @@ static int nonstatic_init(struct pcmcia_socket *s)
 {
 	struct socket_data *data;
 
-	data = kzalloc(sizeof(struct socket_data), GFP_KERNEL);
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-- 
2.13.0

