From: "Gabriel A. Devenyi" <ace@staticwave.ca>
Date: Tue, 08 Nov 2005 12:38:35 +0000
Subject: [KJ] [RESEND] [PATCH] arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
Message-Id: <43709C4B.5010607@staticwave.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Thanks to LinuxICC (http://linuxicc.sf.net), a comparison of a u32 less than 0 was found, this patch changes the variable to a signed int so that comparison is meaningful.

This patch applies to linus' git tree as of 02.11.2005

Signed-off-by: Gabriel A. Devenyi <ace@staticwave.ca>

--
diff --git a/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c b/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
index 04a4053..039297b 100644
--- a/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
+++ b/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
@@ -177,9 +177,9 @@ static unsigned int nforce2_fsb_read(int
   */
  static int nforce2_set_fsb(unsigned int fsb)
  {
-	u32 pll, temp = 0;
+	u32 temp = 0;
  	unsigned int tfsb;
-	int diff;
+	int diff, pll = 0;

  	if ((fsb > max_fsb) || (fsb < NFORCE2_MIN_FSB)) {
  		printk(KERN_ERR "cpufreq: FSB %d is out of range!\n", fsb);


-- 
Gabriel A. Devenyi
ace@staticwave.ca
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
