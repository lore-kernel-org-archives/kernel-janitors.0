From: Florian Westphal <fw-kernel@strlen.de>
Date: Fri, 21 Jul 2006 12:53:48 +0000
Subject: [KJ] [PATCH] drivers/mtd/nand/toto.c: Fix non-existent goto out_buf
Message-Id: <20060721125348.GA25203@Chamillionaire.breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Florian Westphal <florian.westphal@strlen.de>

Fix nonexistent "goto out_buf".

Signed-off-by: Florian Westphal <florian.westphal@strlen.de>

---

diff --git a/drivers/mtd/nand/toto.c b/drivers/mtd/nand/toto.c
index f9e2d4a..034e30b 100644
--- a/drivers/mtd/nand/toto.c
+++ b/drivers/mtd/nand/toto.c
@@ -166,7 +166,7 @@ static int __init toto_init(void)
 	default:{
 			printk(KERN_WARNING "Unsupported Nand device\n");
 			err = -ENXIO;
-			goto out_buf;
+			goto out_mtd;
 		}
 	}
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
