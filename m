From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jul 2016 11:16:44 +0000
Subject: [patch] MIPS: RM7000: Double locking bug in rm7k_tc_disable()
Message-Id: <20160715111644.GA13153@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, Ricardo Mendoza <ricmm@gentoo.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We obviously intended to enable IRQs again at the end.

Fixes: 745aef5df1e2 ('MIPS: RM7000: Add support for tertiary cache')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/mips/mm/sc-rm7k.c b/arch/mips/mm/sc-rm7k.c
index 9ac1efc..78f900c 100644
--- a/arch/mips/mm/sc-rm7k.c
+++ b/arch/mips/mm/sc-rm7k.c
@@ -161,7 +161,7 @@ static void rm7k_tc_disable(void)
 	local_irq_save(flags);
 	blast_rm7k_tcache();
 	clear_c0_config(RM7K_CONF_TE);
-	local_irq_save(flags);
+	local_irq_restore(flags);
 }
 
 static void rm7k_sc_disable(void)
