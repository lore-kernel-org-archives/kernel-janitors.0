From: Michael Veeck <michael.veeck@gmx.net>
Date: Sun, 15 Aug 2004 11:43:33 +0000
Subject: [Kernel-janitors] [PATCH] minmax-removal arch/ia64/kernel/unwind.c
Message-Id: <411F4C65.70502@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000604020809050102040308"
List-Id: <kernel-janitors.vger.kernel.org>
References: <411F4C54.4090609@gmx.net>
In-Reply-To: <411F4C54.4090609@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000604020809050102040308
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.8.1) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Since I dont have the hardware those patches are not tested.

Best regards
Veeck

Signed-off-by: Michael Veeck <michael.veeck@gmx.net>





--------------000604020809050102040308
Content-Type: text/plain;
 name="minmax-arch-ia64-kernel.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax-arch-ia64-kernel.patch"

--- linux-2.6.8-old/arch/ia64/kernel/unwind.c	2004-08-14 11:49:01.000000000 +0200
+++ linux-2.6.8-new/arch/ia64/kernel/unwind.c	2004-08-15 13:03:05.789019200 +0200
@@ -47,7 +47,6 @@
 #include "entry.h"
 #include "unwind_i.h"
 
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
 #define p5		5
 
 #define UNW_LOG_CACHE_SIZE	7	/* each unw_script is ~256 bytes in size */
@@ -963,13 +962,13 @@ static inline void
 desc_mem_stack_f (unw_word t, unw_word size, struct unw_state_record *sr)
 {
 	set_reg(sr->curr.reg + UNW_REG_PSP, UNW_WHERE_NONE,
-		sr->region_start + MIN((int)t, sr->region_len - 1), 16*size);
+		sr->region_start + min_t(int, t, sr->region_len - 1), 16*size);
 }
 
 static inline void
 desc_mem_stack_v (unw_word t, struct unw_state_record *sr)
 {
-	sr->curr.reg[UNW_REG_PSP].when = sr->region_start + MIN((int)t, sr->region_len - 1);
+	sr->curr.reg[UNW_REG_PSP].when = sr->region_start + min_t(int, t, sr->region_len - 1);
 }
 
 static inline void
@@ -1005,7 +1004,7 @@ desc_reg_when (unsigned char regnum, unw
 
 	if (reg->where == UNW_WHERE_NONE)
 		reg->where = UNW_WHERE_GR_SAVE;
-	reg->when = sr->region_start + MIN((int)t, sr->region_len - 1);
+	reg->when = sr->region_start + min_t(int, t, sr->region_len - 1);
 }
 
 static inline void
@@ -1073,7 +1072,7 @@ desc_label_state (unw_word label, struct
 static inline int
 desc_is_active (unsigned char qp, unw_word t, struct unw_state_record *sr)
 {
-	if (sr->when_target <= sr->region_start + MIN((int)t, sr->region_len - 1))
+	if (sr->when_target <= sr->region_start + min_t(int, t, sr->region_len - 1))
 		return 0;
 	if (qp > 0) {
 		if ((sr->pr_val & (1UL << qp)) == 0)
@@ -1114,7 +1113,7 @@ desc_spill_reg_p (unsigned char qp, unw_
 
 	r = sr->curr.reg + decode_abreg(abreg, 0);
 	r->where = where;
-	r->when = sr->region_start + MIN((int)t, sr->region_len - 1);
+	r->when = sr->region_start + min_t(int, t, sr->region_len - 1);
 	r->val = (ytreg & 0x7f);
 }
 
@@ -1129,7 +1128,7 @@ desc_spill_psprel_p (unsigned char qp, u
 
 	r = sr->curr.reg + decode_abreg(abreg, 1);
 	r->where = UNW_WHERE_PSPREL;
-	r->when = sr->region_start + MIN((int)t, sr->region_len - 1);
+	r->when = sr->region_start + min_t(int, t, sr->region_len - 1);
 	r->val = 0x10 - 4*pspoff;
 }
 
@@ -1144,7 +1143,7 @@ desc_spill_sprel_p (unsigned char qp, un
 
 	r = sr->curr.reg + decode_abreg(abreg, 1);
 	r->where = UNW_WHERE_SPREL;
-	r->when = sr->region_start + MIN((int)t, sr->region_len - 1);
+	r->when = sr->region_start + min_t(int, t, sr->region_len - 1);
 	r->val = 4*spoff;
 }
 

--------------000604020809050102040308
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000604020809050102040308--
