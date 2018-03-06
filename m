From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Mar 2018 10:06:19 +0000
Subject: [PATCH] parisc: silence uninitialized variable warning in dbl_to_sgl_fcnvff()
Message-Id: <20180306100619.GD10474@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch warns that is_tiny can be used uninitialized:

    arch/parisc/math-emu/fcnvff.c:297 dbl_to_sgl_fcnvff()
    error: uninitialized symbol 'is_tiny'.

This code is very old so that suggests the bug doesn't have a huge
affect in real life.  But I've read the code and it seems like a
reasonable warning.  Either way it should be harmless to initialize it
to false and silence the static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/parisc/math-emu/fcnvff.c b/arch/parisc/math-emu/fcnvff.c
index 76c063f7d17c..f9357d9d4cb1 100644
--- a/arch/parisc/math-emu/fcnvff.c
+++ b/arch/parisc/math-emu/fcnvff.c
@@ -148,7 +148,7 @@ dbl_to_sgl_fcnvff(
         register int src_exponent, dest_exponent, dest_mantissa;
         register boolean inexact = FALSE, guardbit = FALSE, stickybit = FALSE;
 	register boolean lsb_odd = FALSE;
-	boolean is_tiny;
+	boolean is_tiny = FALSE;
 
 	Dbl_copyfromptr(srcptr,srcp1,srcp2);
         src_exponent = Dbl_exponent(srcp1);
