From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 15 Mar 2004 20:56:58 +0000
Subject: [Kernel-janitors] [REDIFF] - style fixes for kernel/cpu.c.
Message-Id: <1079384218.29866.1.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

The little cleanup for kernel/cpu.c.

diff -Nparu linux-2.6.4-bk4/kernel/cpu.c linux-2.6.4-bk4~/kernel/cpu.c
--- linux-2.6.4-bk4/kernel/cpu.c	2004-02-18 15:54:39.000000000 -0300
+++ linux-2.6.4-bk4~/kernel/cpu.c	2004-03-15 16:50:25.000000000 -0300
@@ -32,7 +32,8 @@ int __devinit cpu_up(unsigned int cpu)
 	int ret;
 	void *hcpu = (void *)(long)cpu;
 
-	if ((ret = down_interruptible(&cpucontrol)) != 0)
+	ret = down_interruptible(&cpucontrol);
+	if (ret)
 		return ret;
 
 	if (cpu_online(cpu)) {
@@ -49,8 +50,9 @@ int __devinit cpu_up(unsigned int cpu)
 
 	/* Arch-specific enabling code. */
 	ret = __cpu_up(cpu);
-	if (ret != 0)
+	if (ret)
 		goto out_notify;
+
 	if (!cpu_online(cpu))
 		BUG();
 
@@ -58,7 +60,7 @@ int __devinit cpu_up(unsigned int cpu)
 	notifier_call_chain(&cpu_chain, CPU_ONLINE, hcpu);
 
 out_notify:
-	if (ret != 0)
+	if (ret)
 		notifier_call_chain(&cpu_chain, CPU_UP_CANCELED, hcpu);
 out:
 	up(&cpucontrol);

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
