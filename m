From: Domen Puncer <domen@coderock.org>
Date: Tue, 25 Jan 2005 14:28:43 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050125142843.GB4459@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40560947336305037=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============40560947336305037==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18/01/05 00:11 +0100, Domen Puncer wrote:
> Hi.
> 
> Second stage, that i'm doing now is to put stuff into sections (like it
> is at the beginning of file).
> I'm also thinking about ordering from easiest to hardest.

I tried doing this, diff is ugly, lots of reordering, moving and
making items from below shorter. Easiest to hardest ordering is very
rough and subjective.
I think i added all new suggestions.
Deleted rcpci45.c and module licences entries.

So... is it better, or should i just continue with previous version?


	Domen


--- TODO-1.26	2005-01-17 23:55:27.000000000 +0100
+++ TODO-1.27	2005-01-25 15:15:35.000000000 +0100
@@ -3,15 +3,24 @@
 $Id: TODO,v 1.25 2004/12/29 23:03:14 domen Exp $
   -===================-
 
-None of the following items are in any order of importance or difficulty.
-Where possible related items have been grouped together.
+Send patches that add/fix items to kernel-janitors@lists.osdl.org.
+Please don't add items to end of file.
 
-Before attacking any of these, we suggest that you ask about it (them)
-on the mailing list (kernel-janitors at lists.osdl.org).
+Before attacking any of these, we suggest sending a few patches in
+advance to see if you are doing something wrong, or if someone else
+is already doing same work.
 Read related threads in the mailing list archive.
 
+Where it makes sense, sections are supposed to be ordered by incresing
+difficulty.
+
+Links are marked with:
+D: description/information about the issue
+E: example patch
+
 --------------------------------------------------------------------------
 NOTE:  scripts/kj.pl was a weekend hack.  Don't take it too seriously.
+- add more checks to kj.pl
 
 --------------------------------------------------------------------------
 Audit return codes (and handle failure correctly) for..
@@ -26,6 +35,11 @@
   Some code tests mapping for a non-zero value, which is incorrect.
 - __get_free_pages() and __get_free_page()
 - ioremap() -- Some are using this as a pointer, which is wrong.
+- put/get_user()
+- copy_*_user(), unlike put_user() it returns number of bytes failed to copy
+- kernel_thread()
+- IDE drivers, as it can cause a real problem:
+  [D: http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=110416923101031]
 
 -----------------------------------------------------------------------------
 Balancing functions.
@@ -42,13 +56,28 @@
 
 -----------------------------------------------------------------------------
 Remove unneeded historic code / New API conversions.
+- Code that depends on LINUX_VERSION_CODE & KERNEL_VERSION < 2.4 can be
+  deleted in most cases.
 - checking for NULL on probe routines for net drivers
