From: maximilian attems <janitor@sternwelten.at>
Date: Thu, 01 Apr 2004 20:49:15 +0000
Subject: [Kernel-janitors] [patch] fix kernel start
Message-Id: <20040401204915.GA2664@sputnik.stro.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


linux-2.6.5-rc2 has a quick count of 33 main() 
function in it's sources, but non of them is
the real Zonked Quokka.

patch compile && boot tested
archs will easily catch up!

a++ maks


--- linux-2.6.5-rc2/init/main.c	2004-03-29 19:21:39.000000000 +0200
+++ linux-2.6.5-rc2-maks/init/main.c	2004-04-01 22:16:45.000000000 +0200
@@ -399,7 +399,7 @@
  *	Activate the first processor.
  */
 
-asmlinkage void __init start_kernel(void)
+asmlinkage void __init main(void)
 {
 	char * command_line;
 	extern char saved_command_line[];
--- linux-2.6.5-rc2/arch/i386/kernel/head.S	2004-03-29 19:21:32.000000000 +0200
+++ linux-2.6.5-rc2-maks/arch/i386/kernel/head.S	2004-04-01 22:22:55.000000000 +0200
@@ -299,7 +299,7 @@
 	jmp L6
 1:
 #endif /* CONFIG_SMP */
-	call start_kernel
+	call main
 L6:
 	jmp L6			# main should never return here, but
 				# just in case, we know what happens.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
