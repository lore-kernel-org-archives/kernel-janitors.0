From: acripps <acripps@gmail.com>
Date: Mon, 16 Jul 2007 14:06:25 +0000
Subject: [KJ] [third][PATCH 4/4][2.6 drivers/net/skfp/srf.c:]replace SIZE
Message-Id: <20070716141825.30653.47838.sendpatchset@shcherbakov.homelinux.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Went through and removed the MAX_EVCS and MAX_INIT_EVC macros in favor of
using the ARRAY_SIZE(arr) defined in kernel.h
Compile tested, no issues found.
Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>

diff --git a/drivers/net/skfp/srf.c b/drivers/net/skfp/srf.c
index 16573ac..5eb80b5 100644
--- a/drivers/net/skfp/srf.c
+++ b/drivers/net/skfp/srf.c
@@ -27,6 +27,8 @@
 #define KERNEL
 #include "h/smtstate.h"
 
+#include <linux/kernel.h>
+
 #ifndef	SLIM_SMT
 #ifndef	BOOT
 
@@ -43,7 +45,6 @@ static void clear_reported(struct s_smc *smc);
 static void smt_send_srf(struct s_smc *smc);
 static struct s_srf_evc *smt_get_evc(struct s_smc *smc, int code, int index);
 
-#define MAX_EVCS	(sizeof(smc->evcs)/sizeof(smc->evcs[0]))
 
 struct evc_init {
 	u_char code ;
@@ -67,8 +68,6 @@ static const struct evc_init evc_inits[] = {
 	{ SMT_EVENT_PORT_PATH_CHANGE,		INDEX_PORT,NUMPHYS,SMT_P4053 } ,
 } ;
 
-#define MAX_INIT_EVC	(sizeof(evc_inits)/sizeof(evc_inits[0]))
-
 void smt_init_evc(struct s_smc *smc)
 {
 	struct s_srf_evc	*evc ;
@@ -84,7 +83,7 @@ void smt_init_evc(struct s_smc *smc)
 	evc = smc->evcs ;
 	init = evc_inits ;
 
-	for (i = 0 ; (unsigned) i < MAX_INIT_EVC ; i++) {
+	for (i = 0 ; (unsigned) i < ARRAY_SIZE(evc_inits) ; i++) {
 		for (index = 0 ; index < init->n ; index++) {
 			evc->evc_code = init->code ;
 			evc->evc_para = init->para ;
@@ -98,7 +97,7 @@ void smt_init_evc(struct s_smc *smc)
 		init++ ;
 	}
 
-	if ((unsigned) (evc - smc->evcs) > MAX_EVCS) {
+	if ((unsigned) (evc - smc->evcs) > ARRAY_SIZE(smc->evcs)) {
 		SMT_PANIC(smc,SMT_E0127, SMT_E0127_MSG) ;
 	}
 
@@ -139,7 +138,7 @@ void smt_init_evc(struct s_smc *smc)
 		offset++ ;
 	}
 #ifdef	DEBUG
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ; (unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		if (SMT_IS_CONDITION(evc->evc_code)) {
 			if (!evc->evc_cond_state) {
 				SMT_PANIC(smc,SMT_E0128, SMT_E0128_MSG) ;
@@ -163,7 +162,7 @@ static struct s_srf_evc *smt_get_evc(struct s_smc *smc, int code, int index)
 	int			i ;
 	struct s_srf_evc	*evc ;
 
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ; (unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		if (evc->evc_code = code && evc->evc_index = index)
 			return(evc) ;
 	}
@@ -337,7 +336,7 @@ static void clear_all_rep(struct s_smc *smc)
 	struct s_srf_evc	*evc ;
 	int			i ;
 
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ; (unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		evc->evc_rep_required = FALSE ;
 		if (SMT_IS_CONDITION(evc->evc_code))
 			*evc->evc_cond_state = FALSE ;
@@ -351,7 +350,7 @@ static void clear_reported(struct s_smc *smc)
 	int			i ;
 
 	smc->srf.any_report = FALSE ;
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ; (unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		if (SMT_IS_CONDITION(evc->evc_code)) {
 			if (*evc->evc_cond_state = FALSE)
 				evc->evc_rep_required = FALSE ;
@@ -405,7 +404,7 @@ static void smt_send_srf(struct s_smc *smc)
 	smt_add_para(smc,&pcon,(u_short) SMT_P1033,0,0) ;
 	smt_add_para(smc,&pcon,(u_short) SMT_P1034,0,0) ;
 
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ; (unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		if (evc->evc_rep_required) {
 			smt_add_para(smc,&pcon,evc->evc_para,
 				(int)evc->evc_index,0) ;
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
