From: acripps <acripps@gmail.com>
Date: Mon, 16 Jul 2007 14:06:18 +0000
Subject: [KJ] [third][PATCH 3/4][2.6 drivers/net/skfp/smt.c:]replace SIZE
Message-Id: <20070716141818.30653.70760.sendpatchset@shcherbakov.homelinux.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed the N_SMT_PLEN macro in favor of the more generic ARRAY_SIZE(arr)
defined in kernel.h
Compile tested, no issues found.
Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>

diff --git a/drivers/net/skfp/smt.c b/drivers/net/skfp/smt.c
index 75afc1f..a1c49ed 100644
--- a/drivers/net/skfp/smt.c
+++ b/drivers/net/skfp/smt.c
@@ -1654,8 +1654,6 @@ static const struct smt_pdef {
 	{ SMT_P4053,	0,	SWAP_SMT_P4053			} ,
 } ;
 
-#define N_SMT_PLEN	(sizeof(smt_pdef)/sizeof(smt_pdef[0]))
-
 int smt_check_para(struct s_smc *smc, struct smt_header	*sm,
 		   const u_short list[])
 {
@@ -1881,7 +1879,7 @@ void smt_swap_para(struct smt_header *sm, int len, int direction)
 		if (plen < 0)
 			break ;
 		plen += PARA_LEN ;
-		for (i = N_SMT_PLEN, pd = smt_pdef; i ; i--,pd++) {
+		for (i = ARRAY_SIZE(smt_pdef), pd = smt_pdef; i ; i--,pd++) {
 			if (pd->ptype = type)
 				break ;
 		}
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
