From: Daniel Dickman <didickman@yahoo.com>
Date: Tue, 22 Mar 2005 00:42:45 +0000
Subject: [KJ] [PATCH 2.6.12-rc1-bk1 1/1] trivial fixes for arch/{i386,
Message-Id: <423F6A05.7030102@yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch removes unnecessary differences between arch/i386 and arch/x86_64. Applying this reduces some of the noise when I run "diff -Nur i386 
x86_64" by:
- updating an old URL,
- correcting a few spelling mistakes in the comments,
- fixing up some whitespace issues

This shortens the diff -u output by 105 lines.

Files modified:
- arch/i386/boot/bootsect.S
- arch/i386/boot/edd.S
- arch/i386/boot/setup.S
- arch/i386/boot/video.S
- arch/x86_64/boot/bootsect.S
- arch/x86_64/boot/compressed/head.S
- arch/x86_64/boot/setup.S

Signed-off-by: Daniel Dickman <didickman@yahoo.com>

diff -Nur linux-2.6.12-rc1-bk1/arch/i386/boot/bootsect.S linux/arch/i386/boot/bootsect.S
--- linux-2.6.12-rc1-bk1/arch/i386/boot/bootsect.S	2005-03-02 02:38:09.000000000 -0500
+++ linux/arch/i386/boot/bootsect.S	2005-03-21 02:18:53.250000000 -0500
@@ -83,7 +83,7 @@
  	.ascii	"\n"
  	.ascii	"Remove disk and press any key to reboot . . .\r\n"
  	.byte	0
-	
+

  	# Kernel attributes; used by setup

diff -Nur linux-2.6.12-rc1-bk1/arch/i386/boot/edd.S linux/arch/i386/boot/edd.S
--- linux-2.6.12-rc1-bk1/arch/i386/boot/edd.S	2005-03-02 02:37:48.000000000 -0500
+++ linux/arch/i386/boot/edd.S	2005-03-21 02:15:38.000000000 -0500
@@ -6,7 +6,7 @@
   *   projects 1572D, 1484D, 1386D, 1226DT
   * disk signature read by Matt Domsch <Matt_Domsch@dell.com>
   *	and Andrew Wilks <Andrew_Wilks@dell.com> September 2003, June 2004
- * legacy CHS retreival by Patrick J. LoPresti <patl@users.sourceforge.net>
+ * legacy CHS retrieval by Patrick J. LoPresti <patl@users.sourceforge.net>
   *      March 2004
   * Command line option parsing, Matt Domsch, November 2004
   */
diff -Nur linux-2.6.12-rc1-bk1/arch/i386/boot/setup.S linux/arch/i386/boot/setup.S
--- linux-2.6.12-rc1-bk1/arch/i386/boot/setup.S	2005-03-02 02:38:10.000000000 -0500
+++ linux/arch/i386/boot/setup.S	2005-03-21 02:32:39.562500000 -0500
@@ -33,7 +33,7 @@
   * Transcribed from Intel (as86) -> AT&T (gas) by Chris Noe, May 1999.
   * <stiker@northlink.com>
   *
- * Fix to work around buggy BIOSes which dont use carry bit correctly
+ * Fix to work around buggy BIOSes which don't use carry bit correctly
   * and/or report extended memory in CX/DX for e801h memory size detection
   * call.  As a result the kernel got wrong figures.  The int15/e801h docs
   * from Ralf Brown interrupt list seem to indicate AX/BX should be used
@@ -53,7 +53,7 @@
  #include <asm/boot.h>
  #include <asm/e820.h>
  #include <asm/page.h>
-	
+
  /* Signature words to ensure LILO loaded us right */
  #define SIG1	0xAA55
  #define SIG2	0x5A5A
@@ -208,7 +208,8 @@
  prtspc:	movb	$0x20, %al	# Print single space (note: fall-thru)

  # Part of above routine, this one just prints ascii al
-prtchr:	pushw	%ax
+prtchr:
+	pushw	%ax
  	pushw	%cx
  	movw	$7,%bx
  	movw	$0x01, %cx
@@ -357,7 +358,7 @@

  meme801:
  	stc					# fix to work around buggy
-	xorw	%cx,%cx				# BIOSes which dont clear/set
+	xorw	%cx,%cx				# BIOSes which don't clear/set
  	xorw	%dx,%dx				# carry on pass/error of
  						# e801h memory size call
  						# or merely pass cx,dx though
diff -Nur linux-2.6.12-rc1-bk1/arch/i386/boot/video.S linux/arch/i386/boot/video.S
--- linux-2.6.12-rc1-bk1/arch/i386/boot/video.S	2005-03-02 02:38:37.000000000 -0500
+++ linux/arch/i386/boot/video.S	2005-03-21 02:23:09.968750000 -0500
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
diff -Nur linux-2.6.12-rc1-bk1/arch/x86_64/boot/bootsect.S linux/arch/x86_64/boot/bootsect.S
--- linux-2.6.12-rc1-bk1/arch/x86_64/boot/bootsect.S	2005-03-02 02:38:17.000000000 -0500
+++ linux/arch/x86_64/boot/bootsect.S	2005-03-21 02:18:25.296875000 -0500
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
diff -Nur linux-2.6.12-rc1-bk1/arch/x86_64/boot/compressed/head.S linux/arch/x86_64/boot/compressed/head.S
--- linux-2.6.12-rc1-bk1/arch/x86_64/boot/compressed/head.S	2005-03-02 02:38:32.000000000 -0500
+++ linux/arch/x86_64/boot/compressed/head.S	2005-03-21 02:30:11.734375000 -0500
@@ -21,7 +21,7 @@
   */

  /*
- * High loaded stuff by Hans Lermen & Werner Almesberger, Feb. 1996	
+ * High loaded stuff by Hans Lermen & Werner Almesberger, Feb. 1996
   */
  .code32
  .text
diff -Nur linux-2.6.12-rc1-bk1/arch/x86_64/boot/setup.S linux/arch/x86_64/boot/setup.S
--- linux-2.6.12-rc1-bk1/arch/x86_64/boot/setup.S	2005-03-02 02:38:32.000000000 -0500
+++ linux/arch/x86_64/boot/setup.S	2005-03-21 02:32:50.406250000 -0500
@@ -33,7 +33,7 @@
   * Transcribed from Intel (as86) -> AT&T (gas) by Chris Noe, May 1999.
   * <stiker@northlink.com>
   *
- * Fix to work around buggy BIOSes which dont use carry bit correctly
+ * Fix to work around buggy BIOSes which don't use carry bit correctly
   * and/or report extended memory in CX/DX for e801h memory size detection
   * call.  As a result the kernel got wrong figures.  The int15/e801h docs
   * from Ralf Brown interrupt list seem to indicate AX/BX should be used
@@ -203,7 +203,7 @@
  prtsp2:	call	prtspc		# Print double space
  prtspc:	movb	$0x20, %al	# Print single space (note: fall-thru)

-prtchr:	
+prtchr:
  	pushw	%ax
  	pushw	%cx
  	movw	$0007,%bx
@@ -383,7 +383,7 @@
  # a whole bunch of different types, and allows memory holes and
  # everything.  We scan through this memory map and build a list
  # of the first 32 memory areas, which we return at [E820MAP].
-# This is documented at http://www.teleport.com/~acpi/acpihtml/topic245.htm
+# This is documented at http://www.acpi.info/, in the ACPI 2.0 specification.

  #define SMAP  0x534d4150

@@ -436,7 +436,7 @@

  meme801:
  	stc					# fix to work around buggy
-	xorw	%cx,%cx				# BIOSes which dont clear/set
+	xorw	%cx,%cx				# BIOSes which don't clear/set
  	xorw	%dx,%dx				# carry on pass/error of
  						# e801h memory size call
  						# or merely pass cx,dx though
@@ -733,7 +733,7 @@
  #
  #	but we yet haven't reloaded the CS register, so the default size
  #	of the target offset still is 16 bit.
-#       However, using an operant prefix (0x66), the CPU will properly
+#       However, using an operand prefix (0x66), the CPU will properly
  #	take our 48 bit far pointer. (INTeL 80386 Programmer's Reference
  #	Manual, Mixing 16-bit and 32-bit code, page 16-6)



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
