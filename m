From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:03:37 +0000
Subject: [KJ] [PATCH 64/72] arm: add KERN_ constants to
Message-Id: <20060908020337.10114.27311.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
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
