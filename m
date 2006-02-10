From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 10 Feb 2006 10:55:24 +0000
Subject: [KJ][Patch] remove second masking instance of variable in fpu_trig.c
Message-Id: <1139568926.17620.6.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93981325129244353=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139492214.17930.41.camel@localhost.localdomain>
In-Reply-To: <1139492214.17930.41.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============93981325129244353==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

from http://linuxicc.sourceforge.net/

Remark #1599: Declaration hides variable "variable name"

static void fyl2x(FPU_REG *st0_ptr, u_char st0_tag)

declares "u_char sign;" twice.
once at 1129, and once at 1216.

The patch below just removes the second declaration.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc2/arch/i386/math-emu/fpu_trig.c.orig	2006-02-10 21:33:37.000000000 +1100
+++ linux-2.6.16-rc2/arch/i386/math-emu/fpu_trig.c	2006-02-10 21:43:29.000000000 +1100
@@ -1213,7 +1213,6 @@ static void fyl2x(FPU_REG *st0_ptr, u_ch
 	    }
 	  else
 	    {
-	      u_char sign;
 	      sign = getsign(st1_ptr)^SIGN_NEG;
 	      if ( FPU_divide_by_zero(1, sign) < 0 )
 		return;
 


--===============93981325129244353==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93981325129244353==--
