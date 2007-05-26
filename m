From: Andi Drebes <webmaster@programmierforen.de>
Date: Sat, 26 May 2007 10:51:07 +0000
Subject: [KJ] [PATCH] drivers/atm/nicstarmac.c: Array size calculations
Message-Id: <200705261251.07441.webmaster@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch replaces a line in drivers/atm/nicstarmac.c
that caluclates the size of an array with the ARRAY_SIZE(x)
macro.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
Compile tested with allyesconfig on i386.
Diffed against Linus' git-tree


diff --git a/drivers/atm/nicstarmac.c b/drivers/atm/nicstarmac.c
index 480947f..842e26c 100644
--- a/drivers/atm/nicstarmac.c
+++ b/drivers/atm/nicstarmac.c
@@ -134,7 +134,7 @@ nicstar_read_eprom_status( virt_addr_t base )
    /* Send read instruction */
    val = NICSTAR_REG_READ( base, NICSTAR_REG_GENERAL_PURPOSE ) & 0xFFFFFFF0;
 
-   for (i=0; i<sizeof rdsrtab/sizeof rdsrtab[0]; i++)
+   for (i=0; i<ARRAY_SIZE(rdsrtab); i++)
    {
 	NICSTAR_REG_WRITE( base, NICSTAR_REG_GENERAL_PURPOSE,
 		(val | rdsrtab[i]) );
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
