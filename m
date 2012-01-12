From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 12 Jan 2012 09:55:07 +0000
Subject: [PATCH 5/15] drivers/dio/dio.c: add missing iounmap
Message-Id: <1326362117-29371-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Add missing iounmap in error handling code, in a case where the function
already preforms iounmap on some other execution path.

Additionally return an error code on failure of kzalloc.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
statement S,S1;
int ret;
@@
e = \(ioremap\|ioremap_nocache\)(...)
... when != iounmap(e)
if (<+...e...+>) S
... when any
    when != iounmap(e)
*if (...)
   { ... when != iounmap(e)
     return ...; }
... when any
iounmap(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/dio/dio.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dio/dio.c b/drivers/dio/dio.c
index 55dd88d..b37dcc9 100644
--- a/drivers/dio/dio.c
+++ b/drivers/dio/dio.c
@@ -228,8 +228,11 @@ static int __init dio_init(void)
 
                 /* Found a board, allocate it an entry in the list */
 		dev = kzalloc(sizeof(struct dio_dev), GFP_KERNEL);
-		if (!dev)
-			return 0;
+		if (!dev) {
+			if (scode >= DIOII_SCBASE)
+				iounmap(va);
+			return -ENOMEM;
+		}
 
 		dev->bus = &dio_bus;
 		dev->dev.parent = &dio_bus.dev;

