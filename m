From: slackfan@users.sourceforge.net
Date: Mon, 03 Oct 2005 15:07:28 +0000
Subject: [KJ] [PATCH] arch/i386/kernel/doublefault.c
Message-Id: <200510031654.41701.slackfan@users.sourceforge.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88485480922581772=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051003110453.GA10630@rhum.iomeda.fr>
In-Reply-To: <20051003110453.GA10630@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============88485480922581772==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

signed-off-by: Anton Brondz <anton.slack@tele2.no>

--- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c	2005-09-20 03:00:41.000000000 +0000
+++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c	2005-10-03 14:37:44.000000000 +0000
@@ -23,23 +23,23 @@ static void doublefault_fn(void)
 	store_gdt(&gdt_desc);
 	gdt = gdt_desc.address;
 
-	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
+	printk(KERN_ALERT "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
 
 	if (ptr_ok(gdt)) {
 		gdt += GDT_ENTRY_TSS << 3;
 		tss = *(u16 *)(gdt+2);
 		tss += *(u8 *)(gdt+4) << 16;
 		tss += *(u8 *)(gdt+7) << 24;
-		printk("double fault, tss at %08lx\n", tss);
+		printk(KERN_CRIT "double fault, tss at %08lx\n", tss);
 
 		if (ptr_ok(tss)) {
 			struct tss_struct *t = (struct tss_struct *)tss;
 
-			printk("eip = %08lx, esp = %08lx\n", t->eip, t->esp);
+			printk(KERN_CRIT "eip = %08lx, esp = %08lx\n", t->eip, t->esp);
 
-			printk("eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
+			printk(KERN_CRIT "eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
 				t->eax, t->ebx, t->ecx, t->edx);
-			printk("esi = %08lx, edi = %08lx\n",
+			printk(KERN_CRIT "esi = %08lx, edi = %08lx\n",
 				t->esi, t->edi);
 		}
 	}

--===============88485480922581772==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88485480922581772==--
