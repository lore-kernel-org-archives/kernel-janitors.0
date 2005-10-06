From: Dinolinux <anton.slack@tele2.no>
Date: Thu, 06 Oct 2005 09:03:02 +0000
Subject: [KJ] [PATCH] arch/i386/kernel/irq.c
Message-Id: <4344E846.4070308@tele2.no>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030507010706030908090606"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--------------030507010706030908090606
Content-Type: multipart/alternative;
    boundary="----------=_1128589407-20063-165"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1128589407-20063-165
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Signed-off-by: Anton Brondz <anton.slack@tele2.no>

*--- linux-2.6.14-rc3.orig/arch/i386/kernel/irq.c	2005-09-30 23:17:35.000000000 +0200*
*+++ linux-2.6.14-rc3/arch/i386/kernel/irq.c	2005-10-05 18:44:49.000000000 +0200*
@@ -29,7 +29,7 @@ EXPORT_PER_CPU_SYMBOL(irq_stat);
  */
 void ack_bad_irq(unsigned int irq)
 {
-	printk("unexpected IRQ trap at vector %02x\n", irq);
+	printk(KERN_ERR "unexpected IRQ trap at vector %02x\n", irq);
 }
 #endif
 
@@ -69,7 +69,7 @@ fastcall unsigned int do_IRQ(struct pt_r
 		__asm__ __volatile__("andl %%esp,%0" :
 					"=r" (esp) : "0" (THREAD_SIZE - 1));
 		if (unlikely(esp < (sizeof(struct thread_info) + STACK_WARN))) {
-			printk("do_IRQ: stack overflow: %ld\n",
+			printk(KERN_ERR "do_IRQ: stack overflow: %ld\n",
 				esp - sizeof(struct thread_info));
 			dump_stack();
 		}
@@ -152,7 +152,7 @@ void irq_ctx_init(int cpu)
 
 	softirq_ctx[cpu] = irqctx;
 
-	printk("CPU %u irqstacks, hard=%p soft=%p\n",
+	printk(KERN_INFO "CPU %u irqstacks, hard=%p soft=%p\n",
 		cpu,hardirq_ctx[cpu],softirq_ctx[cpu]);
 }
 
@@ -279,13 +279,13 @@ void fixup_irqs(cpumask_t map)
 
 		cpus_and(mask, irq_affinity[irq], map);
 		if (any_online_cpu(mask) == NR_CPUS) {
-			printk("Breaking affinity for irq %i\n", irq);
+			printk(KERN_ERR "Breaking affinity for irq %i\n", irq);
 			mask = map;
 		}
 		if (irq_desc[irq].handler->set_affinity)
 			irq_desc[irq].handler->set_affinity(irq, mask);
 		else if (irq_desc[irq].action && !(warned++))
-			printk("Cannot set affinity for irq %i\n", irq);
+			printk(KERN_ERR "Cannot set affinity for irq %i\n", irq);
 	}
 
 #if 0


Hi!
New patch from me ;-) . This time I haven't made as many mistakes as 
last time and I've read the KERN constants in kernel.h I hope this is an 
ok patch. Just in case Thunderbird wraps the text _again_ I'm also 
sending the patch as an attachment. The most significant condition this 
time is KERN_ERR, because there doesn't seem to be critical failures in 
this file.

Dinolinux

------------=_1128589407-20063-165
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Signed-off-by: Anton Brondz <a class="moz-txt-link-rfc2396E" href="mailto:anton.slack@tele2.no">&lt;anton.slack@tele2.no&gt;</a><br>
<br>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Generator" content="Kate, the KDE Advanced Text Editor">
<pre><b>--- linux-2.6.14-rc3.orig/arch/i386/kernel/irq.c	2005-09-30 23:17:35.000000000 +0200</b>
<b>+++ linux-2.6.14-rc3/arch/i386/kernel/irq.c	2005-10-05 18:44:49.000000000 +0200</b>
<span DEFANGED_style="color: rgb(128, 0, 0);">@@ -29,7 +29,7 @@ EXPORT_PER_CPU_SYMBOL(irq_stat);</span>
  */
 void ack_bad_irq(unsigned int irq)
 {
<span DEFANGED_style="color: rgb(0, 128, 0);">-	printk("unexpected IRQ trap at vector %02x\n", irq);</span>
<span DEFANGED_style="color: rgb(221, 0, 0);">+	printk(KERN_ERR "unexpected IRQ trap at vector %02x\n", irq);</span>
 }
 #endif
 
