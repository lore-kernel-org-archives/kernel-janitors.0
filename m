From: Andrew Morton <akpm@osdl.org>
Date: Sat, 05 Jun 2004 02:21:06 +0000
Subject: make buildcheck output
Message-Id: <20040604192106.6a524ad0.akpm@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Here's an analysis from Keith about the (extensive) amount of bugs which
`make buildcheck' reports.

Most of them should be fairly simple to fix, if someone has the time.

Thanks.



Begin forwarded message:

Date: Tue, 01 Jun 2004 20:34:23 +1000
From: Keith Owens <kaos@ocs.com.au>
To: Andrew Morton <akpm@osdl.org>
Subject: Re: Latest reference_init.pl script 


On Mon, 31 May 2004 23:52:14 -0700, 
Andrew Morton <akpm@osdl.org> wrote:
>
>gad, reference_init generates so much stuff I wonder if it's worth using. 
>Are all these for real?

Apart from altinstructions, yes.  Mainly because people have not been
checking them.

>perl scripts/reference_init.pl
>Finding objects, 1411 objects, ignoring 122 module(s)
>Finding conglomerates, ignoring 137 conglomerate(s)
>Scanning objects
>Error: ./arch/i386/kernel/apic.o .data refers to 0000009c R_386_32          .init.text

arch/i386/kernel/apic.c
void (*wait_timer_tick)(void) = wait_8254_wraparound;
wait_8254_wraparound is __init.  wait_timer_tick should be __initdata,
which flows onto several other functions.

>Error: ./arch/i386/kernel/cpu/mtrr/centaur.o .data refers to 00000008 R_386_32          .init.text

That is real, centaur_mtrr_ops.init = centaur_mcr_init.  Like a lot of
this initialization code, we get away with the dangling reference
because the code is only executed at boot.

>Error: ./arch/i386/kernel/cpu/mtrr/centaur.o .eh_frame refers to 000000dc R_386_32          .init.text

I don't see any .eh_frame references in 2.6.7-rc2 using gcc version
3.3.3 20040412 (Red Hat Linux 3.3.3-7).  Where are they coming from?

>Error: ./arch/i386/kernel/cpu/mtrr/cyrix.o .data refers to 00000028 R_386_32          .init.text

Same as centaur.

>Error: ./arch/i386/kernel/cpu/mtrr/generic.o .text refers to 0000038f R_386_32          .init.data

arch/i386/kernel/cpu/mtrr/generic.c
generic_set_all() uses __intdata smp_changes_mask.

>Error: ./arch/i386/kernel/smpboot.o .altinstructions refers to 00000000 R_386_32          .init.text

altinstructions is a false positive, tweak reference_init.pl

--- reference_init.pl.orig	2004-06-01 20:30:27.000000000 +1000
+++ reference_init.pl	2004-06-01 20:31:01.000000000 +1000
@@ -93,6 +93,7 @@
 		     $from !~ /\.stab$/ &&
 		     $from !~ /\.rodata$/ &&
 		     $from !~ /\.text\.lock$/ &&
+		     $from !~ /\.altinstructions$/ &&
 		     $from !~ /\.debug_/)) {
 			printf("Error: %s %s refers to %s\n", $object, $from, $line);
 		}

The rest of the warnings look real, apart from the strange eh_frame.


-------------------------------------------------------
This SF.Net email is sponsored by the new InstallShield X.
From Windows to Linux, servers to mobile, InstallShield X is the one
installation-authoring solution that does it all. Learn more and
evaluate today! http://www.installshield.com/Dev2Dev/0504
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
