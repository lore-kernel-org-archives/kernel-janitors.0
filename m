From: Domen Puncer <domen@coderock.org>
Date: Mon, 17 Jan 2005 23:11:23 +0000
Subject: [KJ] [RFC] TODO file cleanups
Message-Id: <20050117231123.GC19162@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============271381745221976=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============271381745221976==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Removed some finished, invalid, duplicate entries.
Replaced inline explanation with summary and URL to original post.
Comments, objections to any change?

Second stage, that i'm doing now is to put stuff into sections (like it
is at the beginning of file).
I'm also thinking about ordering from easiest to hardest.
Ideas, comments?



 TODO-1.26 |  320 +++-----------------------------------------------------------
 1 files changed, 18 insertions(+), 302 deletions(-)

--- TODO-1.25	2005-01-17 21:18:24.000000000 +0100
+++ TODO-1.26	2005-01-17 23:45:15.000000000 +0100
@@ -44,7 +44,6 @@
 Remove unneeded historic code / New API conversions.
 - checking for NULL on probe routines for net drivers
 - convert drivers to new PCI API
-- get rid of save_flags_cli, use local_irq_save instead
 - get rid of check_region, use just request_region checking its return (2.2
   request_region returned void) and now the driver init sequence is not to be
   serialized anymore, so races are possible (look at cardbus/pcihotplug code)
@@ -57,8 +56,6 @@
   Many of these fixed already at:
   http://www.lib.uaa.alaska.edu/linux-kernel/archive/2001-Week-11/0150.html
   FIXME: Dead URL!
