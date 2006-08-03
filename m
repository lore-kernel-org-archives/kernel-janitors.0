From: tom_hisch@gmx.at
Date: Thu, 03 Aug 2006 11:27:55 +0000
Subject: [KJ] [PATCH] remove redundant check of sbf_port
Message-Id: <11546044752665-git-send-email-tom_hisch@gmx.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Thomas Hisch <t.hisch@gmail.com>

remove the check of sbf_port in write and read function because sbf_port
was already checked in the init function

Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
---
 arch/i386/kernel/bootflag.c |   21 ++++++++-------------
 1 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/i386/kernel/bootflag.c b/arch/i386/kernel/bootflag.c
index 0b98605..982e2c5 100644
--- a/arch/i386/kernel/bootflag.c
+++ b/arch/i386/kernel/bootflag.c
@@ -41,26 +41,21 @@ static int __init parity(u8 v)
 static void __init sbf_write(u8 v)
 {
 	unsigned long flags;
-	if(sbf_port != -1)
-	{
-		v &= ~SBF_PARITY;
-		if(!parity(v))
-			v|=SBF_PARITY;
-
-		printk(KERN_INFO "Simple Boot Flag at 0x0 set to 0x0\n", sbf_port, v);
+	v &= ~SBF_PARITY;
+	if(!parity(v))
+	  v|=SBF_PARITY;
+	
+	printk(KERN_INFO "Simple Boot Flag at 0x0 set to 0x0\n", sbf_port, v);
 
-		spin_lock_irqsave(&rtc_lock, flags);
-		CMOS_WRITE(v, sbf_port);
-		spin_unlock_irqrestore(&rtc_lock, flags);
-	}
+	spin_lock_irqsave(&rtc_lock, flags);
+	CMOS_WRITE(v, sbf_port);
+	spin_unlock_irqrestore(&rtc_lock, flags);
 }
 
 static u8 __init sbf_read(void)
 {
 	u8 v;
 	unsigned long flags;
-	if(sbf_port = -1)
-		return 0;
 	spin_lock_irqsave(&rtc_lock, flags);
 	v = CMOS_READ(sbf_port);
 	spin_unlock_irqrestore(&rtc_lock, flags);
-- 
1.4.2.rc1.gbc9e-dirty



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
