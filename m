From: Domen Puncer <domen@coderock.org>
Date: Tue, 17 May 2005 17:53:57 +0000
Subject: [KJ] [patch] ptroce_h8300: condition bugfix
Message-Id: <20050517175357.GB3851@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2108591996067859=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2108591996067859==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Assignment doesn't make much sense here as condition would always be
true.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/h8300/platform/h8300h/ptrace_h8300h.c	2005-01-22 02:47:32.000000000 +0100
+++ a/arch/h8300/platform/h8300h/ptrace_h8300h.c	2005-05-17 19:49:09.000000000 +0200
@@ -245,12 +245,12 @@ static unsigned short *getnextpc(struct 
 						addr = h8300_get_reg(child, regno-1+PT_ER1);
 					return (unsigned short *)addr;
 				case relb:
-					if ((inst = 0x55) || isbranch(child,inst & 0x0f))
+					if (inst == 0x55 || isbranch(child,inst & 0x0f))
 						pc = (unsigned short *)((unsigned long)pc +
 								       ((signed char)(*fetch_p)));
 					return pc+1; /* skip myself */
 				case relw:
-					if ((inst = 0x5c) || isbranch(child,(*fetch_p & 0xf0) >> 4))
+					if (inst == 0x5c || isbranch(child,(*fetch_p & 0xf0) >> 4))
 						pc = (unsigned short *)((unsigned long)pc +
 								       ((signed short)(*(pc+1))));
 					return pc+2; /* skip myself */

--===============2108591996067859==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2108591996067859==--
