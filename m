From: Powerflash <contact@powerflash.atspace.org>
Date: Sat, 01 Oct 2005 16:00:35 +0000
Subject: [KJ] [PATCH] printk: arch/i386/kernel/doublefault.c
Message-Id: <433ECD60.1020300@powerflash.atspace.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060207050204050107020209"
List-Id: <kernel-janitors.vger.kernel.org>
References: <433DA691.6080804@users.sourceforge.net>
In-Reply-To: <433DA691.6080804@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060207050204050107020209
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

printk() should include the appropriate KERN_* constant.

Signed off by: Anton Brondz (anton.slack@tele2.no)

*--- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c	2005-09-20 05:00:41.000000000 +0200*
*+++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c	2005-10-01 00:02:07.000000000 +0200*
@@ -23,23 +23,23 @@ static void doublefault_fn(void)
 	store_gdt(&gdt_desc);
 	gdt = gdt_desc.address;
 
-	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
+	printk(KERN_ERR "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
 
 	if (ptr_ok(gdt)) {
 		gdt += GDT_ENTRY_TSS << 3;
 		tss = *(u16 *)(gdt+2);
 		tss += *(u8 *)(gdt+4) << 16;
 		tss += *(u8 *)(gdt+7) << 24;
-		printk("double fault, tss at %08lx\n", tss);
+		printk(KERN_ERR "double fault, tss at %08lx\n", tss);
 
 		if (ptr_ok(tss)) {
 			struct tss_struct *t = (struct tss_struct *)tss;
 
-			printk("eip = %08lx, esp = %08lx\n", t->eip, t->esp);
+			printk(KERN_ERR "eip = %08lx, esp = %08lx\n", t->eip, t->esp);
 
-			printk("eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
+			printk(KERN_ERR "eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
 				t->eax, t->ebx, t->ecx, t->edx);
-			printk("esi = %08lx, edi = %08lx\n",
+			printk(KERN_ERR "esi = %08lx, edi = %08lx\n",
 				t->esi, t->edi);
 		}
 	}


Hope this is working now. I've tried to fix the word wrap. My usual
email address isn't working today, so I'm sending from this one. Just in
case, I'm sending the patch as an attacment too.

--------------060207050204050107020209
Content-Type: text/plain;
 name="doublefault.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="doublefault.patch"

--- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c	2005-09-20 05:00:41.000000000 +0200
+++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c	2005-10-01 00:02:07.000000000 +0200
@@ -23,23 +23,23 @@ static void doublefault_fn(void)
 	store_gdt(&gdt_desc);
 	gdt = gdt_desc.address;
 
-	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
+	printk(KERN_ERR "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
 
 	if (ptr_ok(gdt)) {
 		gdt += GDT_ENTRY_TSS << 3;
 		tss = *(u16 *)(gdt+2);
 		tss += *(u8 *)(gdt+4) << 16;
 		tss += *(u8 *)(gdt+7) << 24;
-		printk("double fault, tss at %08lx\n", tss);
+		printk(KERN_ERR "double fault, tss at %08lx\n", tss);
 
 		if (ptr_ok(tss)) {
 			struct tss_struct *t = (struct tss_struct *)tss;
 
-			printk("eip = %08lx, esp = %08lx\n", t->eip, t->esp);
+			printk(KERN_ERR "eip = %08lx, esp = %08lx\n", t->eip, t->esp);
 
-			printk("eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
+			printk(KERN_ERR "eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
 				t->eax, t->ebx, t->ecx, t->edx);
-			printk("esi = %08lx, edi = %08lx\n",
+			printk(KERN_ERR "esi = %08lx, edi = %08lx\n",
 				t->esi, t->edi);
 		}
 	}

--------------060207050204050107020209
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060207050204050107020209--
