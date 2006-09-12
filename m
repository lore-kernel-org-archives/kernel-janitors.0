From: James Nelson <james4765@gmail.com>
Date: Tue, 12 Sep 2006 03:21:17 +0000
Subject: [KJ] [PATCH 5/7][RESEND] arm: add KERN_* constants to printk()'s in
Message-Id: <20060912032117.5999.86533.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Diffstat:

 fpa11.c      |    4 ++--
 fpa11_cprt.c |    4 ++--
 softfloat.c  |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

Signed-off-by: James Nelson <james4765@gmail.com>

---
diff --git a/arch/arm/nwfpe/fpa11.c b/arch/arm/nwfpe/fpa11.c
index cc60acd..4fbb4ee 100644
--- a/arch/arm/nwfpe/fpa11.c
+++ b/arch/arm/nwfpe/fpa11.c
@@ -87,7 +87,7 @@ void nwfpe_init_fpa(union fp_state *fp)
 {
 	FPA11 *fpa11 = (FPA11 *)fp;
 #ifdef NWFPE_DEBUG
-	printk("NWFPE: setting up state.\n");
+	pr_info("NWFPE: setting up state.\n");
 #endif
  	memset(fpa11, 0, sizeof(FPA11));
 	resetFPA11();
@@ -100,7 +100,7 @@ unsigned int EmulateAll(unsigned int opc
 	unsigned int code;
 
 #ifdef NWFPE_DEBUG
-	printk("NWFPE: emulating opcode %08x\n", opcode);
+	pr_info("NWFPE: emulating opcode %08x\n", opcode);
 #endif
 	code = opcode & 0x00000f00;
 	if (code = 0x00000100 || code = 0x00000200) {
diff --git a/arch/arm/nwfpe/fpa11_cprt.c b/arch/arm/nwfpe/fpa11_cprt.c
index 9843dc5..8d188ba 100644
--- a/arch/arm/nwfpe/fpa11_cprt.c
+++ b/arch/arm/nwfpe/fpa11_cprt.c
@@ -198,12 +198,12 @@ #ifdef CONFIG_FPE_NWFPE_XP
 	}
 
 	if (CONSTANT_FM(opcode)) {
-		//printk("Fm is a constant: #%d.\n",Fm);
+		//pr_info("Fm is a constant: #%d.\n",Fm);
 		rFm = getExtendedConstant(Fm);
 		if (floatx80_is_nan(rFm))
 			goto unordered;
 	} else {
-		//printk("Fm = r%d which contains a ",Fm);
+		//pr_info("Fm = r%d which contains a ",Fm);
 		switch (fpa11->fType[Fm]) {
 		case typeSingle:
 			//printk("single.\n");
diff --git a/arch/arm/nwfpe/softfloat.c b/arch/arm/nwfpe/softfloat.c
index 0f9656e..147d7b8 100644
--- a/arch/arm/nwfpe/softfloat.c
+++ b/arch/arm/nwfpe/softfloat.c
@@ -416,7 +416,7 @@ static float64 roundAndPackFloat64( stru
                   && ( (sbits64) ( zSig + roundIncrement ) < 0 ) )
            ) {
             //register int lr = __builtin_return_address(0);
-            //printk("roundAndPackFloat64 called from 0x%08x\n",lr);
+            //pr_info("roundAndPackFloat64 called from 0x%08x\n",lr);
             roundData->exception |= float_flag_overflow | float_flag_inexact;
             return packFloat64( zSign, 0x7FF, 0 ) - ( roundIncrement = 0 );
         }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
