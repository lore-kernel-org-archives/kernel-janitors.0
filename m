From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:50:51 +0000
Subject: [KJ] [PATCH 4/] arch/i386/mm/fault.c: fix sparse warnings
Message-Id: <200503100125.54702.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============017545409730788997=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============017545409730788997==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk1-sparse/arch/i386/mm/fault.c
===================================================================
--- linux-2.6.11-bk1-sparse.orig/arch/i386/mm/fault.c	2005-03-02 09:37:30.000000000 +0200
+++ linux-2.6.11-bk1-sparse/arch/i386/mm/fault.c	2005-03-06 16:27:27.000000000 +0200
@@ -146,7 +146,7 @@ static int __is_prefetch(struct pt_regs 
 
 		if (instr > limit)
 			break;
-		if (__get_user(opcode, (unsigned char *) instr))
+		if (__get_user(opcode, (unsigned char __user *) instr))
 			break; 
 
 		instr_hi = opcode & 0xf0; 
@@ -173,7 +173,7 @@ static int __is_prefetch(struct pt_regs 
 			scan_more = 0;
 			if (instr > limit)
 				break;
-			if (__get_user(opcode, (unsigned char *) instr)) 
+			if (__get_user(opcode, (unsigned char __user *) instr)) 
 				break;
 			prefetch = (instr_lo == 0xF) &&
 				(opcode == 0x0D || opcode == 0x18);

--===============017545409730788997==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============017545409730788997==--
