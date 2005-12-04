From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:12:25 +0000
Subject: [KJ] [PATCH 1/21] polling loops: change exit condition to
Message-Id: <43923469.3090808@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hello everyone
here is the first part of patch which changes many polling loops to use
jiffies and time_after / time_before instead of counters
most of the changes are in drivers directory (except first patch)
as it is my first patch for linux kernel, feel free to point out any
mistake you'll find

(this task is the last entry of kernel-janitors todo: http://janitor.kernelnewbies.org/TODO)

LINUX FOR POWER MACINTOSH
P:	Benjamin Herrenschmidt
M:	benh@kernel.crashing.org

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/arch/ppc/platforms/pmac_smp.c linux-2.6.15-rc4/arch/ppc/platforms/pmac_smp.c
--- linux-2.6.15-rc4-orig/arch/ppc/platforms/pmac_smp.c	2005-12-03 15:22:31.000000000 +0100
+++ linux-2.6.15-rc4/arch/ppc/platforms/pmac_smp.c	2005-12-03 16:51:58.000000000 +0100
@@ -675,11 +675,10 @@ void cpu_die(void)
 
 void __cpu_die(unsigned int cpu)
 {
-	int timeout;
+	unsigned long end_time = jiffies + msecs_to_jiffies(1000);
 
-	timeout = 1000;
 	while (!cpu_dead[cpu]) {
-		if (--timeout = 0) {
+		if (time_after(jiffies, end_time)) {
 			printk("CPU %u refused to die!\n", cpu);
 			break;
 		}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
