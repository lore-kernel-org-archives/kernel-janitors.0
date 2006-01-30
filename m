From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 30 Jan 2006 21:15:39 +0000
Subject: [KJ] [Patch 1/6] BUG_ON() Conversion in kernel/cpu.c
Message-Id: <1138655739.4007.10.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96807274475810279=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============96807274475810279==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/kernel/cpu.c.orig	2006-01-27 11:46:04.000000000 +0100
+++ linux-2.6.16-rc1-git4/kernel/cpu.c	2006-01-27 11:48:15.000000000 +0100
@@ -223,8 +221,7 @@ int __devinit cpu_up(unsigned int cpu)
 	ret = __cpu_up(cpu);
 	if (ret != 0)
 		goto out_notify;
-	if (!cpu_online(cpu))
-		BUG();
+	BUG_ON(!cpu_online(cpu));
 
 	/* Now call notifier in preparation. */
 	notifier_call_chain(&cpu_chain, CPU_ONLINE, hcpu);



--===============96807274475810279==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96807274475810279==--