-- Net drivers should call SET_MODULE_OWNER instead of MOD_{INC,DEC}_USE_COUNT
-- There are still kernel threads which don't use up_and_exit() for dying.
 - Purely cosmetic, but far nicer to read..
   - for (list = ymf_devs.next; list != &ymf_devs; list = list->next) {
   + list_for_each(list, &ymf_devs) {
@@ -66,12 +63,6 @@
   instead of reading directly.
   -   dev->driver_data = pcigame;
   +   pci_set_drvdata(dev, pcigame);
-- Take end_request() definition out of blk.h and move it into the drivers that need it.
-  IOW, ones that contain calls of end_request() and don't have LOCAL_END_REQUEST defined.
-  once that's done, kill LOCAL_END_REQUEST... (suggested by Al Viro) 
-
-SUSPECTS:
-- de4x5.c doesn't pci_enable_device()
 
 -----------------------------------------------------------------------------
 Copying to/from userspace issues.
@@ -84,10 +75,7 @@
 - use "return copy_*_user(...) ? -EFAULT : ok_value;"
 
 SUSPECTS:
-- look at drivers/char/generic_serial.c
 - look at drivers/char/n_tty.c
-- check drivers/char/dz.c wrt return copy*user(...);
-  has to be ... ? -EFAULT : 0;
 
 -----------------------------------------------------------------------------
 - get rid of isa_read/write[bwl], use ioremap instead
@@ -166,81 +154,12 @@
 -----------------------------------------------------------------------------
 From: David Woodhouse <dwmw2 at infradead dot org>
 
-- Anything which uses sleep_on() has a 90% chance of being broken. Fix
+- Anything which uses sleep_on*() has a 90% chance of being broken. Fix
   them all, because we want to remove sleep_on() and friends in 2.5.
 
-Explanation by Andi Kleen <ak at suse dot de>
 lkml thread at:
 http://boudicca.tux.org/hypermail/linux-kernel/2001week05/0305.html
-
-> don't even know WHY it's bad.  Not only that, but what am I supposed to use
-> instead? 
-
-You can miss wakeups. The standard pattern is:
-
-	get locks
-
-	add_wait_queue(&waitqueue, &wait);
-	for (;;) { 
-		if (condition you're waiting for is true) 
-			break; 
-		unlock any non sleeping locks you need for condition
-		__set_task_state(current, TASK_UNINTERRUPTIBLE); 
-		schedule(); 
-		__set_task_state(current, TASK_RUNNING); 
-		reaquire locks
-	}
-	remove_wait_queue(&waitqueue, &wait); 
-
-When you want to handle signals you can check for them before or after the
-condition check. Also use TASK_INTERRUPTIBLE in this case.
-
-When you need a timeout use schedule_timeout().
-
-For some cases you can also use the wait_event_* macros which encapsulate
-that for you, assuming condition can be tested/used lockless. 
-
-An alternative is to use a semaphore, although that behaves a bit differently
-under load.
-
-From: David Woodhouse <dwmw2 at infradead dot org>
-
-> Ok, so how should this code have been written?
-
-DECLARE_WAIT_QUEUE(wait, current);
-
-while(1) {
-	do_something_important()
-
-	set_current_state(TASK_INTERRUPTIBLE);
-	add_wait_queue(&q, &wait);
-
-	/* Now if something arrives, we'll be 'woken' immediately -
-	   - that is; our state will be set to TASK_RUNNING */
-
-	if (!stuff_to_do()) {
-		/* If the 'stuff' arrives here, we get woken anyway,
-			so the schedule() returns immediately. You 
-			can use schedule_timeout() here if you need
-			a timeout, obviously */
-		schedule();
-	}
-
-	set_current_state(TASK_RUNNING);
-	remove_wait_queue(&q, &wait);
-
-	if (signal_pending(current)) {
-		/* You've been signalled. Deal with it. If you don't 
-			want signals to wake you, use TASK_UNINTERRUPTIBLE
-			above instead of TASK_INTERRUPTIBLE. Be aware
-			that you'll add one to the load average all the
-			time your task is sleeping then. */
-		return -EINTR;
-	}
-}	
-
-Alternatively, you could up() a semaphore for each task that's do be done, 
-and down() it again each time you remove one from the queue. 
+Be sure to read replies too.
 
 -----------------------------------------------------------------------------
 From: Andrew Morton <andrewm at uow dot edu dot au>
@@ -431,7 +350,7 @@
 interfaces:
 
 - call SET_MODULE_OWNER or use .owner = THIS_MODULE instead of using
-  MOD_{INC,DEC}_USE_COUNT
+  MOD_{INC,DEC}_USE_COUNT (only a few remain)
 
 - convert cli/sti/save_flags/save_flags_cli/restore_flags usage to
   accepted locking primitives;
@@ -439,16 +358,6 @@
   for details, belows patch is an example:
   http://linux.bkbits.net:8080/linux-2.6/cset@419b78fcaLKtZt39OF_dslTbk-b3KQ?nav=index.html|ChangeSet@-8w
 
-- These drivers need DMA usage attention:
-./drivers/net/defxx.c:#error Please convert me to Documentation/DMA-mapping.txt
-./drivers/net/rcpci45.c:#error Please convert me to Documentation/DMA-mapping.txt
-./drivers/scsi/scsiiom.c:#error Please convert me to Documentation/DMA-mapping.txt
-./drivers/scsi/ini9100u.c:#error Please convert me to Documentation/DMA-mapping.txt
-./drivers/scsi/AM53C974.c:#error Please convert me to Documentation/DMA-mapping.txt
-./drivers/scsi/gdth.c:#error Please convert me to Documentation/DMA-mapping.txt
-./drivers/scsi/dpt_i2o.c:#error Please convert me to Documentation/DMA-mapping.txt
-./drivers/scsi/pci2220i.c:#error Convert me to understand page+offset based scatterlists
-
 ------------------------------------------------------------------------
 From Linus:
 
@@ -458,10 +367,6 @@
 http://kernelnewbies.org/scripts/ .
 
 ------------------------------------------------------------------------
-Fix source code formatting, especially in unmaintained source files.
-For example, arch/i386/math-emu/fpu_entry.c .
-
-------------------------------------------------------------------------
 For source files that don't have any license information in them,
 determine if they should be GPL or GPL/BSD etc. and add license information
 to them.
@@ -476,90 +381,22 @@
 may be false alarms, not all are bugs.
 
 ------------------------------------------------------------------------
-From Domen Puncer:
 - pr_debug() from kernel.h could replace a lot of DPRINTK and similar macros.
 - same for pr_info()
-
-------------------------------------------------------------------------
-From Domen Puncer:
 - min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.
-
-------------------------------------------------------------------------
-From Domen Puncer:
 - remove string concatenation with __FUNCTION__ (get rid of
-warnings, and get ready for __func__):
--printk(KERN_INFO "blabla " __FUNCTION__ "\n");
-+printk(KERN_INFO "blabla %s\n", __FUNCTION__);
-
-However, do not convert _FUNCTION_ to _func_ because older
-gcc versions do not support _func_.
+  warnings, and get ready for __func__):
+  -printk(KERN_INFO "blabla " __FUNCTION__ "\n");
+  +printk(KERN_INFO "blabla %s\n", __FUNCTION__);
 
 ------------------------------------------------------------------------
 From: Matthew Wilcox
 Subject: Calling yield() Considered Harmful
 
-In 2.6, the semantics of calling yield() changed from "sleep for a
-bit" to "I really don't want to run for a while".  This matches POSIX
-better, but there's a lot of drivers still using yield() when they mean
-cond_resched(), schedule() or even schedule_timeout().
-
-Here's a list:
-
-$ find drivers/ -type f |xargs grep 'yield[^a-z]*('
-drivers/cdrom/cdu31a.c:         yield();
-drivers/cdrom/sonycd535.c:              yield();
-drivers/macintosh/adb.c:                        yield();
-drivers/message/i2o/i2o_core.c:         yield();
-drivers/message/i2o/i2o_core.c:         yield();
-drivers/mtd/chips/cfi_cmdset_0002.c:                    yield();
-drivers/mtd/nand/nand.c:                yield ();
-drivers/net/depca.c:                    yield();
-drivers/net/sb1000.c:           yield();
-drivers/net/sb1000.c:           yield();
-drivers/net/sis900.c:                   yield();
-drivers/net/sungem.c:           yield();
-drivers/scsi/NCR5380.c:                 yield();
-drivers/scsi/ibmmca.c:          yield();
-drivers/scsi/megaraid.c:                udelay(100); yield();
-drivers/usb/core/message.c:                     yield ();
-
-As always, this isn't a search-and-replace type of job.  Let's take
-the first one as an example:
-
-static inline void sony_sleep(void)
-{
-        unsigned long flags;
-
-        if (cdu31a_irq <= 0) {
-                yield();
-        } else {                /* Interrupt driven */
-                save_flags(flags);
-                cli();
-                enable_interrupts();
-                interruptible_sleep_on(&cdu31a_irq_wait);
-                restore_flags(flags);
-        }
-}
-
-If you look at how sony_sleep() is typically used, what you really want to
-do is schedule_timeout(1).  But someone needs to look at all these cases..
-do I hear a volunteer?
-
-Addendum:  Typically just before calling schedule_timeout(),
-a function needs to do something like:
-	set_current_state(TASK_INTERRUPTIBLE);
-
-based on kernel/timer.c::schedule_timeout(), which says:
-The routine [schedule_timeout] will return immediately unless
-the current task state has been set (see set_current_state()).
-
-Addendum From:  Greg KH
-
--> most of the longer delays in the kernel can be converted to use
- msleep() as it will work properly. drivers should it  instead of 
- creating their own (incorrect) function. 
- (example: sony_sleep(void) in drivers/cdrom/sonycd535.c)
-
+[T: http://marc.theaimsgroup.com/?t=106554796200005]
+Don't forget to set_current_state(TASK_{,UN}INTERRUPTIBLE); before
+schedule*().
+Consider using msleep();.
 
 ------------------------------------------------------------------------
 From: Eugene Teo
@@ -582,66 +419,11 @@
 
 
 ------------------------------------------------------------------------
-From: Keith Owens 
-To: Andrew Morton 
-Subject: Re: Latest reference_init.pl script
-
-On Mon, 31 May 2004 23:52:14 -0700, 
-Andrew Morton  wrote:
->
->gad, reference_init generates so much stuff I wonder if it's worth using. 
->Are all these for real?
-
-Apart from altinstructions, yes.  Mainly because people have not been
-checking them.
-
->perl scripts/reference_init.pl
->Finding objects, 1411 objects, ignoring 122 module(s)
->Finding conglomerates, ignoring 137 conglomerate(s)
->Scanning objects
->Error: ./arch/i386/kernel/apic.o .data refers to 0000009c R_386_32          .init.text
+From: Keith Owens, Andrew Morton 
 
-arch/i386/kernel/apic.c
-void (*wait_timer_tick)(void) = wait_8254_wraparound;
-wait_8254_wraparound is __init.  wait_timer_tick should be __initdata,
-which flows onto several other functions.
-
->Error: ./arch/i386/kernel/cpu/mtrr/centaur.o .data refers to 00000008 R_386_32          .init.text
-
-That is real, centaur_mtrr_ops.init = centaur_mcr_init.  Like a lot of
-this initialization code, we get away with the dangling reference
-because the code is only executed at boot.
-
->Error: ./arch/i386/kernel/cpu/mtrr/centaur.o .eh_frame refers to 000000dc R_386_32          .init.text
-
-I don't see any .eh_frame references in 2.6.7-rc2 using gcc version
-3.3.3 20040412 (Red Hat Linux 3.3.3-7).  Where are they coming from?
-
->Error: ./arch/i386/kernel/cpu/mtrr/cyrix.o .data refers to 00000028 R_386_32          .init.text
-
-Same as centaur.
-
->Error: ./arch/i386/kernel/cpu/mtrr/generic.o .text refers to 0000038f R_386_32          .init.data
-
-arch/i386/kernel/cpu/mtrr/generic.c
-generic_set_all() uses __intdata smp_changes_mask.
-
->Error: ./arch/i386/kernel/smpboot.o .altinstructions refers to 00000000 R_386_32          .init.text
-
-altinstructions is a false positive, tweak reference_init.pl
-
---- reference_init.pl.orig	2004-06-01 20:30:27.000000000 +1000
-+++ reference_init.pl	2004-06-01 20:31:01.000000000 +1000
-@@ -93,6 +93,7 @@
- 		     $from !~ /\.stab$/ &&
- 		     $from !~ /\.rodata$/ &&
- 		     $from !~ /\.text\.lock$/ &&
-+		     $from !~ /\.altinstructions$/ &&
- 		     $from !~ /\.debug_/)) {
- 			printf("Error: %s %s refers to %s\n", $object, $from, $line);
- 		}
-
-The rest of the warnings look real, apart from the strange eh_frame.
+Code in wrong sections:
+[http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=108640220401558]
+Run `make buildcheck` to find offending code
 
 ----------------------------------------------------------------------
 From: Rusty Russell
@@ -667,81 +449,15 @@
 From: Matt Domsch
 Sat Jul 24 10:51:04 PDT 2004
 
-Request for Patches
-
-The 2.6.x kernel includes a MODULE_VERSION() parameter for providing
-one convenient way for all modules to state what  *their* version is
-(as opposed to the version of the larger kernel they're included in).
-
-I've started submitting patches to the subsystem maintainers to add
-MODULE_VERSION() entries for drivers that I particularly care about,
-and would appreciate assistance handling the others.
-
-For modules which display their version as a string somewhere via
-printk, the preferred mechanism is:
-
-#define DRV_VERSION "1.0.0"
-MODULE_VERSION(DRV_VERSION);
-
-One aspect of MODULE_VERSION I haven't tackled is re-formatting
-existing versions into the preferred method as found in include/linux/module.h:
-
-/* Version of form [<epoch>:]<version>[-<extra-version>].
-   Or for CVS/RCS ID version, everything but the number is stripped.
-  <epoch>: A (small) unsigned integer which allows you to start
-   versions
-           anew. If not mentioned, it's zero.  eg. "2:1.0" is after
-           "1:2.0".
-  <version>: The <version> may contain only alphanumerics and the
-           character `.'.  Ordered by numeric sort for numeric parts,
-           ascii sort for ascii parts (as per RPM or DEB algorithm).
-  <extraversion>: Like <version>, but inserted for local
-           customizations, eg "rh3" or "rusty1".
-*/
-
-I leave such reformatting up to each driver author and/or patch
-submitter.
-
-Thanks,
-Matt
+Add MODULE_VERSION() to modules.
+[http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=109068085714776]
 
 ----------------------------------------------------------------------
 From: Andi Kleen
 Date: Sun, 19 Dec 2004 20:09:03 +0100
 
-Here's a proposed janitor project if anybody is interested:
-
-The current gcc 4.0 snapshots include some more warnings in -Wall
-and changed some existing ones which makes a kernel compilation quite noisy. 
-
-The project would be to fix all these warnings.
-
-Short howto: 
-
-Get
-ftp://gcc.gnu.org/pub/gcc/snapshots/4.0-20041219/gcc-core-4.0-20041219.tar.bz2
-
-Untar it and compile with 
-
-mkdir obj
-../gcc-*/configure --disable-checking --enable-languages=c --prefix=/usr/local/gcc4
-make bootstrap
-<as root> 
-make install
-
-
-Then compile an uptodate 2.6 kernel with:
-
-make allmodconfig
-make CC=/usr/local/gcc4/bin/gcc 2>&1 | tee LOG
-grep warning LOG 
-
-You'll see lots of warnings in LOG. Fix them all and submit patches
-through the usual janitor channels.
-
--Andi
-
-[thread at http://marc.theaimsgroup.com/?t=110348353800003&r=1&w=2]
+Fix gcc 4 warnings.
+[http://marc.theaimsgroup.com/?t=110348353800003]
 
 ----------------------------------------------------------------------
 From: Felipe W Damasio

--===============271381745221976==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============271381745221976==--
