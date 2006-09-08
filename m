From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:03:27 +0000
Subject: [KJ] [PATCH 63/72] arm: add KERN_ constants to
Message-Id: <20060908020327.10114.65189.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
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
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
