From: Daniel Dickman <didickman@yahoo.com>
Date: Sun, 06 Mar 2005 05:05:09 +0000
Subject: [KJ] [PATCH 2.6.11-bk1] CodingStyle: trivial whitespace fixups
Message-Id: <20050306050509.48416.qmail@web14524.mail.yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-1253108603-1110085509=:48333"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--0-1253108603-1110085509=:48333
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline

When I do a "diff -Nur arch/i386 arch/x86_64" to see what is different between these two
architectures, I see some differences due to whitespace issues only. The attached patch removes
some of the noise by fixing up the following files:
- arch/i386/boot/bootsect.S
- arch/i386/boot/video.S
- arch/x86_64/boot/bootsect.S

Signed-off-by: Daniel Dickman <didickman@yahoo.com>

--0-1253108603-1110085509=:48333
Content-Type: text/x-patch; name="ws-fixup.patch"
Content-Description: ws-fixup.patch
Content-Disposition: inline; filename="ws-fixup.patch"

diff -Nur linux-2.6.11-bk1/arch/i386/boot/bootsect.S linux.new/arch/i386/boot/bootsect.S
--- linux-2.6.11-bk1/arch/i386/boot/bootsect.S	2005-03-02 02:38:09.000000000 -0500
+++ linux.new/arch/i386/boot/bootsect.S	2005-03-05 04:37:00.093148424 -0500
@@ -83,7 +83,7 @@
 	.ascii	"\n"
 	.ascii	"Remove disk and press any key to reboot . . .\r\n"
 	.byte	0
-	
+
 
 	# Kernel attributes; used by setup
 
diff -Nur linux-2.6.11-bk1/arch/i386/boot/video.S linux.new/arch/i386/boot/video.S
--- linux-2.6.11-bk1/arch/i386/boot/video.S	2005-03-02 02:38:37.000000000 -0500
+++ linux.new/arch/i386/boot/video.S	2005-03-05 04:40:26.940702816 -0500
@@ -1924,36 +1924,36 @@
 	ret
 
 store_edid:
-	pushw	%es				# just save all registers 
-	pushw	%ax				
+	pushw	%es				# just save all registers
+	pushw	%ax
 	pushw	%bx
 	pushw   %cx
 	pushw	%dx
 	pushw   %di
 
-	pushw	%fs                             
+	pushw	%fs
 	popw    %es
 
 	movl	$0x13131313, %eax		# memset block with 0x13
 	movw    $32, %cx
 	movw	$0x140, %di
 	cld
-	rep 
-	stosl  
+	rep
+	stosl
 
-	movw	$0x4f15, %ax                    # do VBE/DDC 
+	movw	$0x4f15, %ax                    # do VBE/DDC
 	movw	$0x01, %bx
 	movw	$0x00, %cx
 	movw    $0x01, %dx
 	movw	$0x140, %di
-	int	$0x10	
+	int	$0x10
 
-	popw	%di				# restore all registers        
+	popw	%di				# restore all registers
 	popw	%dx
 	popw	%cx
 	popw	%bx
 	popw	%ax
-	popw	%es	
+	popw	%es
 	ret
 
 # VIDEO_SELECT-only variables
diff -Nur linux-2.6.11-bk1/arch/x86_64/boot/bootsect.S linux.new/arch/x86_64/boot/bootsect.S
--- linux-2.6.11-bk1/arch/x86_64/boot/bootsect.S	2005-03-02 02:38:17.000000000 -0500
+++ linux.new/arch/x86_64/boot/bootsect.S	2005-03-05 04:36:38.023503520 -0500
@@ -63,7 +63,7 @@
 	jz	die
 	movb	$0xe, %ah
 	movw	$7, %bx
- 	int	$0x10
+	int	$0x10
 	jmp	msg_loop
 
 die:
@@ -71,7 +71,7 @@
 	xorw	%ax, %ax
 	int	$0x16
 	int	$0x19
-	
+
 	# int 0x19 should never return.  In case it does anyway,
 	# invoke the BIOS reset code...
 	ljmp	$0xf000,$0xfff0

--0-1253108603-1110085509=:48333
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--0-1253108603-1110085509=:48333--
