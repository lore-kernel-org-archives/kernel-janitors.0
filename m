From: Jesse Millan <jessem@cs.pdx.edu>
Date: Thu, 23 Jun 2005 21:54:59 +0000
Subject: [KJ] [PATCH] Silence GCC4 warning: pointer targets in assignment
Message-Id: <42BB2FB3.3070704@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080901020801020109080106"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080901020801020109080106
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


GCC4 compares signedness of all pointer types. Assigning an unsigned
pointer to a signed pointer (or vise-versa) generates a warning. In this
case an unsigned char pointer was assigned the value of a signed char
pointer. It looks like the author was aware of this so I just let it be.
An explicit cast silences the warnings.

BTW, "typedef unsigned char uch" was declared at the top of the file.

misc.c:221: warning: pointer targets in assignment differ in signedness
misc.c:287: warning: pointer targets in assignment differ in signedness
misc.c:304: warning: pointer targets in assignment differ in signedness

--------------080901020801020109080106
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc6.kj/arch/x86_64/boot/compressed/misc.c~	2005-06-23 12:32:31.266543448 -0700
+++ linux-2.6.12-rc6.kj/arch/x86_64/boot/compressed/misc.c	2005-06-23 13:43:33.809033744 -0700
@@ -218,7 +218,7 @@ static int fill_inbuf(void)
 		error("ran out of input data");
 	}

-	inbuf = input_data;
+	inbuf = (uch *)input_data;
 	insize = input_len;
 	inptr = 1;
 	return inbuf[0];
@@ -284,7 +284,7 @@ void setup_normal_output_buffer(void)
 #else
 	if ((ALT_MEM_K > EXT_MEM_K ? ALT_MEM_K : EXT_MEM_K) < 1024) error("Less than 2MB of memory");
 #endif
-	output_data = (char *)0x100000; /* Points to 1M */
+	output_data = (uch *)0x100000; /* Points to 1M */
 	free_mem_end_ptr = (long)real_mode;
 }

@@ -301,7 +301,7 @@ void setup_output_buffer_if_we_run_high(
 #else
 	if ((ALT_MEM_K > EXT_MEM_K ? ALT_MEM_K : EXT_MEM_K) < (3*1024)) error("Less than 4MB of memory");
 #endif
-	mv->low_buffer_start = output_data = (char *)LOW_BUFFER_START;
+	mv->low_buffer_start = output_data = (uch *)LOW_BUFFER_START;
 	low_buffer_end = ((unsigned int)real_mode > LOW_BUFFER_MAX
 	  ? LOW_BUFFER_MAX : (unsigned int)real_mode) & ~0xfff;
 	low_buffer_size = low_buffer_end - LOW_BUFFER_START;

--------------080901020801020109080106
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080901020801020109080106--
