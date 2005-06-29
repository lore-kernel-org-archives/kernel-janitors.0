From: Jesse Millan <jessem@cs.pdx.edu>
Date: Wed, 29 Jun 2005 03:19:10 +0000
Subject: [KJ] [PATCH] [RESEND] Silence GCC4 warning: pointer targets in
Message-Id: <42C2132E.7000102@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070504080407050109000702"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070504080407050109000702
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit




--------------070504080407050109000702
Content-Type: text/x-diff; x-mac-type="0"; x-mac-creator="0";
	name="misc-patch.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="misc-patch.patch"


Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

GCC4 compares signedness of all pointer types. Assigning an unsigned
pointer to a signed pointer (or vise-versa) generates a warning. In this
case an unsigned char pointer was assigned the value of a signed char
pointer. It looks like the author was aware of this so I just let it be.
An explicit cast silences the warnings.
---


diff -puN arch/x86_64/boot/compressed/misc.c~misc-patch arch/x86_64/boot/compressed/misc.c
--- linux-2.6.12-rc6.git10.kj.gcc4/arch/x86_64/boot/compressed/misc.c~misc-patch	2005-06-28 18:49:10.152280992 -0700
+++ linux-2.6.12-rc6.git10.kj.gcc4-root/arch/x86_64/boot/compressed/misc.c	2005-06-28 18:53:11.512588648 -0700
@@ -222,7 +222,7 @@ static int fill_inbuf(void)
 		error("ran out of input data");
 	}
 
-	inbuf = input_data;
+	inbuf = (uch *)input_data;
 	insize = input_len;
 	inptr = 1;
 	return inbuf[0];
@@ -288,7 +288,7 @@ void setup_normal_output_buffer(void)
 #else
 	if ((ALT_MEM_K > EXT_MEM_K ? ALT_MEM_K : EXT_MEM_K) < 1024) error("Less than 2MB of memory");
 #endif
-	output_data = (char *)__PHYSICAL_START; /* Normally Points to 1M */
+	output_data = (uch *)__PHYSICAL_START; /* Normally Points to 1M */
 	free_mem_end_ptr = (long)real_mode;
 }
 
@@ -305,7 +305,7 @@ void setup_output_buffer_if_we_run_high(
 #else
 	if ((ALT_MEM_K > EXT_MEM_K ? ALT_MEM_K : EXT_MEM_K) < (3*1024)) error("Less than 4MB of memory");
 #endif	
-	mv->low_buffer_start = output_data = (char *)LOW_BUFFER_START;
+	mv->low_buffer_start = output_data = (uch *)LOW_BUFFER_START;
 	low_buffer_end = ((unsigned int)real_mode > LOW_BUFFER_MAX
 	  ? LOW_BUFFER_MAX : (unsigned int)real_mode) & ~0xfff;
 	low_buffer_size = low_buffer_end - LOW_BUFFER_START;
_


--------------070504080407050109000702
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070504080407050109000702--
