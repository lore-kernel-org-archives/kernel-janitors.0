From: Amit Choudhary <amit2030@gmail.com>
Date: Sun, 29 Oct 2006 08:53:38 +0000
Subject: [KJ]  [PATCH] drivers/atm/fore200e.c: change in error message.
Message-Id: <20061029015338.8df2a8cb.amit2030@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: Change in error message in function fore200e_kmalloc(), in file drivers/atm/fore200e.c.

Signed-off-by: Amit Choudhary <amit2030@gmail.com>

diff --git a/drivers/atm/fore200e.c b/drivers/atm/fore200e.c
index 3a7b21f..1c7ea02 100644
--- a/drivers/atm/fore200e.c
+++ b/drivers/atm/fore200e.c
@@ -178,7 +178,7 @@ fore200e_kmalloc(int size, gfp_t flags)
     void *chunk = kzalloc(size, flags);
 
     if (!chunk)
-	printk(FORE200E "kmalloc() failed, requested size = %d, flags = 0x%x\n",			size, flags);
+	printk(FORE200E "kzalloc() failed, requested size = %d, flags = 0x%x\n",			size, flags);
     
     return chunk;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
