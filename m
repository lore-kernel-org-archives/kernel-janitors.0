From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:51:07 +0000
Subject: [KJ] [PATCH 2/] arch/i386/kernel/traps.c: fix sparse warnings
Message-Id: <200503100123.39032.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63282665631170643=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63282665631170643==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk1-sparse/arch/i386/kernel/traps.c
===================================================================
--- linux-2.6.11-bk1-sparse.orig/arch/i386/kernel/traps.c	2005-03-02 09:37:49.000000000 +0200
+++ linux-2.6.11-bk1-sparse/arch/i386/kernel/traps.c	2005-03-06 03:28:50.000000000 +0200
@@ -233,22 +233,22 @@ void show_registers(struct pt_regs *regs
 	 * time of the fault..
 	 */
 	if (in_kernel) {
-		u8 *eip;
+		u8 __user *eip;
 
 		printk("\nStack: ");
 		show_stack(NULL, (unsigned long*)esp);
 
 		printk("Code: ");
 
-		eip = (u8 *)regs->eip - 43;
+		eip = (u8 __user *)regs->eip - 43;
 		for (i = 0; i < 64; i++, eip++) {
 			unsigned char c;
 
-			if (eip < (u8 *)PAGE_OFFSET || __get_user(c, eip)) {
+			if (eip < (u8 __user *)PAGE_OFFSET || __get_user(c, eip)) {
 				printk(" Bad EIP value.");
 				break;
 			}
-			if (eip == (u8 *)regs->eip)
+			if (eip == (u8 __user *)regs->eip)
 				printk("<%02x> ", c);
 			else
 				printk("%02x ", c);
@@ -272,13 +272,13 @@ static void handle_BUG(struct pt_regs *r
 
 	if (eip < PAGE_OFFSET)
 		goto no_bug;
-	if (__get_user(ud2, (unsigned short *)eip))
+	if (__get_user(ud2, (unsigned short __user *)eip))
 		goto no_bug;
 	if (ud2 != 0x0b0f)
 		goto no_bug;
-	if (__get_user(line, (unsigned short *)(eip + 2)))
+	if (__get_user(line, (unsigned short __user *)(eip + 2)))
 		goto bug;
-	if (__get_user(file, (char **)(eip + 4)) ||
+	if (__get_user(file, (char * __user *)(eip + 4)) ||
 		(unsigned long)file < PAGE_OFFSET || __get_user(c, file))
 		file = "<bad filename>";
 

--===============63282665631170643==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63282665631170643==--
