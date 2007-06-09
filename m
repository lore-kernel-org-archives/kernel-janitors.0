From: acripps <acripps@gmail.com>
Date: Sat, 09 Jun 2007 03:02:11 +0000
Subject: [KJ] [PATCH 3/4] 2.6 drivers/net smt replace SIZE Macros
Message-Id: <20070609031411.14624.92975.sendpatchset@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed the N_SMT_PLEN macro in favor of the more generic ARRAY_SIZE(arr)
defined in kernel.h This required minor code reformatting to stick to the 80
charcter convention. 
Compile tested, no issues found.
Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>

diff -Nuar linux-2.6/drivers/net/skfp/smt.c linux-2.6-patched/drivers/net/skfp/smt.c
--- linux-2.6/drivers/net/skfp/smt.c	2007-05-22 20:31:05.000000000 -0230
+++ linux-2.6-patched/drivers/net/skfp/smt.c	2007-05-25 22:40:04.000000000 -0230
@@ -1654,8 +1654,6 @@
 	{ SMT_P4053,	0,	SWAP_SMT_P4053			} ,
 } ;
 
-#define N_SMT_PLEN	(sizeof(smt_pdef)/sizeof(smt_pdef[0]))
-
 int smt_check_para(struct s_smc *smc, struct smt_header	*sm,
 		   const u_short list[])
 {
@@ -1881,7 +1879,7 @@
 		if (plen < 0)
 			break ;
 		plen += PARA_LEN ;
-		for (i = N_SMT_PLEN, pd = smt_pdef; i ; i--,pd++) {
+		for (i = ARRAY_SIZE(smt_pdef), pd = smt_pdef; i ; i--,pd++) {
 			if (pd->ptype = type)
 				break ;
 		}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
