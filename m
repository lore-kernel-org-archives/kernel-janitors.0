From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 15 Mar 2004 19:04:41 +0000
Subject: [Kernel-janitors] [PATCH] - style fixes for kernel/cpu.c.
Message-Id: <1079377456.28138.39.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

I did a little style fix for kernel/cpu.c.

I changed tets in the form:

if (ret != 0) {

...

To

if (ret) {

I think there are no special reason to use the first one. Is there ?

diff -Nparu linux-2.6.4-bk4/kernel/cpu.c linux-2.6.4-bk4~/kernel/cpu.c
--- linux-2.6.4-bk4/kernel/cpu.c	2004-02-18 15:54:39.000000000 -0300
+++ linux-2.6.4-bk4~/kernel/cpu.c	2004-03-15 15:14:31.000000000 -0300
@@ -32,13 +32,16 @@ int __devinit cpu_up(unsigned int cpu)
 	int ret;
 	void *hcpu = (void *)(long)cpu;
 
-	if ((ret = down_interruptible(&cpucontrol)) != 0)
+	ret = down_interruptible(&cpucontrol);
+	if (ret)
 		return ret;
 
-	if (cpu_online(cpu)) {
+	ret = cpu_online(cpu);
+	if (ret) {
 		ret = -EINVAL;
 		goto out;
 	}
+
 	ret = notifier_call_chain(&cpu_chain, CPU_UP_PREPARE, hcpu);
 	if (ret = NOTIFY_BAD) {
 		printk("%s: attempt to bring up CPU %u failed\n",
@@ -49,8 +52,9 @@ int __devinit cpu_up(unsigned int cpu)
 
 	/* Arch-specific enabling code. */
 	ret = __cpu_up(cpu);
-	if (ret != 0)
+	if (ret)
 		goto out_notify;
+
 	if (!cpu_online(cpu))
 		BUG();
 
@@ -58,7 +62,7 @@ int __devinit cpu_up(unsigned int cpu)
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
