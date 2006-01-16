From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 16 Jan 2006 21:01:15 +0000
Subject: [KJ] (no subject)
Message-Id: <1137445275.2571.1.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13590206889741574=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4277F774.9070506@tampabay.rr.com>
In-Reply-To: <4277F774.9070506@tampabay.rr.com>
To: kernel-janitors@vger.kernel.org

--===============13590206889741574==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes if() BUG(); to BUG_ON();
in arch/frv/kernel/setup.c

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git11/arch/frv/kernel/setup.c.orig	2006-01-16 21:58:43.000000000 +0100
+++ linux-2.6.15-git11/arch/frv/kernel/setup.c	2006-01-16 21:58:58.000000000 +0100
@@ -814,7 +814,7 @@ void __init setup_arch(char **cmdline_p)
 	 * - by now the stack is part of the init task */
 	printk("Memory %08lx-%08lx\n", memory_start, memory_end);
 
-	if (memory_start == memory_end) BUG();
+	BUG_ON(memory_start == memory_end);
 
 	init_mm.start_code = (unsigned long) &_stext;
 	init_mm.end_code = (unsigned long) &_etext;



--===============13590206889741574==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13590206889741574==--