+- get rid of init_module / cleanup_module
+- call SET_MODULE_OWNER or use .owner = THIS_MODULE instead of using
+  MOD_{INC,DEC}_USE_COUNT (only a few remain)
+- Use pci_set_drvdata() to set dev->driver_data, likewise use pci_get_drvdata()
+  instead of reading directly.
+  -   dev->driver_data = pcigame;
+  +   pci_set_drvdata(dev, pcigame);
+- get rid of verify_area with copy_*_user get/put_user, only needed if
+  using __copy_*_user et al
+- MODULE_PARM must die:
+  [D: http://marc.theaimsgroup.com/?l=linux-kernel&m=109826168201622&w=2]
+  [E: http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.10-rc1/2.6.10-rc1-mm2/broken-out/remove-module_parm-from-allyesconfig-almost.patch]
+- Add MODULE_VERSION() to modules.
+  [D: http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=109068085714776]
 - convert drivers to new PCI API
 - get rid of check_region, use just request_region checking its return (2.2
   request_region returned void) and now the driver init sequence is not to be
   serialized anymore, so races are possible (look at cardbus/pcihotplug code)
-  http://lists.osdl.org/pipermail/kernel-janitors/2004-January/000346.html
-- converting cli to spinlocks (look at net/netrom/*.c, etc)
+  [D: http://lists.osdl.org/pipermail/kernel-janitors/2004-January/000346.html]
 - ALL PCI drivers should call pci_enable_device --before-- reading
   pdev->irq or pdev->resource[].  irq and resource[] may not have correct
   values until after PCI hotplug setup occurs at pci_enable_device()
@@ -56,27 +85,106 @@
   Many of these fixed already at:
   http://www.lib.uaa.alaska.edu/linux-kernel/archive/2001-Week-11/0150.html
   FIXME: Dead URL!
-- Purely cosmetic, but far nicer to read..
+- convert cli/sti/save_flags/save_flags_cli/restore_flags usage to
+  accepted locking primitives;
+  see Documentation/cli-sti-removal.txt and Documentation/spinlocks.txt 
+  for details.
+  [E: http://linux.bkbits.net:8080/linux-2.6/cset@419b78fcaLKtZt39OF_dslTbk-b3KQ?nav=index.html|ChangeSet@-8w]
+- yield() considered harmful:
+  [D: http://marc.theaimsgroup.com/?t=106554796200005]
+  Don't forget to set_current_state(TASK_{,UN}INTERRUPTIBLE); before
+  schedule*().
+  Consider using msleep();.
+- Anything which uses sleep_on*() has a 90% chance of being broken. Fix
+  them all, because we want to remove sleep_on() and friends in 2.5.
+  [D: http://boudicca.tux.org/hypermail/linux-kernel/2001week05/0305.html]
+  Be sure to read replies too.
+- Replace (un)register_ioctl32_conversion with ioctl_compat:
+  [D: http://lkml.org/lkml/2005/1/5/106]
+
+-----------------------------------------------------------------------------
+- clean up Documentation/DocBook/ , fix warnings that occur on make *docs.
+- printk() calls should include appropriate KERN_* constant (of course
+  only at beginning of lines).
+  [E: http://linux.bkbits.net:8080/linux-2.5/patch@1.1555]
+  Example how to _not_ do it, fix it:
+  http://linux.bkbits.net:8080/linux-2.5/patch@1.1938.165.103
+- pr_debug() from kernel.h could replace a lot of DPRINTK and similar macros.
+- same for pr_info()
+- Lots of unnecessary casts in drivers can be removed.
+  Example:
+  - struct netdev_private *np = (struct netdev_private *)dev->priv;
+  + struct netdev_private *np = dev->priv;
+- min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.
+- ARRAY_SIZE macro has duplicates, remove them.
+- put BIT macro into kernel.h (?) and remove it from drivers
+- remove string concatenation with __FUNCTION__ (get rid of
+  warnings, and get ready for __func__):
+  - printk(KERN_INFO "blabla " __FUNCTION__ "\n");
+  + printk(KERN_INFO "blabla %s\n", __FUNCTION__);
+- uninitialize static variables initialized to 0, to make it go to the .bss,
+  instead of .data.
+  __initdata has to be initialized, even if to 0 though.
+- Purely cosmetic, but far nicer to read.
   - for (list = ymf_devs.next; list != &ymf_devs; list = list->next) {
   + list_for_each(list, &ymf_devs) {
-- Use pci_set_drvdata() to set dev->driver_data, likewise use pci_get_drvdata()
-  instead of reading directly.
-  -   dev->driver_data = pcigame;
-  +   pci_set_drvdata(dev, pcigame);
+- make non-global functions static.
+- preferred string form (include outputs from `size` in patch description)
+  - [const] char *foo = "blah";
+  + [const] char foo[] = "blah";
+  [D: http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=105849621011469]
+- convert all explicit lock initializations to spin_lock_init() or 
+  rwlock_init().  (Besides consistency this also helps automatic lock
+  validators and debugging code.)
+  [D: http://lwn.net/Articles/109505/]
+  [E: http://linux.bkbits.net:8080/linux-2.6/cset@419a6f292wHnthuDzw7VfgECNLmvLg?nav=index.html|ChangeSet@-8w]
+- fix warnings/errors
+  [D: http://developer.osdl.org/~cherry/compile/]
+  [D: http://www.osdl.org/projects/26lnxstblztn/results/]
+- pci_set_dma_mask() and friends should use DMA_{32,64}BIT_MASK instead of
+  0xffff...
+  [D: http://marc.theaimsgroup.com/?t=108001993000001]
+  [E: http://linux.bkbits.net:8080/linux-2.6/patch@1.1938.471.9]
+- check kmallocs for things like GFP_DMA without a memtype.
+- check that a freed pointer (*kfree_*) is not used again.
+- make sure BUG() is used correctly (i.e. if(function()) BUG(); is evil)
+  i.e. even when no-op-ing BUG we still have an if (See also: BUG_ON)
+- Code in wrong sections (ie. __init code called from __exit):
+  Run `make buildcheck` to find offending code.
+  (read_eeprom in net drivers is a good candidate for __init)
+  [D: http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=108640220401558]
+- Fix gcc 4 warnings.
+  [D: http://marc.theaimsgroup.com/?t=110348353800003]
+  Note: Set CONFIG_DEBUG_INFO=n to make compiles faster and smaller.
+- Audit all memcpy and memmove calls.
+  If areas overlap memmove should be used, if they don't memcpy.
+- drivers/char/i8k.c duplicates arch/i386/kernel/dmi_scan.c
+  Better would be to have dmi_scan.c set a flag which the i8k driver checks.
+- sleeping functions should not be called in interrupts or under spinlocks:
+  copy_to/from_user(), put/get_user(), schedule(), kmalloc()
+  except for GPF_ATOMIC, functions with __might_sleep() in body...
+- go through all the tty/serial drivers and make sure they don't give out
+  excessively useful information to non CAP_SYS_RAWIO users, then loosen
+  permissions. [D: http://lkml.org/lkml/2005/1/17/94]
+- check for dev_close calls without rntl_lock held (causes assertion
+  failures).
+- timer_del() vs. timer_del_sync()
+  [D: http://www.uwsg.iu.edu/hypermail/linux/kernel/0005.3/0269.html]
+  A lot of the timer deletion races are hard to fix because of
+  the deadlock problem.
+- fix watchdog drivers to use link order rather than explicit
+  initialization calls (i810 is particularly broken)
+- check stack usage (make checkstack) and reduce it in the worst cases.
+  [D: http://bugme.osdl.org/show_bug.cgi?id=386]
+  [D: http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=110661227615538]
 
 -----------------------------------------------------------------------------
-Copying to/from userspace issues.
-- The copy_*_user() routines may sleep.
-  For this reason, they shouldn't be called with locks held, or with
-  interrupts disabled.
-- get rid of verify_area with copy_*_user get/put_user, only needed if
-  using __copy_*_user et al
-- make sure that copy_*_user return values are checked
-- use "return copy_*_user(...) ? -EFAULT : ok_value;"
-
 SUSPECTS:
+copy_to/from_user:
 - look at drivers/char/n_tty.c
 
+
+Items with longer description in no particular order:
 -----------------------------------------------------------------------------
 - get rid of isa_read/write[bwl], use ioremap instead
 	-  unsigned long addr = 0xC0000;
@@ -128,15 +236,6 @@
     one allocation fails, but others succeeded.
 
 -----------------------------------------------------------------------------
-- fix watchdog drivers to use link order rather than explicit
-  initialization calls (i810 is particularly broken)
-
-- get rid of init_module / cleanup_module (softdog in particular)
-
-- make sure BUG() is used correctly (i.e. if(function()) BUG(); is evil)
-  i.e. even when no-op-ing BUG we still have an if (See also: BUG_ON)
-
------------------------------------------------------------------------------
 From: Hans Grobler <grobh at sun dot ac dot za>
 
 - audit an ioctl function to make sure there is no way a user can crash
@@ -146,30 +245,6 @@
   ioctls are covered by the parent ioctl function (these can be nested to
   great depths).
 
-- check for dev_close calls without rntl_lock held (cases assertion
-  failures).
-
-- check that a freed pointer (*kfree_*) is not used again.
-
------------------------------------------------------------------------------
-From: David Woodhouse <dwmw2 at infradead dot org>
-
-- Anything which uses sleep_on*() has a 90% chance of being broken. Fix
-  them all, because we want to remove sleep_on() and friends in 2.5.
-
-lkml thread at:
-http://boudicca.tux.org/hypermail/linux-kernel/2001week05/0305.html
-Be sure to read replies too.
-
------------------------------------------------------------------------------
-From: Andrew Morton <andrewm at uow dot edu dot au>
-
-Here - have about 300 bugs:
-
-      http://www.uwsg.iu.edu/hypermail/linux/kernel/0005.3/0269.html
-
-A lot of the timer deletion races are hard to fix because of
-the deadlock problem.
 
 -----------------------------------------------------------------------------
 Date:   Mon, 26 Feb 2001 16:53:50 -0800 (PST)
@@ -212,39 +287,11 @@
 CONFIG_ISAPNP -or- CONFIG_ISAPNP_MODULE is defined.
 
 ------------------------------------------------------------------------
-From: Jeff Garzik <jgarzik at mandrakesoft dot com>
-
-Audit all memcpy and memmove calls.
-
-If calling memmove, see if the areas ever overlap.
-If not, use memcpy instead.
-
-If calling memcpy, see if the areas ever overlap.
-If so, use memmmove instead.
-
-------------------------------------------------------------------------
-From: Andrey Panin <pazke at orbita dot don dot sitek dot net>
-
-- check printk() calls (should include appropriate KERN_* constant).
-
-------------------------------------------------------------------------
 From Dave Jones <davej at suse dot de>
 
 - Lots of drivers are doing evil looking things writing to PCI_CACHE_LINE_SIZE
   This should be done during PCI initialisation.
 
-- Checking LINUX_VERSION_CODE & KERNEL_VERSION for specific versions of
-  2.3 should be checked.
-
-- Lots of unnecessary casts in drivers can be removed.
-  Example:
-  -  struct netdev_private *np = (struct netdev_private *)dev->priv;
-  +  struct netdev_private *np = dev->priv;
-  Patch for a lot of these is available from
-  ftp.suse.com/pub/people/davej/kernel/2.4/2.4.2ac20/unneeded-net-casts.diff
-
-- drivers/net/aironet*.c could use some functions being made statics.
-
 - Many drivers have alignments such as..
   dev->priv = (void *)(((unsigned long)dev->priv + 7) & ~7);
   jgarzik:
@@ -254,10 +301,6 @@
    for dev->priv, and since they are DMA'ing into dev->priv, they have to
    do things manually.
 
-- drivers/net/rcpci45.c
-  Quiten debug printk's in RCioctl()
-
-- Check kmallocs for things like GFP_DMA without a memtype.
 
 - Signedness issues. We have _lots_ of these.
   Adding a -W to the kernel build line shows them. We have lots of code paths
@@ -270,49 +313,11 @@
 ------------------------------------------------------------------------
 From: Jeff Garzik <jgarzik at mandrakesoft dot com>
 
-read_eeprom can be marked __init in other net drivers also.
-
-akpm: well, not blindly, of course.  Need to follow the call graph,
-      make sure it's safe.
-
-------------------------------------------------------------------------
-From: Jeff Garzik <jgarzik at mandrakesoft dot com>
-
-The string form
-
-	[const] char *foo = "blah";
-
-creates two variables in the final assembly output, a static string, and
-a char pointer to the static string.  The alternate string form
-
-	[const] char foo[] = "blah";
-
-is better because it declares a single variable.
-
-For variables marked __initdata, the "*foo" form causes only the
-pointer, not the string itself, to be dropped from the kernel image,
-which is a bug.  Using the "foo[]" form with regular 'ole local
-variables also makes the assembly shorter.
-
-Look at the diff between include/linux/etherdevice.h in pre7 versus
-pre8.  The assembly for the pre8 version is ~10 lines shorter, with 6 of
-those removed lines being the string constant stored separately.
-Maybe this should go into CodingStyle?
-
-------------------------------------------------------------------------
-From: Jeff Garzik <jgarzik at mandrakesoft dot com>
-
 1) "unsigned int" is preferred to "int", it generates better asm code on
 all platforms except sh5.  This replacement needs to be done manually,
 because often 'int' is required due to negative values -Exxx commonly
 passed as error values.
 
-2) someone who knows DocBook, or is willing to learn, should go through
-and clean up Documentation/DocBook to kill all the warnings that occur
-during "make pdfdocs" and generally make the documents look nicer, and
-render smaller PDFs.  See, not everyone needs to be a kernel hacker to
-really help out :)
-
 ------------------------------------------------------------------------
 - when using sizeof consider using the variable and not the type, that way
   if the type of the variable is changed we don't have to go seaching all
@@ -326,84 +331,6 @@
 acme: yes, better clarify, if its a pointer you have to follow Jeff tip above
 and use sizeof(*var)
 
------------------------------------------------------------------------------
-- uninitialize static variables initialized to 0, to make it go to the .bss,
-  instead of .data
-  __initdata has to be initialized, even if to 0 tough
-
------------------------------------------------------------------------------
-drivers/char/i8k.c duplicates arch/i386/kernel/dmi_scan.c
-Better would be to have dmi_scan.c set a flag which the i8k driver checks.
-
-------------------------------------------------------------------------
-Date: Fri, 21 Feb 2003 16:27:02 -0600
-From: Eric Bresie <ebresie at usa dot net>
-
-Check here:  http://www.osdl.org/archive/cherry/stability/
-for additional kernel work.
-Also see here:  http://www.osdl.org/projects/26lnxstblztn/results/
-
-------------------------------------------------------------------------
-From several people:  clean up deprecated functions/interfaces:
-
-Convert users (callers) of deprecated functions (interfaces) to new
-interfaces:
-
-- call SET_MODULE_OWNER or use .owner = THIS_MODULE instead of using
-  MOD_{INC,DEC}_USE_COUNT (only a few remain)
-
-- convert cli/sti/save_flags/save_flags_cli/restore_flags usage to
-  accepted locking primitives;
-  see Documentation/cli-sti-removal.txt and Documentation/spinlocks.txt 
-  for details, belows patch is an example:
-  http://linux.bkbits.net:8080/linux-2.6/cset@419b78fcaLKtZt39OF_dslTbk-b3KQ?nav=index.html|ChangeSet@-8w
-
-------------------------------------------------------------------------
-From Linus:
-
-Check stack usage and reduce it in the worst cases.
-See:  http://bugme.osdl.org/show_bug.cgi?id=386
-There is another script that checks function stack usage at
-http://kernelnewbies.org/scripts/ .
-
-------------------------------------------------------------------------
-For source files that don't have any license information in them,
-determine if they should be GPL or GPL/BSD etc. and add license information
-to them.
-
-------------------------------------------------------------------------
-From Eugene Teo:
-There are a handful of schedule() within spinlocks. That needs to
-be looked at.  See the list on this page:
-  http://kbugs.org/cgi-bin/index.py?page=bug_list&script=SpinSleepLazy&skernel=2.6.0-test11&sfile=
-
-Janitors should note that kbugs merely do a \*schedule\*, so there
-may be false alarms, not all are bugs.
-
-------------------------------------------------------------------------
-- pr_debug() from kernel.h could replace a lot of DPRINTK and similar macros.
-- same for pr_info()
-- min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.
-- remove string concatenation with __FUNCTION__ (get rid of
-  warnings, and get ready for __func__):
-  -printk(KERN_INFO "blabla " __FUNCTION__ "\n");
-  +printk(KERN_INFO "blabla %s\n", __FUNCTION__);
-
-------------------------------------------------------------------------
-From: Matthew Wilcox
-Subject: Calling yield() Considered Harmful
-
-[T: http://marc.theaimsgroup.com/?t=106554796200005]
-Don't forget to set_current_state(TASK_{,UN}INTERRUPTIBLE); before
-schedule*().
-Consider using msleep();.
-
-------------------------------------------------------------------------
-From: Eugene Teo
-
-- audit the return codes of kernel_thread(). Some sections of code
-use kernel_thread(), but failure of this function is not handled.
-
 ------------------------------------------------------------------------
 From: Greg KH 
 
@@ -417,54 +344,4 @@
 
 -  convert from pci_module_init to pci_register_driver
 
-
-------------------------------------------------------------------------
-From: Keith Owens, Andrew Morton 
-
-Code in wrong sections:
-[http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=108640220401558]
-Run `make buildcheck` to find offending code
-
-----------------------------------------------------------------------
-From: Rusty Russell
-
-MODULE_PARM must die:
-+extern void __deprecated MODULE_PARM_(void);
-
-http://marc.theaimsgroup.com/?l=linux-kernel&m=109826168201622&w=2
-http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.10-rc1/2.6.10-rc1-mm2/broken-out/remove-module_parm-from-allyesconfig-almost.patch
-
-----------------------------------------------------------------------
-From: Jonathan Corbet
-
-Unified spinlock initialization:
-convert all explicit lock initializations to spin_lock_init() or 
-rwlock_init().  (Besides consistency this also helps automatic lock
-validators and debugging code.)
-
-http://lwn.net/Articles/109505/
-http://linux.bkbits.net:8080/linux-2.6/cset@419a6f292wHnthuDzw7VfgECNLmvLg?nav=index.html|ChangeSet@-8w
-
-----------------------------------------------------------------------
-From: Matt Domsch
-Sat Jul 24 10:51:04 PDT 2004
-
-Add MODULE_VERSION() to modules.
-[http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=109068085714776]
-
-----------------------------------------------------------------------
-From: Andi Kleen
-Date: Sun, 19 Dec 2004 20:09:03 +0100
-
-Fix gcc 4 warnings.
-[http://marc.theaimsgroup.com/?t=110348353800003]
-
-----------------------------------------------------------------------
-From: Felipe W Damasio
-Date: Mon, 27 Dec 2004 15:37:08 -0200
-
-Felipe suggests auditing return codes in IDE drivers as it can cause
-a real problem.
-See original message for example patch:
-http://marc.theaimsgroup.com/?l=kernel-janitor-discuss&m=110416923101031
 --------------------------------end-----------------------------------

--===============40560947336305037==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40560947336305037==--
