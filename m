From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 10 Feb 2006 12:20:53 +0000
Subject: [KJ][Patch] remove second masking instance of variable in reg_divide.c
Message-Id: <1139574054.17620.30.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7060156134955573=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139492214.17930.41.camel@localhost.localdomain>
In-Reply-To: <1139492214.17930.41.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============7060156134955573==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

from http://linuxicc.sourceforge.net/

Remark #1599: Declaration hides variable "variable name"

"int FPU_div(int flags, int rm, int control_w)"

declares "tag" three times.

33:	"int tag, deststnr;"
153:	"int tag;"
161:	"int tag;"

The patch below removes the second two.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc2/arch/i386/math-emu/reg_divide.c.orig	2006-02-10 23:03:16.000000000 +1100
+++ linux-2.6.16-rc2/arch/i386/math-emu/reg_divide.c	2006-02-10 23:13:15.000000000 +1100
@@ -150,7 +150,6 @@ int FPU_div(int flags, int rm, int contr
 
       if ( flags & DEST_RM )
 	{
-	  int tag;
 	  tag = FPU_gettag0();
 	  if ( tag == TAG_Special )
 	    tag = FPU_Special(st0_ptr);
@@ -158,7 +157,6 @@ int FPU_div(int flags, int rm, int contr
 	}
       else
 	{
-	  int tag;
 	  tag = FPU_gettagi(rm);
 	  if ( tag == TAG_Special )
 	    tag = FPU_Special(&st(rm));



--===============7060156134955573==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7060156134955573==--
