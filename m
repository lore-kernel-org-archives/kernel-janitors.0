From: Coywolf Qi Hunt <coywolf@greatcn.org>
Date: Mon, 26 Apr 2004 10:47:32 +0000
Subject: Re: [Kernel-janitors] [PATCH] Remove bootsect_helper and A comment
Message-Id: <408CE8C4.2070103@greatcn.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8183621272578947=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4087C7F2.9050308@greatcn.org>
In-Reply-To: <4087C7F2.9050308@greatcn.org>
To: kernel-janitors@vger.kernel.org

--===============8183621272578947==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

maximilian attems wrote:

>On Fri, 23 Apr 2004, Coywolf Qi Hunt wrote:
>
>[..]
>  
>
>>This is it:
>>========================================================================
>>--- linux-2.6.5/arch/i386/boot/setup.S.orig	Sat Mar  6 23:49:33 2004
>>+++ linux-2.6.5/arch/i386/boot/setup.S	Sun Mar  7 07:23:10 2004
>>    
>>
>
>you didn't read the faq ;)
>
>please try:
>
>cp -a linux-2.6.5 linux-2.6.5-foo
>vi linux-2.6.5-foo/arch/i386/boot/setup.S
>configure + compile + test.
>diff -ruN linux-2.6.5 linux-2.6.5-foo > patch-rm-bootsect_helper
>if it's ok now send it to the ml.
>
I was misled by Documentation/SubmittingPatches.
Patch: remove the bootsect_helper code and a comment fix also.
=====================================================================

diff -ruN linux-2.6.5/arch/i386/boot/setup.S linux/arch/i386/boot/setup.S
--- linux-2.6.5/arch/i386/boot/setup.S	Mon Mar  8 10:31:43 2004
+++ linux/arch/i386/boot/setup.S	Sun Mar  7 07:23:10 2004
@@ -133,7 +133,7 @@
 ramdisk_size:	.long	0		# its size in bytes
 
 bootsect_kludge:
-		.word  bootsect_helper, SETUPSEG
+		.long	0		# obsolete
 
 heap_end_ptr:	.word	modelist+1024	# (Header version 0x0201 or later)
 					# space from here (exclusive) down to
@@ -837,7 +837,7 @@
 	subw	$DELTA_INITSEG, %si
 	shll	$4, %esi			# Convert to 32-bit pointer
 
-# jump to startup_32 in arch/i386/kernel/head.S
+# jump to startup_32 in arch/i386/boot/compressed/head.S
 #	
 # NOTE: For high loaded big kernels we need a
 #	jmpi    0x100000,__BOOT_CS
@@ -871,88 +871,6 @@
 						# sequence
 	outb	%al, $0x70
 	lret
-
-# This routine only gets called, if we get loaded by the simple
-# bootsect loader _and_ have a bzImage to load.
-# Because there is no place left in the 512 bytes of the boot sector,
-# we must emigrate to code space here.
-bootsect_helper:
-	cmpw	$0, %cs:bootsect_es
-	jnz	bootsect_second
-
-	movb	$0x20, %cs:type_of_loader
-	movw	%es, %ax
-	shrw	$4, %ax
-	movb	%ah, %cs:bootsect_src_base+2
-	movw	%es, %ax
-	movw	%ax, %cs:bootsect_es
-	subw	$SYSSEG, %ax
-	lret					# nothing else to do for now
-
-bootsect_second:
-	pushw	%cx
-	pushw	%si
-	pushw	%bx
-	testw	%bx, %bx			# 64K full?
-	jne	bootsect_ex
-
-	movw	$0x8000, %cx			# full 64K, INT15 moves words
-	pushw	%cs
-	popw	%es
-	movw	$bootsect_gdt, %si
-	movw	$0x8700, %ax
-	int	$0x15
-	jc	bootsect_panic			# this, if INT15 fails
-
-	movw	%cs:bootsect_es, %es		# we reset %es to always point
-	incb	%cs:bootsect_dst_base+2		# to 0x10000
-bootsect_ex:
-	movb	%cs:bootsect_dst_base+2, %ah
-	shlb	$4, %ah				# we now have the number of
-						# moved frames in %ax
-	xorb	%al, %al
-	popw	%bx
-	popw	%si
-	popw	%cx
-	lret
-
-bootsect_gdt:
-	.word	0, 0, 0, 0
-	.word	0, 0, 0, 0
-
-bootsect_src:
-	.word	0xffff
-
-bootsect_src_base:
-	.byte	0x00, 0x00, 0x01		# base = 0x010000
-	.byte	0x93				# typbyte
-	.word	0				# limit16,base24 =0
-
-bootsect_dst:
-	.word	0xffff
-
-bootsect_dst_base:
-	.byte	0x00, 0x00, 0x10		# base = 0x100000
-	.byte	0x93				# typbyte
-	.word	0				# limit16,base24 =0
-	.word	0, 0, 0, 0			# BIOS CS
-	.word	0, 0, 0, 0			# BIOS DS
-
-bootsect_es:
-	.word	0
-
-bootsect_panic:
-	pushw	%cs
-	popw	%ds
-	cld
-	leaw	bootsect_panic_mess, %si
-	call	prtstr
-	
-bootsect_panic_loop:
-	jmp	bootsect_panic_loop
-
-bootsect_panic_mess:
-	.string	"INT15 refuses to access high mem, giving up."
 
 
 #ifndef CONFIG_X86_VOYAGER


-- 
Coywolf Qi Hunt
Admin of http://GreatCN.org and http://LoveCN.org


--===============8183621272578947==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8183621272578947==--
