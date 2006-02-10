From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 10 Feb 2006 12:01:18 +0000
Subject: [KJ][Patch] re-send of remove second masking instance of variable
Message-Id: <1139572879.17620.23.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8389110326507343=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8389110326507343==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

This is a re-send of the last patch (that i stuffed up).
Because there are 3 instances in fpu_trig.c of an extra declaration of a
variable.

static void fyl2x(FPU_REG *st0_ptr, u_char st0_tag)

declares "u_char sign;" three times.
once at 1129, once at 1216, and once at 1271.


static void fyl2xp1(FPU_REG *st0_ptr, u_char st0_tag)

declares "u_char sign;" twice
1475: "u_char sign, sign1;"
and
1647: "u_char sign = getsign(st1_ptr);"

This Patch removes all three superfluous instances.




Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com> 

--- linux-2.6.16-rc2/arch/i386/math-emu/fpu_trig.c.orig	2006-02-10 21:33:37.000000000 +1100
+++ linux-2.6.16-rc2/arch/i386/math-emu/fpu_trig.c	2006-02-10 22:30:45.000000000 +1100
@@ -1213,7 +1213,6 @@ static void fyl2x(FPU_REG *st0_ptr, u_ch
 	    }
 	  else
 	    {
-	      u_char sign;
 	      sign = getsign(st1_ptr)^SIGN_NEG;
 	      if ( FPU_divide_by_zero(1, sign) < 0 )
 		return;
@@ -1268,7 +1267,7 @@ static void fyl2x(FPU_REG *st0_ptr, u_ch
 	}
       else
 	{
-	  u_char sign = getsign(st1_ptr);
+	  sign = getsign(st1_ptr);
 
 	  if ( (st1_tag == TW_Denormal) && (denormal_operand() < 0) )
 	    return;
@@ -1644,7 +1643,7 @@ static void fyl2xp1(FPU_REG *st0_ptr, u_
 	 80486 sensibly says that it is o.k. */
       else
 	{
-	  u_char sign = getsign(st1_ptr);
+	  sign = getsign(st1_ptr);
 	  FPU_copy_to_reg1(&CONST_INF, TAG_Special);
 	  setsign(st1_ptr, sign);
 	}



--===============8389110326507343==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8389110326507343==--
