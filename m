From: Aaron Cripps <acripps@gmail.com>
Date: Tue, 29 May 2007 21:12:36 +0000
Subject: [KJ] Re: [PATCH ARRAY_SIZE 4/4] kernel 2.6 size macro clean ups in
Message-Id: <465C9A14.2060702@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090502000302080406080600"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090502000302080406080600
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------090502000302080406080600
Content-Type: text/plain;
 name="srfArray_Size.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="srfArray_Size.patch"

Went through and removed the MAX_EVCS and MAX_INIT_EVC macros in favor of
using the ARRAY_SIZE(arr) defined in kernel.h
Compile tested, no issues found.
Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>

diff -Nuar linux-2.6/drivers/net/skfp/srf.c linux-2.6-patched/drivers/net/skfp/srf.c
--- linux-2.6/drivers/net/skfp/srf.c	2007-05-22 20:31:05.000000000 -0230
+++ linux-2.6-patched/drivers/net/skfp/srf.c	2007-05-25 22:40:20.000000000 -0230
@@ -23,7 +23,7 @@
 #include "h/fddi.h"
 #include "h/smc.h"
 #include "h/smt_p.h"
-
+#include <include/linux/kernel.h>
 #define KERNEL
 #include "h/smtstate.h"
 
@@ -43,8 +43,6 @@
 static void smt_send_srf(struct s_smc *smc);
 static struct s_srf_evc *smt_get_evc(struct s_smc *smc, int code, int index);
 
-#define MAX_EVCS	(sizeof(smc->evcs)/sizeof(smc->evcs[0]))
-
 struct evc_init {
 	u_char code ;
 	u_char index ;
@@ -67,8 +65,6 @@
 	{ SMT_EVENT_PORT_PATH_CHANGE,		INDEX_PORT,NUMPHYS,SMT_P4053 } ,
 } ;
 
-#define MAX_INIT_EVC	(sizeof(evc_inits)/sizeof(evc_inits[0]))
-
 void smt_init_evc(struct s_smc *smc)
 {
 	struct s_srf_evc	*evc ;
@@ -84,7 +80,7 @@
 	evc = smc->evcs ;
 	init = evc_inits ;
 
-	for (i = 0 ; (unsigned) i < MAX_INIT_EVC ; i++) {
+	for (i = 0 ; (unsigned) i < ARRAY_SIZE(evc_inits) ; i++) {
 		for (index = 0 ; index < init->n ; index++) {
 			evc->evc_code = init->code ;
 			evc->evc_para = init->para ;
@@ -98,7 +94,7 @@
 		init++ ;
 	}
 
-	if ((unsigned) (evc - smc->evcs) > MAX_EVCS) {
+	if ((unsigned) (evc - smc->evcs) > ARRAY_SIZE(smc->evcs)) {
 		SMT_PANIC(smc,SMT_E0127, SMT_E0127_MSG) ;
 	}
 
@@ -139,7 +135,8 @@
 		offset++ ;
 	}
 #ifdef	DEBUG
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ; 
+			(unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		if (SMT_IS_CONDITION(evc->evc_code)) {
 			if (!evc->evc_cond_state) {
 				SMT_PANIC(smc,SMT_E0128, SMT_E0128_MSG) ;
@@ -163,7 +160,8 @@
 	int			i ;
 	struct s_srf_evc	*evc ;
 
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ;
+			(unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		if (evc->evc_code == code && evc->evc_index == index)
 			return(evc) ;
 	}
@@ -337,7 +335,8 @@
 	struct s_srf_evc	*evc ;
 	int			i ;
 
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ;
+			(unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		evc->evc_rep_required = FALSE ;
 		if (SMT_IS_CONDITION(evc->evc_code))
 			*evc->evc_cond_state = FALSE ;
@@ -351,7 +350,8 @@
 	int			i ;
 
 	smc->srf.any_report = FALSE ;
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ;
+			(unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		if (SMT_IS_CONDITION(evc->evc_code)) {
 			if (*evc->evc_cond_state == FALSE)
 				evc->evc_rep_required = FALSE ;
@@ -405,7 +405,8 @@
 	smt_add_para(smc,&pcon,(u_short) SMT_P1033,0,0) ;
 	smt_add_para(smc,&pcon,(u_short) SMT_P1034,0,0) ;
 
-	for (i = 0, evc = smc->evcs ; (unsigned) i < MAX_EVCS ; i++, evc++) {
+	for (i = 0, evc = smc->evcs ;
+			(unsigned) i < ARRAY_SIZE(smc->evcs) ; i++, evc++) {
 		if (evc->evc_rep_required) {
 			smt_add_para(smc,&pcon,evc->evc_para,
 				(int)evc->evc_index,0) ;


--------------090502000302080406080600
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--------------090502000302080406080600--
