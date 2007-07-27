From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 09:44:18 +0000
Subject: [PATCH 04/68] 0 -> NULL, for arch/blackfin
Message-Id: <200707270944.LAA17116@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: aubrey.li@analog.com, bryan.wu@analog.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


When comparing a pointer, it's clearer to compare it to NULL than to 0.

Here is an excerpt of the semantic patch: 

@@
expression *E;
@@

  E =
- 0
+ NULL

@@
expression *E;
@@

  E !- 0
+ NULL

Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
Cc: aubrey.li@analog.com
Cc: bryan.wu@analog.com
Cc: akpm@linux-foundation.org
---

 traps.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/blackfin/kernel/traps.c b/arch/blackfin/kernel/traps.c
index 3909f5b..691c66d 100644
--- a/arch/blackfin/kernel/traps.c
+++ b/arch/blackfin/kernel/traps.c
@@ -546,7 +546,7 @@ void dump_bfin_regs(struct pt_regs *fp, 
 	}
 
 	printk(KERN_EMERG "return address: [0x%p]; contents of:", retaddr);
-	if (retaddr != 0 && retaddr <= (void *)physical_mem_end
+	if (retaddr != NULL && retaddr <= (void *)physical_mem_end
 #if L1_CODE_LENGTH != 0
 	    /* FIXME: Copy the code out of L1 Instruction SRAM through dma
 	       memcpy.  */

