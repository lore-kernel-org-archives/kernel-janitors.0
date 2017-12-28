From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 20:32:52 +0000
Subject: [PATCH 2/2] pcmcia/rsrc_nonstatic: Improve a size determination in three functions
Message-Id: <4ec19574-d66d-5138-dca9-463235e3e717@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <19f2a908-8515-ce68-bbba-e74dd90d6ad2@users.sourceforge.net>
In-Reply-To: <19f2a908-8515-ce68-bbba-e74dd90d6ad2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 21:07:39 +0100

Replace the specification of data structures by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/rsrc_nonstatic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index 91dc559e4a81..50169b00f389 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -120,7 +120,7 @@ static int add_interval(struct resource_map *map, u_long base, u_long num)
 		if ((p->next = map) || (p->next->base > base+num-1))
 			break;
 	}
-	q = kmalloc(sizeof(struct resource_map), GFP_KERNEL);
+	q = kmalloc(sizeof(*q), GFP_KERNEL);
 	if (!q)
 		return -ENOMEM;
 
@@ -157,8 +157,7 @@ static int sub_interval(struct resource_map *map, u_long base, u_long num)
 				q->num = base - q->base;
 			} else {
 				/* Split the block into two pieces */
-				p = kmalloc(sizeof(struct resource_map),
-					GFP_KERNEL);
+				p = kmalloc(sizeof(*p), GFP_KERNEL);
 				if (!p)
 					return -ENOMEM;
 
@@ -1014,9 +1013,8 @@ static inline int nonstatic_autoadd_resources(struct pcmcia_socket *s)
 
 static int nonstatic_init(struct pcmcia_socket *s)
 {
-	struct socket_data *data;
+	struct socket_data *data = kzalloc(sizeof(*data), GFP_KERNEL);
 
-	data = kzalloc(sizeof(struct socket_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-- 
2.15.1

