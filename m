From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:57:30 +0000
Subject: [KJ] [PATCH 10/72] arm: add KERN_ constants to
Message-Id: <20060908015730.10114.17321.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-ixp4xx/common.c b/arch/arm/mach-ixp4xx/common.c
index 7c25dbd..691b36a 100644
--- a/arch/arm/mach-ixp4xx/common.c
+++ b/arch/arm/mach-ixp4xx/common.c
@@ -361,7 +361,7 @@ void __init ixp4xx_sys_init(void)
 		}
 	}
 
-	printk("IXP4xx: Using %luMiB expansion bus window size\n",
+	pr_info("IXP4xx: Using %luMiB expansion bus window size\n",
 			ixp4xx_exp_bus_size >> 20);
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
