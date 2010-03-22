From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 12:10:35 +0000
Subject: [patch] pxa168fb: use resource_size()
Message-Id: <20100322121034.GI21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jun Nie <njun@marvell.com>
Cc: Eric Miao <eric.y.miao@gmail.com>, Lennert Buytenhek <buytenh@marvell.com>, Krzysztof Helt <krzysztof.h1@wp.pl>, Kevin Liu <kliu5@marvell.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The size calculation is not correct.  It should be end - start + 1.
Use resource_size() to caculate it.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This was found by a static checker and I don't have the hardware to
test it.  Please review carefully.

diff --git a/drivers/video/pxa168fb.c b/drivers/video/pxa168fb.c
index 75285d3..c91a7f7 100644
--- a/drivers/video/pxa168fb.c
+++ b/drivers/video/pxa168fb.c
@@ -668,7 +668,7 @@ static int __init pxa168fb_probe(struct platform_device *pdev)
 	/*
 	 * Map LCD controller registers.
 	 */
-	fbi->reg_base = ioremap_nocache(res->start, res->end - res->start);
+	fbi->reg_base = ioremap_nocache(res->start, resource_size(res));
 	if (fbi->reg_base = NULL) {
 		ret = -ENOMEM;
 		goto failed;