<span DEFANGED_style="color: rgb(128, 0, 0);">@@ -69,7 +69,7 @@ fastcall unsigned int do_IRQ(struct pt_r</span>
 		__asm__ __volatile__("andl %%esp,%0" :
 					"=r" (esp) : "0" (THREAD_SIZE - 1));
 		if (unlikely(esp &lt; (sizeof(struct thread_info) + STACK_WARN))) {
<span DEFANGED_style="color: rgb(0, 128, 0);">-			printk("do_IRQ: stack overflow: %ld\n",</span>
<span DEFANGED_style="color: rgb(221, 0, 0);">+			printk(KERN_ERR "do_IRQ: stack overflow: %ld\n",</span>
 				esp - sizeof(struct thread_info));
 			dump_stack();
 		}
<span DEFANGED_style="color: rgb(128, 0, 0);">@@ -152,7 +152,7 @@ void irq_ctx_init(int cpu)</span>
 
 	softirq_ctx[cpu] = irqctx;
 
<span DEFANGED_style="color: rgb(0, 128, 0);">-	printk("CPU %u irqstacks, hard=%p soft=%p\n",</span>
<span DEFANGED_style="color: rgb(221, 0, 0);">+	printk(KERN_INFO "CPU %u irqstacks, hard=%p soft=%p\n",</span>
 		cpu,hardirq_ctx[cpu],softirq_ctx[cpu]);
 }
 
<span DEFANGED_style="color: rgb(128, 0, 0);">@@ -279,13 +279,13 @@ void fixup_irqs(cpumask_t map)</span>
 
 		cpus_and(mask, irq_affinity[irq], map);
 		if (any_online_cpu(mask) == NR_CPUS) {
<span DEFANGED_style="color: rgb(0, 128, 0);">-			printk("Breaking affinity for irq %i\n", irq);</span>
<span DEFANGED_style="color: rgb(221, 0, 0);">+			printk(KERN_ERR "Breaking affinity for irq %i\n", irq);</span>
 			mask = map;
 		}
 		if (irq_desc[irq].handler-&gt;set_affinity)
 			irq_desc[irq].handler-&gt;set_affinity(irq, mask);
 		else if (irq_desc[irq].action &amp;&amp; !(warned++))
<span DEFANGED_style="color: rgb(0, 128, 0);">-			printk("Cannot set affinity for irq %i\n", irq);</span>
<span DEFANGED_style="color: rgb(221, 0, 0);">+			printk(KERN_ERR "Cannot set affinity for irq %i\n", irq);</span>
 	}
 
 #if 0
</pre>
<br>
Hi!<br>
New patch from me <span class="moz-smiley-s3"><span> ;-) </span></span>.
This time I haven't made as many mistakes as last time and I've read
the KERN constants in kernel.h I hope this is an ok patch. Just in case
Thunderbird wraps the text _again_ I'm also sending the patch as an
attachment. The most significant condition this time is KERN_ERR,
because there doesn't seem to be critical failures in this file.<br>
<br>
Dinolinux<br>
</body>
</html>

------------=_1128589407-20063-165--

--------------030507010706030908090606
Content-Type: text/plain;
 name="irq.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="irq.patch"

--- linux-2.6.14-rc3.orig/arch/i386/kernel/irq.c	2005-09-30 23:17:35.000000000 +0200
+++ linux-2.6.14-rc3/arch/i386/kernel/irq.c	2005-10-05 18:44:49.000000000 +0200
@@ -29,7 +29,7 @@ EXPORT_PER_CPU_SYMBOL(irq_stat);
  */
 void ack_bad_irq(unsigned int irq)
 {
-	printk("unexpected IRQ trap at vector %02x\n", irq);
+	printk(KERN_ERR "unexpected IRQ trap at vector %02x\n", irq);
 }
 #endif
 
@@ -69,7 +69,7 @@ fastcall unsigned int do_IRQ(struct pt_r
 		__asm__ __volatile__("andl %%esp,%0" :
 					"=r" (esp) : "0" (THREAD_SIZE - 1));
 		if (unlikely(esp < (sizeof(struct thread_info) + STACK_WARN))) {
-			printk("do_IRQ: stack overflow: %ld\n",
+			printk(KERN_ERR "do_IRQ: stack overflow: %ld\n",
 				esp - sizeof(struct thread_info));
 			dump_stack();
 		}
@@ -152,7 +152,7 @@ void irq_ctx_init(int cpu)
 
 	softirq_ctx[cpu] = irqctx;
 
-	printk("CPU %u irqstacks, hard=%p soft=%p\n",
+	printk(KERN_INFO "CPU %u irqstacks, hard=%p soft=%p\n",
 		cpu,hardirq_ctx[cpu],softirq_ctx[cpu]);
 }
 
@@ -279,13 +279,13 @@ void fixup_irqs(cpumask_t map)
 
 		cpus_and(mask, irq_affinity[irq], map);
 		if (any_online_cpu(mask) == NR_CPUS) {
-			printk("Breaking affinity for irq %i\n", irq);
+			printk(KERN_ERR "Breaking affinity for irq %i\n", irq);
 			mask = map;
 		}
 		if (irq_desc[irq].handler->set_affinity)
 			irq_desc[irq].handler->set_affinity(irq, mask);
 		else if (irq_desc[irq].action && !(warned++))
-			printk("Cannot set affinity for irq %i\n", irq);
+			printk(KERN_ERR "Cannot set affinity for irq %i\n", irq);
 	}
 
 #if 0

--------------030507010706030908090606
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030507010706030908090606--
