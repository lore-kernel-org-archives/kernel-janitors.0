From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Tue, 08 Feb 2005 22:05:32 +0000
Subject: [KJ] [PATCH] Reduction of compile warnings (Warning: long post
Message-Id: <420953CC.2707.A99E9B@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Message-Boundary-23503"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Message-Boundary-23503
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Greetings,

This will be my first attempt at submitting a patch, so please be 
reasonably gentle with me :-)  I have tried to comply with all that I 
have read, but I most likely missed something.

I attach 3 files in text/plain Ascii format; I think I understood the 
FAQ correctly that this is the right way to do things?

My build tree consists of 
http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.11-
rc3.tar.bz2 with Andrew Morton's -mm patch: 
http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.11-
rc3/2.6.11-rc3-mm1/2.6.11-rc3-mm1.bz2

I am running Fedora Core 3 with gcc 3.4.2 (I THINK that is the correct 
version number - for me to be sure, I would have to reboot back into 
Linux, and I don't want to do this right now.)  In any case, it is a 
fully updated vanilla Fedora Core 3 (slightly customized kernel build).

It seems that 2.6.11-rc3-mm introduced a static function in swsusp.c 
that breaks the compile on my GCC. This .

The error I get when trying to build the original is the first 
attachment to this post.  
The fix for this is part of the following patch. 

My sequence of execution for the build is:
$ cd ~/linux-2.6.11-rc3-mm
$ make mrproper && \
make allyesconfig && \
make bzImage 2>&1 | tee ~/warnings.txt

I have managed to reduce the number of warnings from 229 to 88.

I arrived at these numbers by first compiling the original without any 
modifications (except the swsusp.c fix to enable completion of build), 
and then a copy of the original with the following patch applied.  I 
then executed:
$  grep "warning:" ~/warnings.txt | wc -l

The second attachment to this post is the set of build warnings that are 
still produced with this patch, distilled from a full build output, 
warnings.txt by using
$ grep "^[^ ()]" warnings.txt

The warnings that remain are mostly of the "deprecated" type for pm_* 
type warnings that I need guidence on what to do about, since I was not 
able to find any definitive guide to converting a driver with 2.4 style 
power management to 2.6 style power management. Thus, I left these alone. 
 I have not seen too much traffic about this on either the kernel-
janitors list or lkml, so this would be open territory.  Any help on this 
would be appreciated.

Most of the other warnings are about check_region which I see is already 
being address as far as I can tell.

The rest of the warnings left are: deprecated for inter_module_* 
functions which seems to be already a topic of discussion in lkml (or 
was),  mca-legacy issues which I have no idea about, a couple of warnings 
about mcdx not being edited which are legitimate, a hardcoded "#warning" 
in drivers/isdn/capi/capidrv.c (?), another hardcoded #warning in 
drivers/isdn/icn/icn.c, two assembly language warnings in 
drivers/scsi/ultrastor.c for a line of assembly language that I can't 
identify (and I can identify quite a few!).

The third attachment to this post is the patch itself.  Please let me 
know if this comes through ok... 


--Message-Boundary-23503
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  swsusp-nocompile.txt
     Date:  8 Feb 2005, 21:14
     Size:  379 bytes.
     Type:  Text

--Message-Boundary-23503
Content-type: Application/Octet-stream; name="swsusp-nocompile.txt"; type=Text
Content-disposition: attachment; filename="swsusp-nocompile.txt"

  CC      kernel/power/swsusp.o
kernel/power/swsusp.c: In function `alloc_pagedir':
kernel/power/swsusp.c:608: sorry, unimplemented: inlining failed in call to 'free_pagedir': function body not available
kernel/power/swsusp.c:646: sorry, unimplemented: called from here
make[2]: *** [kernel/power/swsusp.o] Error 1
make[1]: *** [kernel/power] Error 2
make: *** [kernel] Error 2

--Message-Boundary-23503
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  distilled-warnings.txt
     Date:  9 Feb 2005, 0:01
     Size:  13200 bytes.
     Type:  Text

--Message-Boundary-23503
Content-type: Application/Octet-stream; name="distilled-warnings.txt";
	type=Text
Content-disposition: attachment; filename="distilled-warnings.txt"

arch/i386/kernel/apm.c: In function `suspend':
arch/i386/kernel/apm.c:1191: warning: `pm_send_all' is deprecated (declared at include/linux/pm.h:126)
arch/i386/kernel/apm.c:1241: warning: `pm_send_all' is deprecated (declared at include/linux/pm.h:126)
arch/i386/kernel/apm.c: In function `check_events':
arch/i386/kernel/apm.c:1357: warning: `pm_send_all' is deprecated (declared at include/linux/pm.h:126)
kernel/intermodule.c:179: warning: `inter_module_register' is deprecated (declared at kernel/intermodule.c:38)
kernel/intermodule.c:180: warning: `inter_module_unregister' is deprecated (declared at kernel/intermodule.c:79)
kernel/intermodule.c:183: warning: `inter_module_put' is deprecated (declared at kernel/intermodule.c:160)
kernel/power/pm.c: In function `pm_undo_all':
kernel/power/pm.c:201: warning: `pm_send' is deprecated (declared at kernel/power/pm.c:155)
kernel/power/pm.c: In function `pm_send_all':
kernel/power/pm.c:242: warning: `pm_send' is deprecated (declared at kernel/power/pm.c:155)
kernel/power/pm.c: At top level:
kernel/power/pm.c:259: warning: `pm_register' is deprecated (declared at kernel/power/pm.c:62)
kernel/power/pm.c:260: warning: `pm_unregister' is deprecated (declared at kernel/power/pm.c:86)
kernel/power/pm.c:261: warning: `pm_unregister_all' is deprecated (declared at kernel/power/pm.c:115)
kernel/power/pm.c:262: warning: `pm_send_all' is deprecated (declared at kernel/power/pm.c:234)
In file included from drivers/block/ps2esdi.c:42:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/cdrom/mcdx.c:79:
drivers/cdrom/mcdx.h:180:2: warning: #warning You have not edited mcdx.h
drivers/cdrom/mcdx.h:181:2: warning: #warning Perhaps irq and i/o settings are wrong.
drivers/char/vt.c: In function `vc_allocate':
drivers/char/vt.c:727: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
drivers/char/specialix.c: In function `sx_check_io_range':
drivers/char/specialix.c:343: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/isdn/capi/capidrv.c:2108:3: warning: #warning FIXME: maybe a race condition the card should be removed here from global list /kkeil
drivers/isdn/icn/icn.c:719:4: warning: #warning TODO test headroom or use skb->nb to flag ACK
In file included from drivers/mca/mca-legacy.c:31:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/mca/mca-legacy.c:31:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
drivers/mtd/mtdcore.c: In function `init_mtd':
drivers/mtd/mtdcore.c:393: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
drivers/mtd/mtdcore.c: In function `cleanup_mtd':
drivers/mtd/mtdcore.c:402: warning: `pm_unregister' is deprecated (declared at include/linux/pm.h:111)
drivers/mtd/chips/cfi_cmdset_0020.c: In function `cfi_staa_init':
drivers/mtd/chips/cfi_cmdset_0020.c:1406: warning: `inter_module_register' is deprecated (declared at include/linux/module.h:564)
drivers/mtd/chips/cfi_cmdset_0020.c: In function `cfi_staa_exit':
drivers/mtd/chips/cfi_cmdset_0020.c:1412: warning: `inter_module_unregister' is deprecated (declared at include/linux/module.h:565)
drivers/mtd/chips/cfi_cmdset_0002.c: In function `cfi_amdstd_init':
drivers/mtd/chips/cfi_cmdset_0002.c:1499: warning: `inter_module_register' is deprecated (declared at include/linux/module.h:564)
drivers/mtd/chips/cfi_cmdset_0002.c: In function `cfi_amdstd_exit':
drivers/mtd/chips/cfi_cmdset_0002.c:1506: warning: `inter_module_unregister' is deprecated (declared at include/linux/module.h:565)
drivers/mtd/chips/cfi_cmdset_0001.c: In function `cfi_intelext_init':
drivers/mtd/chips/cfi_cmdset_0001.c:2141: warning: `inter_module_register' is deprecated (declared at include/linux/module.h:564)
drivers/mtd/chips/cfi_cmdset_0001.c:2142: warning: `inter_module_register' is deprecated (declared at include/linux/module.h:564)
drivers/mtd/chips/cfi_cmdset_0001.c: In function `cfi_intelext_exit':
drivers/mtd/chips/cfi_cmdset_0001.c:2148: warning: `inter_module_unregister' is deprecated (declared at include/linux/module.h:565)
drivers/mtd/chips/cfi_cmdset_0001.c:2149: warning: `inter_module_unregister' is deprecated (declared at include/linux/module.h:565)
drivers/mtd/chips/gen_probe.c: In function `cfi_cmdset_unknown':
drivers/mtd/chips/gen_probe.c:210: warning: `inter_module_put' is deprecated (declared at include/linux/module.h:569)
drivers/mtd/devices/doc2000.c: In function `init_doc2000':
drivers/mtd/devices/doc2000.c:1281: warning: `inter_module_register' is deprecated (declared at include/linux/module.h:564)
drivers/mtd/devices/doc2000.c: In function `cleanup_doc2000':
drivers/mtd/devices/doc2000.c:1300: warning: `inter_module_unregister' is deprecated (declared at include/linux/module.h:565)
drivers/mtd/devices/doc2001.c: In function `init_doc2001':
drivers/mtd/devices/doc2001.c:861: warning: `inter_module_register' is deprecated (declared at include/linux/module.h:564)
drivers/mtd/devices/doc2001.c: In function `cleanup_doc2001':
drivers/mtd/devices/doc2001.c:880: warning: `inter_module_unregister' is deprecated (declared at include/linux/module.h:565)
drivers/mtd/devices/doc2001plus.c: In function `init_doc2001plus':
drivers/mtd/devices/doc2001plus.c:1127: warning: `inter_module_register' is deprecated (declared at include/linux/module.h:564)
drivers/mtd/devices/doc2001plus.c: In function `cleanup_doc2001plus':
drivers/mtd/devices/doc2001plus.c:1146: warning: `inter_module_unregister' is deprecated (declared at include/linux/module.h:565)
drivers/mtd/devices/docprobe.c: In function `DoC_Probe':
drivers/mtd/devices/docprobe.c:315: warning: `inter_module_put' is deprecated (declared at include/linux/module.h:569)
drivers/net/irda/nsc-ircc.c: In function `nsc_ircc_cleanup':
drivers/net/irda/nsc-ircc.c:232: warning: `pm_unregister_all' is deprecated (declared at include/linux/pm.h:116)
drivers/net/irda/nsc-ircc.c: In function `nsc_ircc_open':
drivers/net/irda/nsc-ircc.c:369: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
drivers/net/irda/smsc-ircc2.c: In function `smsc_ircc_open':
drivers/net/irda/smsc-ircc2.c:464: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
drivers/net/irda/smsc-ircc2.c: In function `smsc_ircc_close':
drivers/net/irda/smsc-ircc2.c:1694: warning: `pm_unregister' is deprecated (declared at include/linux/pm.h:111)
drivers/net/irda/ali-ircc.c: In function `ali_ircc_cleanup':
drivers/net/irda/ali-ircc.c:231: warning: `pm_unregister_all' is deprecated (declared at include/linux/pm.h:116)
drivers/net/irda/ali-ircc.c: In function `ali_ircc_open':
drivers/net/irda/ali-ircc.c:359: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
In file included from drivers/net/tokenring/madgemc.c:23:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/net/tokenring/smctr.c:46:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/net/ne2.c:73:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/net/at1700.c:46:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/net/3c523.c:105:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/net/ibmlana.c:86:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/net/3c527.c:96:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
drivers/net/3c509.c: In function `el3_common_remove':
drivers/net/3c509.c:365: warning: `pm_unregister' is deprecated (declared at include/linux/pm.h:111)
drivers/net/3c509.c: In function `el3_probe':
drivers/net/3c509.c:575: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
In file included from drivers/net/eexpress.c:116:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
drivers/pcmcia/i82365.c: In function `is_alive':
drivers/pcmcia/i82365.c:672: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/pcmcia/i82365.c: In function `isa_probe':
drivers/pcmcia/i82365.c:806: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c: In function `BusLogic_InitializeProbeInfoListISA':
drivers/scsi/BusLogic.c:583: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:585: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:587: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:589: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:591: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:593: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c: In function `BusLogic_InitializeMultiMasterProbeInfo':
drivers/scsi/BusLogic.c:799: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:809: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:811: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:813: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:815: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/BusLogic.c:817: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
drivers/scsi/ultrastor.c: In function `ultrastor_queuecommand':
drivers/scsi/ultrastor.c:302: warning: matching constraint does not allow a register
drivers/scsi/ultrastor.c:302: warning: matching constraint does not allow a register
In file included from drivers/scsi/aha1542.c:43:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/scsi/fd_mcs.c:92:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
In file included from drivers/scsi/ibmmca.c:42:
include/linux/mca-legacy.h:12:2: warning: #warning "MCA legacy - please move your driver to the new sysfs api"
sound/core/init.c: In function `snd_card_free':
sound/core/init.c:257: warning: `pm_unregister' is deprecated (declared at include/linux/pm.h:111)
sound/core/init.c: In function `snd_card_set_dev_pm_callback':
sound/core/init.c:772: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
sound/oss/cs4232.c: In function `probe_cs4232':
sound/oss/cs4232.c:198: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
sound/oss/ad1848.c: In function `ad1848_init':
sound/oss/ad1848.c:2029: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
sound/oss/ad1848.c: In function `ad1848_unload':
sound/oss/ad1848.c:2201: warning: `pm_unregister' is deprecated (declared at include/linux/pm.h:111)
sound/oss/pss.c: In function `configure_nonsound_components':
sound/oss/pss.c:681: warning: `check_region' is deprecated (declared at include/linux/ioport.h:126)
sound/oss/opl3sa2.c: In function `init_opl3sa2':
sound/oss/opl3sa2.c:1024: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
sound/oss/opl3sa2.c: In function `cleanup_opl3sa2':
sound/oss/opl3sa2.c:1086: warning: `pm_unregister' is deprecated (declared at include/linux/pm.h:111)
sound/oss/nm256_audio.c: In function `nm256_install':
sound/oss/nm256_audio.c:1235: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
sound/oss/nm256_audio.c: In function `cleanup_nm256':
sound/oss/nm256_audio.c:1697: warning: `pm_unregister_all' is deprecated (declared at include/linux/pm.h:116)
sound/oss/maestro.c: In function `maestro_probe':
sound/oss/maestro.c:3452: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
sound/oss/maestro.c: In function `cleanup_maestro':
sound/oss/maestro.c:3672: warning: `pm_unregister_all' is deprecated (declared at include/linux/pm.h:116)
sound/oss/cs4281/cs4281m.c: In function `cs4281_probe':
sound/oss/cs4281/cs4281m.c:4376: warning: `pm_register' is deprecated (declared at include/linux/pm.h:106)
sound/oss/cs4281/cs4281m.c: In function `cs4281_cleanup_module':
sound/oss/cs4281/cs4281m.c:4490: warning: `pm_unregister_all' is deprecated (declared at include/linux/pm.h:116)
--Message-Boundary-23503
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  linux-2.6.11-rc3-mm_compile-warnings.patch
     Date:  8 Feb 2005, 21:08
     Size:  55489 bytes.
     Type:  Text

--Message-Boundary-23503
Content-type: Application/Octet-stream;
	name="linux-2.6.11-rc3-mm_compile-warnings.patch"; type=Text
Content-disposition: attachment;
	filename="linux-2.6.11-rc3-mm_compile-warnings.patch"

diff -Nurdp linux-2.6.11-rc3-mm-original/arch/i386/math-emu/fpu_entry.c linux-2.6.11-rc3-mm/arch/i386/math-emu/fpu_entry.c
--- linux-2.6.11-rc3-mm-original/arch/i386/math-emu/fpu_entry.c	2005-02-03 03:56:35.000000000 +0200
+++ linux-2.6.11-rc3-mm/arch/i386/math-emu/fpu_entry.c	2005-02-08 16:38:38.000000000 +0200
@@ -742,7 +742,8 @@ int save_i387_soft(void *s387, struct _f
   S387->fcs &= ~0xf8000000;
   S387->fos |= 0xffff0000;
 #endif /* PECULIAR_486 */
-  __copy_to_user(d, &S387->cwd, 7*4);
+  if (__copy_to_user(d, &S387->cwd, 7*4))
+    return -1;
   RE_ENTRANT_CHECK_ON;
 
   d += 7*4;
diff -Nurdp linux-2.6.11-rc3-mm-original/arch/i386/math-emu/reg_ld_str.c linux-2.6.11-rc3-mm/arch/i386/math-emu/reg_ld_str.c
--- linux-2.6.11-rc3-mm-original/arch/i386/math-emu/reg_ld_str.c	2005-02-03 03:56:21.000000000 +0200
+++ linux-2.6.11-rc3-mm/arch/i386/math-emu/reg_ld_str.c	2005-02-08 16:36:20.000000000 +0200
@@ -89,12 +89,17 @@ int FPU_tagof(FPU_REG *ptr)
 int FPU_load_extended(long double __user *s, int stnr)
 {
   FPU_REG *sti_ptr = &st(stnr);
+  int user_copy_err;
 
   RE_ENTRANT_CHECK_OFF;
   FPU_verify_area(VERIFY_READ, s, 10);
-  __copy_from_user(sti_ptr, s, 10);
+  user_copy_err = __copy_from_user(sti_ptr, s, 10);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err) {
+	EXCEPTION(EX_INTERNAL);
+	return TAG_Special;
+  }
   return FPU_tagof(sti_ptr);
 }
 
@@ -240,13 +245,19 @@ int FPU_load_int64(long long __user *_s)
 {
   long long s;
   int sign;
+  int user_copy_err;
   FPU_REG *st0_ptr = &st(0);
 
   RE_ENTRANT_CHECK_OFF;
   FPU_verify_area(VERIFY_READ, _s, 8);
-  copy_from_user(&s,_s,8);
+  user_copy_err = copy_from_user(&s,_s,8);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err) {
+	EXCEPTION(EX_INTERNAL);
+	return TAG_Special;
+  }
+
   if (s == 0)
     {
       reg_copy(&CONST_Z, st0_ptr);
@@ -859,6 +870,7 @@ int FPU_store_int64(FPU_REG *st0_ptr, u_
   FPU_REG t;
   long long tll;
   int precision_loss;
+  int user_copy_err;
 
   if ( st0_tag == TAG_Empty )
     {
@@ -907,9 +919,14 @@ int FPU_store_int64(FPU_REG *st0_ptr, u_
 
   RE_ENTRANT_CHECK_OFF;
   FPU_verify_area(VERIFY_WRITE,d,8);
-  copy_to_user(d, &tll, 8);
+  user_copy_err = copy_to_user(d, &tll, 8);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err) {
+	EXCEPTION(EX_INTERNAL);
+	return 0;
+  }
+
   return 1;
 }
 
@@ -1271,15 +1288,21 @@ void frstor(fpu_addr_modes addr_modes, u
   int i, regnr;
   u_char __user *s = fldenv(addr_modes, data_address);
   int offset = (top & 7) * 10, other = 80 - offset;
+  int user_copy_err;
 
   /* Copy all registers in stack order. */
   RE_ENTRANT_CHECK_OFF;
   FPU_verify_area(VERIFY_READ,s,80);
-  __copy_from_user(register_base+offset, s, other);
-  if ( offset )
-    __copy_from_user(register_base, s+other, offset);
+  user_copy_err = __copy_from_user(register_base+offset, s, other);
+  if ( !user_copy_err && offset )
+    user_copy_err = __copy_from_user(register_base, s+other, offset);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err) {
+	EXCEPTION(EX_INTERNAL);
+	return;
+  }
+
   for ( i = 0; i < 8; i++ )
     {
       regnr = (i+top) & 7;
@@ -1325,6 +1348,7 @@ u_char __user *fstenv(fpu_addr_modes add
     }
   else
     {
+      int user_copy_err;
       RE_ENTRANT_CHECK_OFF;
       FPU_verify_area(VERIFY_WRITE, d, 7*4);
 #ifdef PECULIAR_486
@@ -1336,8 +1360,12 @@ u_char __user *fstenv(fpu_addr_modes add
       I387.soft.fcs &= ~0xf8000000;
       I387.soft.fos |= 0xffff0000;
 #endif /* PECULIAR_486 */
-      __copy_to_user(d, &control_word, 7*4);
+      user_copy_err = __copy_to_user(d, &control_word, 7*4);
       RE_ENTRANT_CHECK_ON;
+
+      if(user_copy_err)
+	EXCEPTION(EX_INTERNAL);
+
       d += 0x1c;
     }
   
@@ -1352,6 +1380,7 @@ void fsave(fpu_addr_modes addr_modes, u_
 {
   u_char __user *d;
   int offset = (top & 7) * 10, other = 80 - offset;
+  int user_copy_err;
 
   d = fstenv(addr_modes, data_address);
 
@@ -1359,11 +1388,14 @@ void fsave(fpu_addr_modes addr_modes, u_
   FPU_verify_area(VERIFY_WRITE,d,80);
 
   /* Copy all registers in stack order. */
-  __copy_to_user(d, register_base+offset, other);
-  if ( offset )
-    __copy_to_user(d+other, register_base, offset);
+  user_copy_err = __copy_to_user(d, register_base+offset, other);
+  if (!user_copy_err && offset )
+    user_copy_err = __copy_to_user(d+other, register_base, offset);
   RE_ENTRANT_CHECK_ON;
 
+  if(user_copy_err)
+	EXCEPTION(EX_INTERNAL);
+
   finit();
 }
 
diff -Nurdp linux-2.6.11-rc3-mm-original/.config linux-2.6.11-rc3-mm/.config
--- linux-2.6.11-rc3-mm-original/.config	2005-02-07 16:34:23.000000000 +0200
+++ linux-2.6.11-rc3-mm/.config	2005-02-08 18:47:46.954507280 +0200
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.11-rc3-mm1
-# Mon Feb  7 16:34:23 2005
+# Tue Feb  8 18:47:46 2005
 #
 CONFIG_X86=y
 CONFIG_MMU=y
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/block/cciss_scsi.c linux-2.6.11-rc3-mm/drivers/block/cciss_scsi.c
--- linux-2.6.11-rc3-mm-original/drivers/block/cciss_scsi.c	2005-02-03 03:55:22.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/block/cciss_scsi.c	2005-02-07 15:34:17.000000000 +0200
@@ -706,7 +706,8 @@ cciss_scsi_detect(int ctlr)
 	sh->hostdata[0] = (unsigned long) hba[ctlr];
 	sh->irq = hba[ctlr]->intr;
 	sh->unique_id = sh->irq;
-	scsi_add_host(sh, &hba[ctlr]->pdev->dev); /* XXX handle failure */
+	if(scsi_add_host(sh, &hba[ctlr]->pdev->dev))
+		return 0; /* XXX handle failure */
 	scsi_scan_host(sh);
 
 	return 1;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/block/sx8.c linux-2.6.11-rc3-mm/drivers/block/sx8.c
--- linux-2.6.11-rc3-mm-original/drivers/block/sx8.c	2005-02-03 03:57:16.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/block/sx8.c	2005-02-07 15:35:49.000000000 +0200
@@ -1503,7 +1503,7 @@ static int carm_init_disks(struct carm_h
 		}
 
 		port->disk = disk;
-		sprintf(disk->disk_name, DRV_NAME "/%u", (host->id * CARM_MAX_PORTS) + i);
+		sprintf(disk->disk_name, DRV_NAME "/%u", (unsigned int)((host->id * CARM_MAX_PORTS) + i));
 		sprintf(disk->devfs_name, DRV_NAME "/%u_%u", host->id, i);
 		disk->major = host->major;
 		disk->first_minor = i * CARM_MINORS_PER_MAJOR;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/char/applicom.c linux-2.6.11-rc3-mm/drivers/char/applicom.c
--- linux-2.6.11-rc3-mm-original/drivers/char/applicom.c	2005-02-03 03:56:48.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/char/applicom.c	2005-02-07 15:37:40.000000000 +0200
@@ -65,6 +65,7 @@ static char *applicom_pci_devnames[] = {
 	"PCI2000PFB"
 };
 
+#ifdef MODULE
 static struct pci_device_id applicom_pci_tbl[] = {
 	{ PCI_VENDOR_ID_APPLICOM, PCI_DEVICE_ID_APPLICOM_PCIGENERIC,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
@@ -75,6 +76,7 @@ static struct pci_device_id applicom_pci
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, applicom_pci_tbl);
+#endif
 
 MODULE_AUTHOR("David Woodhouse & Applicom International");
 MODULE_DESCRIPTION("Driver for Applicom Profibus card");
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/char/sx.c linux-2.6.11-rc3-mm/drivers/char/sx.c
--- linux-2.6.11-rc3-mm-original/drivers/char/sx.c	2005-02-07 16:32:20.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/char/sx.c	2005-02-07 15:37:10.000000000 +0200
@@ -252,11 +252,13 @@
 #endif
 
 #ifdef CONFIG_PCI
+#ifdef MODULE
 static struct pci_device_id sx_pci_tbl[] = {
 	{ PCI_VENDOR_ID_SPECIALIX, PCI_DEVICE_ID_SPECIALIX_SX_XIO_IO8, PCI_ANY_ID, PCI_ANY_ID },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, sx_pci_tbl);
+#endif
 #endif /* CONFIG_PCI */
 
 /* Configurable options: 
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/char/watchdog/alim1535_wdt.c linux-2.6.11-rc3-mm/drivers/char/watchdog/alim1535_wdt.c
--- linux-2.6.11-rc3-mm-original/drivers/char/watchdog/alim1535_wdt.c	2005-02-03 03:55:23.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/char/watchdog/alim1535_wdt.c	2005-02-07 15:38:11.000000000 +0200
@@ -307,6 +307,7 @@ static int ali_notify_sys(struct notifie
 	return NOTIFY_DONE;
 }
 
+#ifdef MODULE
 /*
  *	Data for PCI driver interface
  *
@@ -321,6 +322,7 @@ static struct pci_device_id ali_pci_tbl[
 	{ 0, },
 };
 MODULE_DEVICE_TABLE(pci, ali_pci_tbl);
+#endif
 
 /*
  *	ali_find_watchdog	-	find a 1535 and 7101
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/ide/ide-tape.c linux-2.6.11-rc3-mm/drivers/ide/ide-tape.c
--- linux-2.6.11-rc3-mm-original/drivers/ide/ide-tape.c	2005-02-07 16:32:20.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/ide/ide-tape.c	2005-02-07 18:10:25.000000000 +0200
@@ -2644,7 +2644,12 @@ static void idetape_copy_stage_from_user
 		}
 #endif /* IDETAPE_DEBUG_BUGS */
 		count = min((unsigned int)(bh->b_size - atomic_read(&bh->b_count)), (unsigned int)n);
-		copy_from_user(bh->b_data + atomic_read(&bh->b_count), buf, count);
+		if(copy_from_user(bh->b_data + atomic_read(&bh->b_count), buf, count)) {
+#if IDETAPE_DEBUG_BUGS
+			printk(KERN_ERR "ide-tape/%s: copy_from_user failed!\n",__FUNCTION__);
+#endif /* IDETAPE_DEBUG_BUGS */
+			return;
+		}
 		n -= count;
 		atomic_add(count, &bh->b_count);
 		buf += count;
@@ -2671,7 +2676,12 @@ static void idetape_copy_stage_to_user (
 		}
 #endif /* IDETAPE_DEBUG_BUGS */
 		count = min(tape->b_count, n);
-		copy_to_user(buf, tape->b_data, count);
+		if(copy_to_user(buf, tape->b_data, count)) {
+#if IDETAPE_DEBUG_BUGS
+			printk(KERN_ERR "ide-tape/%s: copy_to_user failed!\n",__FUNCTION__);
+#endif /* IDETAPE_DEBUG_BUGS */
+			return;
+		}
 		n -= count;
 		tape->b_data += count;
 		tape->b_count -= count;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/isdn/hisax/config.c linux-2.6.11-rc3-mm/drivers/isdn/hisax/config.c
--- linux-2.6.11-rc3-mm-original/drivers/isdn/hisax/config.c	2005-02-03 03:56:47.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/isdn/hisax/config.c	2005-02-07 20:47:02.000000000 +0200
@@ -631,7 +631,11 @@ int HiSax_readstatus(u_char __user *buf,
 		count = cs->status_end - cs->status_read + 1;
 		if (count >= len)
 			count = len;
-		copy_to_user(p, cs->status_read, count);
+		if(copy_to_user(p, cs->status_read, count)) {
+			printk(KERN_ERR
+				"HiSax: copy_to_user failed!\n");
+			return -EFAULT;
+		}
 		cs->status_read += count;
 		if (cs->status_read > cs->status_end)
 			cs->status_read = cs->status_buf;
@@ -642,7 +646,11 @@ int HiSax_readstatus(u_char __user *buf,
 				cnt = HISAX_STATUS_BUFSIZE;
 			else
 				cnt = count;
-			copy_to_user(p, cs->status_read, cnt);
+			if(copy_to_user(p, cs->status_read, cnt)) {
+				printk(KERN_ERR
+					"HiSax: copy_to_user failed!\n");
+				return -EFAULT;
+			}
 			p += cnt;
 			cs->status_read += cnt % HISAX_STATUS_BUFSIZE;
 			count -= cnt;
@@ -1878,6 +1886,7 @@ static void EChannel_proc_rcv(struct his
 #ifdef CONFIG_PCI
 #include <linux/pci.h>
 
+#ifdef MODULE
 static struct pci_device_id hisax_pci_tbl[] __initdata = {
 #ifdef CONFIG_HISAX_FRITZPCI
 	{PCI_VENDOR_ID_AVM,      PCI_DEVICE_ID_AVM_A1,           PCI_ANY_ID, PCI_ANY_ID},
@@ -1944,6 +1953,7 @@ static struct pci_device_id hisax_pci_tb
 };
 
 MODULE_DEVICE_TABLE(pci, hisax_pci_tbl);
+#endif /* MODULE */
 #endif /* CONFIG_PCI */
 
 module_init(HiSax_init);
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/isdn/i4l/isdn_common.c linux-2.6.11-rc3-mm/drivers/isdn/i4l/isdn_common.c
--- linux-2.6.11-rc3-mm-original/drivers/isdn/i4l/isdn_common.c	2005-02-03 03:55:36.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/isdn/i4l/isdn_common.c	2005-02-07 18:30:54.000000000 +0200
@@ -1842,8 +1842,12 @@ isdn_writebuf_stub(int drvidx, int chan,
 	if (!skb)
 		return 0;
 	skb_reserve(skb, hl);
-	copy_from_user(skb_put(skb, len), buf, len);
+	if(copy_from_user(skb_put(skb, len), buf, len)) {
+		ret = -EFAULT;
+		goto after_writebuf_skb;
+	}
 	ret = dev->drv[drvidx]->interface->writebuf_skb(drvidx, chan, 1, skb);
+after_writebuf_skb:
 	if (ret <= 0)
 		dev_kfree_skb(skb);
 	if (ret > 0)
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/isdn/i4l/isdn_ppp.c linux-2.6.11-rc3-mm/drivers/isdn/i4l/isdn_ppp.c
--- linux-2.6.11-rc3-mm-original/drivers/isdn/i4l/isdn_ppp.c	2005-02-03 03:56:11.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/isdn/i4l/isdn_ppp.c	2005-02-07 20:50:34.000000000 +0200
@@ -789,7 +789,8 @@ isdn_ppp_read(int min, struct file *file
 	is->first = b;
 
 	spin_unlock_irqrestore(&is->buflock, flags);
-	copy_to_user(buf, save_buf, count);
+	if(copy_to_user(buf, save_buf, count))
+		count = -EFAULT; /* make sure we free the save_buf */
 	kfree(save_buf);
 
 	return count;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/isdn/i4l/isdn_v110.c linux-2.6.11-rc3-mm/drivers/isdn/i4l/isdn_v110.c
--- linux-2.6.11-rc3-mm-original/drivers/isdn/i4l/isdn_v110.c	2005-02-03 03:57:04.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/isdn/i4l/isdn_v110.c	2005-02-07 15:41:54.000000000 +0200
@@ -520,7 +520,7 @@ isdn_v110_stat_callback(int idx, isdn_ct
 {
 	isdn_v110_stream *v = NULL;
 	int i;
-	int ret;
+	int ret = 0;
 
 	if (idx < 0)
 		return 0;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/isdn/pcbit/drv.c linux-2.6.11-rc3-mm/drivers/isdn/pcbit/drv.c
--- linux-2.6.11-rc3-mm-original/drivers/isdn/pcbit/drv.c	2005-02-03 03:56:22.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/isdn/pcbit/drv.c	2005-02-07 20:21:43.000000000 +0200
@@ -727,23 +727,26 @@ int pcbit_stat(u_char __user *buf, int l
 
 	if (stat_st < stat_end)
 	{
-		copy_to_user(buf, statbuf + stat_st, len);
+		if(copy_to_user(buf, statbuf + stat_st, len))
+			return -EFAULT;
 		stat_st += len;	   
 	}
 	else
 	{
 		if (len > STATBUF_LEN - stat_st)
 		{
-			copy_to_user(buf, statbuf + stat_st, 
-				       STATBUF_LEN - stat_st);
-			copy_to_user(buf, statbuf, 
-				       len - (STATBUF_LEN - stat_st));
+			if(copy_to_user(buf, statbuf + stat_st, 
+				       STATBUF_LEN - stat_st) ||
+				copy_to_user(buf, statbuf, 
+				       len - (STATBUF_LEN - stat_st)))
+				return -EFAULT;
 
 			stat_st = len - (STATBUF_LEN - stat_st);
 		}
 		else
 		{
-			copy_to_user(buf, statbuf + stat_st, len);
+			if(copy_to_user(buf, statbuf + stat_st, len))
+				return -EFAULT;
 
 			stat_st += len;
 			
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/isdn/sc/init.c linux-2.6.11-rc3-mm/drivers/isdn/sc/init.c
--- linux-2.6.11-rc3-mm-original/drivers/isdn/sc/init.c	2005-02-03 03:56:22.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/isdn/sc/init.c	2005-02-08 18:33:44.000000000 +0200
@@ -502,7 +502,7 @@ int identify_board(unsigned long rambase
 	 */
 	outb(PRI_BASEPG_VAL, pgport);
 	msleep_interruptible(1000);
-	sig = readl(rambase + SIG_OFFSET);
+	sig = readl((volatile void __iomem *)(rambase + SIG_OFFSET));
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)
 		return PRI_BOARD;
@@ -512,7 +512,7 @@ int identify_board(unsigned long rambase
 	 */
 	outb(BRI_BASEPG_VAL, pgport);
 	msleep_interruptible(1000);
-	sig = readl(rambase + SIG_OFFSET);
+	sig = readl((volatile void __iomem *)(rambase + SIG_OFFSET));
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)
 		return BRI_BOARD;
@@ -522,7 +522,7 @@ int identify_board(unsigned long rambase
 	/*
 	 * Try to spot a card
 	 */
-	sig = readl(rambase + SIG_OFFSET);
+	sig = readl((volatile void __iomem *)(rambase + SIG_OFFSET));
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig != SIGNATURE)
 		return -1;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/isdn/sc/shmem.c linux-2.6.11-rc3-mm/drivers/isdn/sc/shmem.c
--- linux-2.6.11-rc3-mm-original/drivers/isdn/sc/shmem.c	2005-02-03 03:55:35.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/isdn/sc/shmem.c	2005-02-08 17:49:56.000000000 +0200
@@ -56,8 +56,8 @@ void memcpy_toshmem(int card, void *dest
 
 	outb(((sc_adapter[card]->shmem_magic + ch * SRAM_PAGESIZE) >> 14) | 0x80,
 		sc_adapter[card]->ioport[sc_adapter[card]->shmem_pgport]);
-	memcpy_toio(sc_adapter[card]->rambase +
-		((unsigned long) dest % 0x4000), src, n);
+	memcpy_toio((volatile void __iomem *)(sc_adapter[card]->rambase +
+		((unsigned long) dest % 0x4000)), src, n);
 	spin_unlock_irqrestore(&sc_adapter[card]->lock, flags);
 	pr_debug("%s: set page to %#x\n",sc_adapter[card]->devicename,
 		((sc_adapter[card]->shmem_magic + ch * SRAM_PAGESIZE)>>14)|0x80);
@@ -135,8 +135,8 @@ void memset_shmem(int card, void *dest, 
 
 	outb(((sc_adapter[card]->shmem_magic + ch * SRAM_PAGESIZE) >> 14) | 0x80,
 		sc_adapter[card]->ioport[sc_adapter[card]->shmem_pgport]);
-	memset_io(sc_adapter[card]->rambase +
-		((unsigned long) dest % 0x4000), c, n);
+	memset_io((volatile void __iomem *)(sc_adapter[card]->rambase +
+		((unsigned long) dest % 0x4000)), c, n);
 	pr_debug("%s: set page to %#x\n",sc_adapter[card]->devicename,
 		((sc_adapter[card]->shmem_magic + ch * SRAM_PAGESIZE)>>14)|0x80);
 	spin_unlock_irqrestore(&sc_adapter[card]->lock, flags);
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/media/video/zoran_card.c linux-2.6.11-rc3-mm/drivers/media/video/zoran_card.c
--- linux-2.6.11-rc3-mm-original/drivers/media/video/zoran_card.c	2005-02-03 03:55:53.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/media/video/zoran_card.c	2005-02-07 15:30:42.000000000 +0200
@@ -145,12 +145,14 @@ MODULE_DESCRIPTION("Zoran-36057/36067 JP
 MODULE_AUTHOR("Serguei Miridonov");
 MODULE_LICENSE("GPL");
 
+#ifdef MODULE
 static struct pci_device_id zr36067_pci_tbl[] = {
 	{PCI_VENDOR_ID_ZORAN, PCI_DEVICE_ID_ZORAN_36057,
 	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
 	{0}
 };
 MODULE_DEVICE_TABLE(pci, zr36067_pci_tbl);
+#endif
 
 #define dprintk(num, format, args...) \
 	do { \
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/net/ibmlana.c linux-2.6.11-rc3-mm/drivers/net/ibmlana.c
--- linux-2.6.11-rc3-mm-original/drivers/net/ibmlana.c	2005-02-07 16:32:20.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/net/ibmlana.c	2005-02-08 18:09:49.000000000 +0200
@@ -901,7 +901,7 @@ static void ibmlana_set_multicast_list(s
 
 static int startslot;		/* counts through slots when probing multiple devices */
 
-static int ibmlana_probe(struct net_device *dev)
+static int __attribute__((__unused__)) ibmlana_probe(struct net_device *dev)
 {
 	int slot, z;
 	int base = 0, irq = 0, iobase = 0, memlen = 0;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/net/tulip/dmfe.c linux-2.6.11-rc3-mm/drivers/net/tulip/dmfe.c
--- linux-2.6.11-rc3-mm-original/drivers/net/tulip/dmfe.c	2005-02-03 03:56:48.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/net/tulip/dmfe.c	2005-02-08 18:08:53.000000000 +0200
@@ -1806,7 +1806,7 @@ static void dmfe_parse_srom(struct dmfe_
 	if ( ( (int) srom[18] & 0xff) == SROM_V41_CODE) {
 		/* SROM V4.01 */
 		/* Get NIC support media mode */
-		db->NIC_capability = le16_to_cpup(srom + 34);
+		db->NIC_capability = le16_to_cpup((const __le16 *)(srom + 34));
 		db->PHY_reg4 = 0;
 		for (tmp_reg = 1; tmp_reg < 0x10; tmp_reg <<= 1) {
 			switch( db->NIC_capability & tmp_reg ) {
@@ -1818,7 +1818,7 @@ static void dmfe_parse_srom(struct dmfe_
 		}
 
 		/* Media Mode Force or not check */
-		dmfe_mode = le32_to_cpup(srom + 34) & le32_to_cpup(srom + 36);
+		dmfe_mode = le32_to_cpup((const __le32 *)(srom + 34)) & le32_to_cpup((const __le32 *)(srom + 36));
 		switch(dmfe_mode) {
 		case 0x4: dmfe_media_mode = DMFE_100MHF; break;	/* 100MHF */
 		case 0x2: dmfe_media_mode = DMFE_10MFD; break;	/* 10MFD */
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/53c700.h linux-2.6.11-rc3-mm/drivers/scsi/53c700.h
--- linux-2.6.11-rc3-mm-original/drivers/scsi/53c700.h	2005-02-03 03:55:06.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/53c700.h	2005-02-08 17:50:52.000000000 +0200
@@ -461,13 +461,13 @@ NCR_700_mem_readb(struct Scsi_Host *host
 	const struct NCR_700_Host_Parameters *hostdata __attribute__((unused))
 		= (struct NCR_700_Host_Parameters *)host->hostdata[0];
 
-	return readb(host->base + (reg^bE));
+	return readb((volatile void __iomem *)(host->base + (reg^bE)));
 }
 
 static inline __u32
 NCR_700_mem_readl(struct Scsi_Host *host, __u32 reg)
 {
-	__u32 value = __raw_readl(host->base + reg);
+	__u32 value = __raw_readl((volatile void __iomem *)(host->base + reg));
 	const struct NCR_700_Host_Parameters *hostdata __attribute__((unused))
 		= (struct NCR_700_Host_Parameters *)host->hostdata[0];
 #if 1
@@ -485,7 +485,7 @@ NCR_700_mem_writeb(__u8 value, struct Sc
 	const struct NCR_700_Host_Parameters *hostdata __attribute__((unused))
 		= (struct NCR_700_Host_Parameters *)host->hostdata[0];
 
-	writeb(value, host->base + (reg^bE));
+	writeb(value, (volatile void __iomem *)(host->base + (reg^bE)));
 }
 
 static inline void
@@ -500,7 +500,7 @@ NCR_700_mem_writel(__u32 value, struct S
 		BUG();
 #endif
 
-	__raw_writel(bS_to_host(value), host->base + reg);
+	__raw_writel(bS_to_host(value), (volatile void __iomem *)(host->base + reg));
 }
 
 static inline __u8
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/aha1740.c linux-2.6.11-rc3-mm/drivers/scsi/aha1740.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/aha1740.c	2005-02-03 03:57:16.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/aha1740.c	2005-02-08 18:22:51.000000000 +0200
@@ -588,6 +588,7 @@ static Scsi_Host_Template aha1740_templa
 static int aha1740_probe (struct device *dev)
 {
 	int slotbase;
+	int err_retval = -ENODEV;
 	unsigned int irq_level, irq_type, translation;
 	struct Scsi_Host *shpnt;
 	struct aha1740_hostdata *host;
@@ -642,7 +643,10 @@ static int aha1740_probe (struct device 
 	}
 
 	eisa_set_drvdata (edev, shpnt);
-	scsi_add_host (shpnt, dev); /* XXX handle failure */
+	if (scsi_add_host (shpnt, dev)) {
+		err_retval = -EIO;
+		goto err_unmap; /* XXX handle failure */
+	}
 	scsi_scan_host (shpnt);
 	return 0;
 
@@ -654,7 +658,7 @@ static int aha1740_probe (struct device 
  err_release_region:
 	release_region(slotbase, SLOTSIZE);
 
-	return -ENODEV;
+	return err_retval;
 }
 
 static __devexit int aha1740_remove (struct device *dev)
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic79xx_osm.c linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic79xx_osm.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-03 03:55:53.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-07 15:49:09.000000000 +0200
@@ -2065,7 +2065,8 @@ ahd_linux_register_host(struct ahd_softc
 	ahd_unlock(ahd, &s);
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-	scsi_add_host(host, &ahd->dev_softc->dev); /* XXX handle failure */
+	if(scsi_add_host(host, &ahd->dev_softc->dev))
+		return (EIO); /* XXX handle failure */
 	scsi_scan_host(host);
 #endif
 	return (0);
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic7xxx_osm.c linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic7xxx_osm.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-03 03:55:07.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/aic7xxx/aic7xxx_osm.c	2005-02-07 15:54:42.000000000 +0200
@@ -1729,7 +1729,8 @@ ahc_linux_register_host(struct ahc_softc
 	ahc_unlock(ahc, &s);
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-	scsi_add_host(host, (ahc->dev_softc ? &ahc->dev_softc->dev : NULL)); /* XXX handle failure */
+	if(scsi_add_host(host, (ahc->dev_softc ? &ahc->dev_softc->dev : NULL)))
+		return (EIO); /* XXX handle failure */
 	scsi_scan_host(host);
 #endif
 	return (0);
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/BusLogic.c linux-2.6.11-rc3-mm/drivers/scsi/BusLogic.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/BusLogic.c	2005-02-03 03:57:17.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/BusLogic.c	2005-02-08 18:26:49.000000000 +0200
@@ -2174,6 +2174,7 @@ static int BusLogic_SlaveConfigure(struc
 static int __init BusLogic_init(void)
 {
 	int BusLogicHostAdapterCount = 0, DriverOptionsIndex = 0, ProbeIndex;
+	int retval = 0;
 	struct BusLogic_HostAdapter *PrototypeHostAdapter;
 
 #ifdef MODULE
@@ -2296,7 +2297,11 @@ static int __init BusLogic_init(void)
 				scsi_host_put(Host);
 			} else {
 				BusLogic_InitializeHostStructure(HostAdapter, Host);
-				scsi_add_host(Host, NULL);
+				if(scsi_add_host(Host, NULL)) {
+					printk(KERN_ERR "BusLogic: scsi_add_host failed\n");
+					retval = -EIO;
+					goto BusLogic_init_err_cleanup;
+				}
 				scsi_scan_host(Host);
 				BusLogicHostAdapterCount++;
 			}
@@ -2309,6 +2314,7 @@ static int __init BusLogic_init(void)
 			   the CCBs, Release the System Resources, and Unregister the SCSI
 			   Host.
 			 */
+BusLogic_init_err_cleanup:
 			BusLogic_DestroyCCBs(HostAdapter);
 			BusLogic_ReleaseResources(HostAdapter);
 			list_del(&HostAdapter->host_list);
@@ -2318,7 +2324,7 @@ static int __init BusLogic_init(void)
 	kfree(PrototypeHostAdapter);
 	kfree(BusLogic_ProbeInfoList);
 	BusLogic_ProbeInfoList = NULL;
-	return 0;
+	return retval;
 }
 
 
@@ -2945,7 +2951,8 @@ static int BusLogic_QueueCommand(struct 
 	return 0;
 }
 
-
+#define NO_BUSLOGIC_ABORT_COMMAND
+#ifndef NO_BUSLOGIC_ABORT_COMMAND
 /*
   BusLogic_AbortCommand aborts Command if possible.
 */
@@ -3022,6 +3029,7 @@ static int BusLogic_AbortCommand(struct 
 	}
 	return SUCCESS;
 }
+#endif
 
 /*
   BusLogic_ResetHostAdapter resets Host Adapter if possible, marking all
@@ -3529,7 +3537,7 @@ static struct scsi_host_template Bus_Log
 	.slave_configure = BusLogic_SlaveConfigure,
 	.bios_param = BusLogic_BIOSDiskParameters,
 	.eh_host_reset_handler = BusLogic_host_reset,
-#if 0
+#ifndef NO_BUSLOGIC_ABORT_COMMAND
 	.eh_abort_handler = BusLogic_AbortCommand,
 #endif
 	.unchecked_isa_dma = 1,
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/dpt_i2o.c linux-2.6.11-rc3-mm/drivers/scsi/dpt_i2o.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/dpt_i2o.c	2005-02-03 03:56:33.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/dpt_i2o.c	2005-02-08 18:40:14.000000000 +0200
@@ -168,12 +168,14 @@ static u8 adpt_read_blink_led(adpt_hba* 
  *============================================================================
  */
 
+#ifdef MODULE
 static struct pci_device_id dptids[] = {
 	{ PCI_DPT_VENDOR_ID, PCI_DPT_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
 	{ PCI_DPT_VENDOR_ID, PCI_DPT_RAPTOR_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci,dptids);
+#endif
 
 static int adpt_detect(struct scsi_host_template* sht)
 {
@@ -2027,8 +2029,8 @@ static irqreturn_t adpt_isr(int irq, voi
 		}
 		reply = (ulong)bus_to_virt(m);
 
-		if (readl(reply) & MSG_FAIL) {
-			u32 old_m = readl(reply+28); 
+		if (readl((volatile void __iomem *)reply) & MSG_FAIL) {
+			u32 old_m = readl((volatile void __iomem *)(reply+28)); 
 			ulong msg;
 			u32 old_context;
 			PDEBUG("%s: Failed message\n",pHba->name);
@@ -2039,34 +2041,34 @@ static irqreturn_t adpt_isr(int irq, voi
 			}
 			// Transaction context is 0 in failed reply frame
 			msg = (ulong)(pHba->msg_addr_virt + old_m);
-			old_context = readl(msg+12);
-			writel(old_context, reply+12);
+			old_context = readl((volatile void __iomem *)(msg+12));
+			writel(old_context, (volatile void __iomem *)(reply+12));
 			adpt_send_nop(pHba, old_m);
 		} 
-		context = readl(reply+8);
+		context = readl((volatile void __iomem *)(reply+8));
 		if(context & 0x40000000){ // IOCTL
-			ulong p = (ulong)(readl(reply+12));
+			ulong p = (ulong)(readl((volatile void __iomem *)(reply+12)));
 			if( p != 0) {
 				memcpy((void*)p, (void*)reply, REPLY_FRAME_SIZE * 4);
 			}
 			// All IOCTLs will also be post wait
 		}
 		if(context & 0x80000000){ // Post wait message
-			status = readl(reply+16);
+			status = readl((volatile void __iomem *)(reply+16));
 			if(status  >> 24){
 				status &=  0xffff; /* Get detail status */
 			} else {
 				status = I2O_POST_WAIT_OK;
 			}
 			if(!(context & 0x40000000)) {
-				cmd = (struct scsi_cmnd*) readl(reply+12); 
+				cmd = (struct scsi_cmnd*) readl((volatile void __iomem *)(reply+12)); 
 				if(cmd != NULL) {
 					printk(KERN_WARNING"%s: Apparent SCSI cmd in Post Wait Context - cmd=%p context=%x\n", pHba->name, cmd, context);
 				}
 			}
 			adpt_i2o_post_wait_complete(context, status);
 		} else { // SCSI message
-			cmd = (struct scsi_cmnd*) readl(reply+12); 
+			cmd = (struct scsi_cmnd*) readl((volatile void __iomem *)(reply+12)); 
 			if(cmd != NULL){
 				if(cmd->serial_number != 0) { // If not timedout
 					adpt_i2o_to_scsi(reply, cmd);
@@ -2236,16 +2238,16 @@ static s32 adpt_i2o_to_scsi(ulong reply,
 	adpt_hba* pHba;
 	u32 hba_status;
 	u32 dev_status;
-	u32 reply_flags = readl(reply) & 0xff00; // Leave it shifted up 8 bits 
+	u32 reply_flags = readl((volatile void __iomem *)reply) & 0xff00; // Leave it shifted up 8 bits 
 	// I know this would look cleaner if I just read bytes
 	// but the model I have been using for all the rest of the
 	// io is in 4 byte words - so I keep that model
-	u16 detailed_status = readl(reply+16) &0xffff;
+	u16 detailed_status = readl((volatile void __iomem *)(reply+16)) &0xffff;
 	dev_status = (detailed_status & 0xff);
 	hba_status = detailed_status >> 8;
 
 	// calculate resid for sg 
-	cmd->resid = cmd->request_bufflen - readl(reply+5);
+	cmd->resid = cmd->request_bufflen - readl((volatile void __iomem *)(reply+5));
 
 	pHba = (adpt_hba*) cmd->device->host->hostdata[0];
 
@@ -2256,7 +2258,7 @@ static s32 adpt_i2o_to_scsi(ulong reply,
 		case I2O_SCSI_DSC_SUCCESS:
 			cmd->result = (DID_OK << 16);
 			// handle underflow
-			if(readl(reply+5) < cmd->underflow ) {
+			if(readl((volatile void __iomem *)(reply+5)) < cmd->underflow ) {
 				cmd->result = (DID_ERROR <<16);
 				printk(KERN_WARNING"%s: SCSI CMD underflow\n",pHba->name);
 			}
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/dtc.c linux-2.6.11-rc3-mm/drivers/scsi/dtc.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/dtc.c	2005-02-03 03:56:22.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/dtc.c	2005-02-08 15:30:47.000000000 +0200
@@ -183,7 +183,7 @@ static const struct signature {
  *
 */
 
-static void __init dtc_setup(char *str, int *ints)
+static void __init __attribute__((__unused__)) dtc_setup(char *str, int *ints)
 {
 	static int commandline_current = 0;
 	int i;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/g_NCR5380.c linux-2.6.11-rc3-mm/drivers/scsi/g_NCR5380.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/g_NCR5380.c	2005-02-03 03:55:15.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/g_NCR5380.c	2005-02-08 15:21:29.000000000 +0200
@@ -867,11 +867,12 @@ static int generic_NCR5380_proc_info(str
 	status = NCR5380_read(STATUS_REG);
 	if (!(status & SR_REQ))
 		PRINTP("REQ not asserted, phase unknown.\n");
+#ifdef NDEBUG
 	else {
 		for (i = 0; (phases[i].value != PHASE_UNKNOWN) && (phases[i].value != (status & PHASE_MASK)); ++i);
 		PRINTP("Phase %s\n" ANDP phases[i].name);
 	}
-
+#endif
 	if (!hostdata->connected) {
 		PRINTP("No currently connected command\n");
 	} else {
@@ -930,6 +931,7 @@ module_param(dtc_3181e, int, 0);
 MODULE_LICENSE("GPL");
 
 
+#ifdef MODULE
 static struct isapnp_device_id id_table[] __devinitdata = {
 	{
 	 ISAPNP_ANY_ID, ISAPNP_ANY_ID,
@@ -939,6 +941,7 @@ static struct isapnp_device_id id_table[
 };
 
 MODULE_DEVICE_TABLE(isapnp, id_table);
+#endif /* MODULE */
 
 
 __setup("ncr5380=", do_NCR5380_setup);
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/ips.c linux-2.6.11-rc3-mm/drivers/scsi/ips.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/ips.c	2005-02-07 16:32:21.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/ips.c	2005-02-08 18:33:57.000000000 +0200
@@ -7042,8 +7042,13 @@ ips_register_scsi(int index)
 	sh->max_lun = ha->nlun;
 	sh->max_channel = ha->nbus - 1;
 	sh->can_queue = ha->max_cmds - 1;
-
-	IPS_ADD_HOST(sh, NULL);
+	/* can't use IPS_ADD_HOST macro because it ignores return value from scsi_add_host, removed from ips.h */
+	if(scsi_add_host(sh, NULL)) {
+		free_irq(ha->irq, ha);
+		scsi_host_put(sh);
+		return -1;
+	}
+	scsi_scan_host(sh);
 	return 0;
 }
 
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/ips.h linux-2.6.11-rc3-mm/drivers/scsi/ips.h
--- linux-2.6.11-rc3-mm-original/drivers/scsi/ips.h	2005-02-07 16:32:21.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/ips.h	2005-02-08 18:33:18.000000000 +0200
@@ -98,7 +98,6 @@
       #define IRQ_RETVAL(x)
       #define IPS_REGISTER_HOSTS(SHT)      scsi_register_module(MODULE_SCSI_HA,SHT)
       #define IPS_UNREGISTER_HOSTS(SHT)    scsi_unregister_module(MODULE_SCSI_HA,SHT)
-      #define IPS_ADD_HOST(shost,device)
       #define IPS_REMOVE_HOST(shost)
       #define IPS_SCSI_SET_DEVICE(sh,ha)   scsi_set_pci_device(sh, (ha)->pcidev)
       #define IPS_PRINTK(level, pcidev, format, arg...)                 \
@@ -109,7 +108,6 @@
    #else
       #define IPS_REGISTER_HOSTS(SHT)      (!ips_detect(SHT))
       #define IPS_UNREGISTER_HOSTS(SHT)
-      #define IPS_ADD_HOST(shost,device)   do { scsi_add_host(shost,device); scsi_scan_host(shost); } while (0)
       #define IPS_REMOVE_HOST(shost)       scsi_remove_host(shost)
       #define IPS_SCSI_SET_DEVICE(sh,ha)   scsi_set_device(sh, &(ha)->pcidev->dev)
       #define IPS_PRINTK(level, pcidev, format, arg...)                 \
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/NCR5380.c linux-2.6.11-rc3-mm/drivers/scsi/NCR5380.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/NCR5380.c	2005-02-03 03:55:23.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/NCR5380.c	2005-02-08 15:38:23.000000000 +0200
@@ -345,6 +345,7 @@ static int NCR5380_poll_politely(struct 
 	return -ETIMEDOUT;
 }
 
+#ifdef NDEBUG
 static struct {
 	unsigned char value;
 	const char *name;
@@ -358,7 +359,6 @@ static struct {
 	{PHASE_UNKNOWN, "UNKNOWN"}
 };
 
-#ifdef NDEBUG
 static struct {
 	unsigned char mask;
 	const char *name;
@@ -567,7 +567,7 @@ static irqreturn_t __init probe_intr(int
  *	Locks: none, irqs must be enabled on entry
  */
 
-static int __init NCR5380_probe_irq(struct Scsi_Host *instance, int possible)
+static int __init __attribute__((__unused__)) NCR5380_probe_irq(struct Scsi_Host *instance, int possible)
 {
 	NCR5380_local_declare();
 	struct NCR5380_hostdata *hostdata = (struct NCR5380_hostdata *) instance->hostdata;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/NCR5380.h linux-2.6.11-rc3-mm/drivers/scsi/NCR5380.h
--- linux-2.6.11-rc3-mm-original/drivers/scsi/NCR5380.h	2005-02-03 03:55:53.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/NCR5380.h	2005-02-08 15:38:21.000000000 +0200
@@ -299,7 +299,7 @@ static void NCR5380_information_transfer
 static irqreturn_t NCR5380_intr(int irq, void *dev_id, struct pt_regs *regs);
 #endif
 static void NCR5380_main(void *ptr);
-static void NCR5380_print_options(struct Scsi_Host *instance);
+static void __attribute__((__unused__)) NCR5380_print_options(struct Scsi_Host *instance);
 #ifdef NDEBUG
 static void NCR5380_print_phase(struct Scsi_Host *instance);
 static void NCR5380_print(struct Scsi_Host *instance);
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/NCR_Q720.c linux-2.6.11-rc3-mm/drivers/scsi/NCR_Q720.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/NCR_Q720.c	2005-02-03 03:55:08.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/NCR_Q720.c	2005-02-07 15:45:27.000000000 +0200
@@ -225,7 +225,7 @@ NCR_Q720_probe(struct device *dev)
 
 	/* The first 1k of the memory buffer is a memory map of the registers
 	 */
-	mem_base = (__u32)dma_mark_declared_memory_occupied(dev, base_addr,
+	mem_base = (void __iomem *)(__u32)dma_mark_declared_memory_occupied(dev, base_addr,
 							    1024);
 	if (IS_ERR(mem_base)) {
 		printk("NCR_Q720 failed to reserve memory mapped region\n");
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/nsp32.c linux-2.6.11-rc3-mm/drivers/scsi/nsp32.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/nsp32.c	2005-02-03 03:55:36.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/nsp32.c	2005-02-07 21:33:50.000000000 +0200
@@ -2888,7 +2888,8 @@ static int nsp32_detect(Scsi_Host_Templa
         }
 
 #if (LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
-	scsi_add_host (host, &PCIDEV->dev);
+	if(scsi_add_host (host, &PCIDEV->dev))
+		goto free_irq;
 	scsi_scan_host(host);
 #endif
 	pci_set_drvdata(PCIDEV, host);
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/sata_svw.c linux-2.6.11-rc3-mm/drivers/scsi/sata_svw.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/sata_svw.c	2005-02-07 16:32:21.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/sata_svw.c	2005-02-07 21:32:01.000000000 +0200
@@ -103,26 +103,26 @@ static void k2_sata_tf_load(struct ata_p
 	unsigned int is_addr = tf->flags & ATA_TFLAG_ISADDR;
 
 	if (tf->ctl != ap->last_ctl) {
-		writeb(tf->ctl, ioaddr->ctl_addr);
+		writeb(tf->ctl, (volatile void __iomem *)ioaddr->ctl_addr);
 		ap->last_ctl = tf->ctl;
 		ata_wait_idle(ap);
 	}
 	if (is_addr && (tf->flags & ATA_TFLAG_LBA48)) {
-		writew(tf->feature | (((u16)tf->hob_feature) << 8), ioaddr->feature_addr);
-		writew(tf->nsect | (((u16)tf->hob_nsect) << 8), ioaddr->nsect_addr);
-		writew(tf->lbal | (((u16)tf->hob_lbal) << 8), ioaddr->lbal_addr);
-		writew(tf->lbam | (((u16)tf->hob_lbam) << 8), ioaddr->lbam_addr);
-		writew(tf->lbah | (((u16)tf->hob_lbah) << 8), ioaddr->lbah_addr);
+		writew(tf->feature | (((u16)tf->hob_feature) << 8), (volatile void __iomem *)ioaddr->feature_addr);
+		writew(tf->nsect | (((u16)tf->hob_nsect) << 8), (volatile void __iomem *)ioaddr->nsect_addr);
+		writew(tf->lbal | (((u16)tf->hob_lbal) << 8), (volatile void __iomem *)ioaddr->lbal_addr);
+		writew(tf->lbam | (((u16)tf->hob_lbam) << 8), (volatile void __iomem *)ioaddr->lbam_addr);
+		writew(tf->lbah | (((u16)tf->hob_lbah) << 8), (volatile void __iomem *)ioaddr->lbah_addr);
 	} else if (is_addr) {
-		writew(tf->feature, ioaddr->feature_addr);
-		writew(tf->nsect, ioaddr->nsect_addr);
-		writew(tf->lbal, ioaddr->lbal_addr);
-		writew(tf->lbam, ioaddr->lbam_addr);
-		writew(tf->lbah, ioaddr->lbah_addr);
+		writew(tf->feature, (volatile void __iomem *)ioaddr->feature_addr);
+		writew(tf->nsect, (volatile void __iomem *)ioaddr->nsect_addr);
+		writew(tf->lbal, (volatile void __iomem *)ioaddr->lbal_addr);
+		writew(tf->lbam, (volatile void __iomem *)ioaddr->lbam_addr);
+		writew(tf->lbah, (volatile void __iomem *)ioaddr->lbah_addr);
 	}
 
 	if (tf->flags & ATA_TFLAG_DEVICE)
-		writeb(tf->device, ioaddr->device_addr);
+		writeb(tf->device, (volatile void __iomem *)ioaddr->device_addr);
 
 	ata_wait_idle(ap);
 }
@@ -133,14 +133,14 @@ static void k2_sata_tf_read(struct ata_p
 	struct ata_ioports *ioaddr = &ap->ioaddr;
 	u16 nsect, lbal, lbam, lbah;
 
-	nsect = tf->nsect = readw(ioaddr->nsect_addr);
-	lbal = tf->lbal = readw(ioaddr->lbal_addr);
-	lbam = tf->lbam = readw(ioaddr->lbam_addr);
-	lbah = tf->lbah = readw(ioaddr->lbah_addr);
-	tf->device = readw(ioaddr->device_addr);
+	nsect = tf->nsect = readw((volatile void __iomem *)ioaddr->nsect_addr);
+	lbal = tf->lbal = readw((volatile void __iomem *)ioaddr->lbal_addr);
+	lbam = tf->lbam = readw((volatile void __iomem *)ioaddr->lbam_addr);
+	lbah = tf->lbah = readw((volatile void __iomem *)ioaddr->lbah_addr);
+	tf->device = readw((volatile void __iomem *)ioaddr->device_addr);
 
 	if (tf->flags & ATA_TFLAG_LBA48) {
-		tf->hob_feature = readw(ioaddr->error_addr) >> 8;
+		tf->hob_feature = readw((volatile void __iomem *)ioaddr->error_addr) >> 8;
 		tf->hob_nsect = nsect >> 8;
 		tf->hob_lbal = lbal >> 8;
 		tf->hob_lbam = lbam >> 8;
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/sata_vsc.c linux-2.6.11-rc3-mm/drivers/scsi/sata_vsc.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/sata_vsc.c	2005-02-07 16:32:21.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/sata_vsc.c	2005-02-08 15:32:06.000000000 +0200
@@ -80,11 +80,11 @@ static void vsc_sata_scr_write (struct a
 
 static void vsc_intr_mask_update(struct ata_port *ap, u8 ctl)
 {
-	unsigned long mask_addr;
+	volatile void __iomem *mask_addr;
 	u8 mask;
 
-	mask_addr = (unsigned long) ap->host_set->mmio_base +
-		VSC_SATA_INT_MASK_OFFSET + ap->port_no;
+	mask_addr = (volatile void __iomem *)((unsigned long) ap->host_set->mmio_base +
+		VSC_SATA_INT_MASK_OFFSET + ap->port_no);
 	mask = readb(mask_addr);
 	if (ctl & ATA_NIEN)
 		mask |= 0x80;
@@ -109,21 +109,21 @@ static void vsc_sata_tf_load(struct ata_
 		vsc_intr_mask_update(ap, tf->ctl & ATA_NIEN);
 	}
 	if (is_addr && (tf->flags & ATA_TFLAG_LBA48)) {
-		writew(tf->feature | (((u16)tf->hob_feature) << 8), ioaddr->feature_addr);
-		writew(tf->nsect | (((u16)tf->hob_nsect) << 8), ioaddr->nsect_addr);
-		writew(tf->lbal | (((u16)tf->hob_lbal) << 8), ioaddr->lbal_addr);
-		writew(tf->lbam | (((u16)tf->hob_lbam) << 8), ioaddr->lbam_addr);
-		writew(tf->lbah | (((u16)tf->hob_lbah) << 8), ioaddr->lbah_addr);
+		writew(tf->feature | (((u16)tf->hob_feature) << 8), (volatile void __iomem *)ioaddr->feature_addr);
+		writew(tf->nsect | (((u16)tf->hob_nsect) << 8), (volatile void __iomem *)ioaddr->nsect_addr);
+		writew(tf->lbal | (((u16)tf->hob_lbal) << 8), (volatile void __iomem *)ioaddr->lbal_addr);
+		writew(tf->lbam | (((u16)tf->hob_lbam) << 8), (volatile void __iomem *)ioaddr->lbam_addr);
+		writew(tf->lbah | (((u16)tf->hob_lbah) << 8), (volatile void __iomem *)ioaddr->lbah_addr);
 	} else if (is_addr) {
-		writew(tf->feature, ioaddr->feature_addr);
-		writew(tf->nsect, ioaddr->nsect_addr);
-		writew(tf->lbal, ioaddr->lbal_addr);
-		writew(tf->lbam, ioaddr->lbam_addr);
-		writew(tf->lbah, ioaddr->lbah_addr);
+		writew(tf->feature, (volatile void __iomem *)ioaddr->feature_addr);
+		writew(tf->nsect, (volatile void __iomem *)ioaddr->nsect_addr);
+		writew(tf->lbal, (volatile void __iomem *)ioaddr->lbal_addr);
+		writew(tf->lbam, (volatile void __iomem *)ioaddr->lbam_addr);
+		writew(tf->lbah, (volatile void __iomem *)ioaddr->lbah_addr);
 	}
 
 	if (tf->flags & ATA_TFLAG_DEVICE)
-		writeb(tf->device, ioaddr->device_addr);
+		writeb(tf->device, (volatile void __iomem *)ioaddr->device_addr);
 
 	ata_wait_idle(ap);
 }
@@ -134,14 +134,14 @@ static void vsc_sata_tf_read(struct ata_
 	struct ata_ioports *ioaddr = &ap->ioaddr;
 	u16 nsect, lbal, lbam, lbah;
 
-	nsect = tf->nsect = readw(ioaddr->nsect_addr);
-	lbal = tf->lbal = readw(ioaddr->lbal_addr);
-	lbam = tf->lbam = readw(ioaddr->lbam_addr);
-	lbah = tf->lbah = readw(ioaddr->lbah_addr);
-	tf->device = readw(ioaddr->device_addr);
+	nsect = tf->nsect = readw((volatile void __iomem *)ioaddr->nsect_addr);
+	lbal = tf->lbal = readw((volatile void __iomem *)ioaddr->lbal_addr);
+	lbam = tf->lbam = readw((volatile void __iomem *)ioaddr->lbam_addr);
+	lbah = tf->lbah = readw((volatile void __iomem *)ioaddr->lbah_addr);
+	tf->device = readw((volatile void __iomem *)ioaddr->device_addr);
 
 	if (tf->flags & ATA_TFLAG_LBA48) {
-		tf->hob_feature = readb(ioaddr->error_addr);
+		tf->hob_feature = readb((volatile void __iomem *)ioaddr->error_addr);
 		tf->hob_nsect = nsect >> 8;
 		tf->hob_lbal = lbal >> 8;
 		tf->hob_lbam = lbam >> 8;
@@ -246,8 +246,8 @@ static void __devinit vsc_sata_setup_por
 	port->ctl_addr		= base + VSC_SATA_TF_CTL_OFFSET;
 	port->bmdma_addr	= base + VSC_SATA_DMA_CMD_OFFSET;
 	port->scr_addr		= base + VSC_SATA_SCR_STATUS_OFFSET;
-	writel(0, base + VSC_SATA_UP_DESCRIPTOR_OFFSET);
-	writel(0, base + VSC_SATA_UP_DATA_BUFFER_OFFSET);
+	writel(0, (volatile void __iomem *)(base + VSC_SATA_UP_DESCRIPTOR_OFFSET));
+	writel(0, (volatile void __iomem *)(base + VSC_SATA_UP_DATA_BUFFER_OFFSET));
 }
 
 
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/scsi/sym53c8xx_2/sym_glue.c linux-2.6.11-rc3-mm/drivers/scsi/sym53c8xx_2/sym_glue.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/sym53c8xx_2/sym_glue.c	2005-02-03 03:57:04.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/sym53c8xx_2/sym_glue.c	2005-02-07 15:55:40.000000000 +0200
@@ -1817,7 +1817,9 @@ static int __devinit sym_check_supported
 	struct pci_dev *pdev = device->pdev;
 	u_char revision;
 	unsigned long io_port = device->s.io_port;
+#ifndef SYM_CONF_IOMAPPED
 	unsigned long base = device->s.base;
+#endif
 	int i;
 
 	/*
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/telephony/ixj.h linux-2.6.11-rc3-mm/drivers/telephony/ixj.h
--- linux-2.6.11-rc3-mm-original/drivers/telephony/ixj.h	2005-02-03 03:57:04.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/telephony/ixj.h	2005-02-08 15:32:32.000000000 +0200
@@ -38,7 +38,7 @@
  * TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
  *
  *****************************************************************************/
-static char ixj_h_rcsid[] = "$Id: ixj.h,v 4.1 2001/08/04 14:49:27 craigs Exp $";
+static char __attribute__((__unused__)) ixj_h_rcsid[] = "$Id: ixj.h,v 4.1 2001/08/04 14:49:27 craigs Exp $";
 
 #define IXJ_VERSION 3031
 
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/usb/class/usb-midi.h linux-2.6.11-rc3-mm/drivers/usb/class/usb-midi.h
--- linux-2.6.11-rc3-mm-original/drivers/usb/class/usb-midi.h	2005-02-03 03:56:10.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/usb/class/usb-midi.h	2005-02-07 21:19:25.000000000 +0200
@@ -139,6 +139,7 @@ static struct usb_midi_device usb_midi_d
 
 #define VENDOR_SPECIFIC_USB_MIDI_DEVICES (sizeof(usb_midi_devices)/sizeof(struct usb_midi_device))
 
+#ifdef MODULE
 /* for Hot-Plugging */
 
 static struct usb_device_id usb_midi_ids [] = {
@@ -157,6 +158,7 @@ static struct usb_device_id usb_midi_ids
 };
 
 MODULE_DEVICE_TABLE (usb, usb_midi_ids);
+#endif /* MODULE */
 
 /* ------------------------------------------------------------------------- */
 #endif /* _USB_MIDI_H_ */
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/usb/image/microtek.c linux-2.6.11-rc3-mm/drivers/usb/image/microtek.c
--- linux-2.6.11-rc3-mm-original/drivers/usb/image/microtek.c	2005-02-03 03:57:04.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/usb/image/microtek.c	2005-02-07 21:18:47.000000000 +0200
@@ -809,7 +809,11 @@ static int mts_usb_probe(struct usb_inte
 		goto out_free_urb;
 
 	new_desc->host->hostdata[0] = (unsigned long)new_desc;
-	scsi_add_host(new_desc->host, NULL); /* XXX handle failure */
+	if(scsi_add_host(new_desc->host, NULL)) { /* XXX handle failure */
+		usb_free_urb(new_desc->urb);
+		kfree(new_desc);
+		return -EIO;
+	}
 	scsi_scan_host(new_desc->host);
 
 	usb_set_intfdata(intf, new_desc);
diff -Nurdp linux-2.6.11-rc3-mm-original/drivers/video/kyro/fbdev.c linux-2.6.11-rc3-mm/drivers/video/kyro/fbdev.c
--- linux-2.6.11-rc3-mm-original/drivers/video/kyro/fbdev.c	2005-02-07 16:32:21.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/video/kyro/fbdev.c	2005-02-08 18:40:40.000000000 +0200
@@ -596,7 +596,10 @@ static int kyrofb_ioctl(struct inode *in
 
 	switch (cmd) {
 	case KYRO_IOCTL_OVERLAY_CREATE:
-		copy_from_user(&ol_create, argp, sizeof(overlay_create));
+		if (copy_from_user(&ol_create, argp, sizeof(overlay_create))) {
+			printk(KERN_ERR "copy_from_user failed!\n");
+			return -EFAULT;
+		}
 
 		if (kyro_dev_overlay_create(ol_create.ulWidth,
 					    ol_create.ulHeight, 0) < 0) {
@@ -606,8 +609,11 @@ static int kyrofb_ioctl(struct inode *in
 		}
 		break;
 	case KYRO_IOCTL_OVERLAY_VIEWPORT_SET:
-		copy_from_user(&ol_viewport_set, argp,
-			       sizeof(overlay_viewport_set));
+		if (copy_from_user(&ol_viewport_set, argp,
+			       sizeof(overlay_viewport_set))) {
+			printk(KERN_ERR "copy_from_user failed!\n");
+			return -EFAULT;
+		}
 
 		if (kyro_dev_overlay_viewport_set(ol_viewport_set.xOrgin,
 						  ol_viewport_set.yOrgin,
@@ -627,13 +633,22 @@ static int kyrofb_ioctl(struct inode *in
 		}
 		break;
 	case KYRO_IOCTL_UVSTRIDE:
-		copy_to_user(argp, &deviceInfo.ulOverlayUVStride, sizeof(unsigned long));
+		if (copy_to_user(argp, &deviceInfo.ulOverlayUVStride, sizeof(unsigned long))) {
+			printk(KERN_ERR "copy_to_user failed!\n");
+			return -EFAULT;
+		}
 		break;
 	case KYRO_IOCTL_STRIDE:
-		copy_to_user(argp, &deviceInfo.ulOverlayStride, sizeof(unsigned long));
+		if (copy_to_user(argp, &deviceInfo.ulOverlayStride, sizeof(unsigned long))) {
+			printk(KERN_ERR "copy_to_user failed!\n");
+			return -EFAULT;
+		}
 		break;
 	case KYRO_IOCTL_OVERLAY_OFFSET:
-		copy_to_user(argp, &deviceInfo.ulOverlayOffset, sizeof(unsigned long));
+		if (copy_to_user(argp, &deviceInfo.ulOverlayOffset, sizeof(unsigned long))) {
+			printk(KERN_ERR "copy_to_user failed!\n");
+			return -EFAULT;
+		}
 		break;
 	}
 
diff -Nurdp linux-2.6.11-rc3-mm-original/include/linux/autoconf.h linux-2.6.11-rc3-mm/include/linux/autoconf.h
--- linux-2.6.11-rc3-mm-original/include/linux/autoconf.h	2005-02-07 16:34:23.000000000 +0200
+++ linux-2.6.11-rc3-mm/include/linux/autoconf.h	2005-02-08 18:47:46.954507280 +0200
@@ -1,7 +1,7 @@
 /*
  * Automatically generated C config: don't edit
  * Linux kernel version: 2.6.11-rc3-mm1
- * Mon Feb  7 16:34:23 2005
+ * Tue Feb  8 18:47:46 2005
  */
 #define AUTOCONF_INCLUDED
 #define CONFIG_X86 1
diff -Nurdp linux-2.6.11-rc3-mm-original/include/linux/ixjuser.h linux-2.6.11-rc3-mm/include/linux/ixjuser.h
--- linux-2.6.11-rc3-mm-original/include/linux/ixjuser.h	2005-02-03 03:57:05.000000000 +0200
+++ linux-2.6.11-rc3-mm/include/linux/ixjuser.h	2005-02-08 15:32:55.000000000 +0200
@@ -42,7 +42,7 @@
  *
  *****************************************************************************/
 
-static char ixjuser_h_rcsid[] = "$Id: ixjuser.h,v 4.1 2001/08/05 00:17:37 craigs Exp $";
+static char  __attribute__((__unused__)) ixjuser_h_rcsid[] = "$Id: ixjuser.h,v 4.1 2001/08/05 00:17:37 craigs Exp $";
 
 #include <linux/telephony.h>
 
diff -Nurdp linux-2.6.11-rc3-mm-original/kernel/module.c linux-2.6.11-rc3-mm/kernel/module.c
--- linux-2.6.11-rc3-mm-original/kernel/module.c	2005-02-07 16:32:23.000000000 +0200
+++ linux-2.6.11-rc3-mm/kernel/module.c	2005-02-08 16:59:11.000000000 +0200
@@ -1402,7 +1402,10 @@ static void who_is_doing_it(void)
 	char args[512];
 	unsigned int i, len = current->mm->arg_end - current->mm->arg_start;
 
-	copy_from_user(args, (void *)current->mm->arg_start, len);
+	if(copy_from_user(args, (void *)current->mm->arg_start, len)) {
+		printk(KERN_ERR "%s: copy_from_user failed!\n",__FUNCTION__);
+		return;
+	}
 
 	for (i = 0; i < len; i++) {
 		if (args[i] == '\0')
diff -Nurdp linux-2.6.11-rc3-mm-original/kernel/power/swsusp.c linux-2.6.11-rc3-mm/kernel/power/swsusp.c
--- linux-2.6.11-rc3-mm-original/kernel/power/swsusp.c	2005-02-07 16:32:23.000000000 +0200
+++ linux-2.6.11-rc3-mm/kernel/power/swsusp.c	2005-02-07 12:42:09.000000000 +0200
@@ -605,7 +605,20 @@ static int calc_nr(int nr_copy)
 	return nr_copy;
 }
 
-static inline void free_pagedir(struct pbe *pblist);
+/**
+ *	free_pagedir - free pages allocated with alloc_pagedir()
+ */
+
+static inline void free_pagedir(struct pbe *pblist)
+{
+	struct pbe *pbe;
+
+	while (pblist) {
+		pbe = pblist + PB_PAGE_SKIP;
+		pblist = pbe->next;
+		free_page((unsigned long)pblist);
+	}
+}
 
 /**
  *	alloc_pagedir - Allocate the page directory.
@@ -651,21 +664,6 @@ static struct pbe * alloc_pagedir(unsign
 }
 
 /**
- *	free_pagedir - free pages allocated with alloc_pagedir()
- */
-
-static inline void free_pagedir(struct pbe *pblist)
-{
-	struct pbe *pbe;
-
-	while (pblist) {
-		pbe = pblist + PB_PAGE_SKIP;
-		pblist = pbe->next;
-		free_page((unsigned long)pblist);
-	}
-}
-
-/**
  *	free_image_pages - Free pages allocated for snapshot
  */
 
diff -Nurdp linux-2.6.11-rc3-mm-original/net/ipv6/ip6_flowlabel.c linux-2.6.11-rc3-mm/net/ipv6/ip6_flowlabel.c
--- linux-2.6.11-rc3-mm-original/net/ipv6/ip6_flowlabel.c	2005-02-03 03:55:22.000000000 +0200
+++ linux-2.6.11-rc3-mm/net/ipv6/ip6_flowlabel.c	2005-02-08 15:51:16.000000000 +0200
@@ -537,9 +537,13 @@ release:
 			goto done;
 
 		/* Do not check for fault */
-		if (!freq.flr_label)
-			copy_to_user(&((struct in6_flowlabel_req __user *) optval)->flr_label,
-				     &fl->label, sizeof(fl->label));
+		if (!freq.flr_label) {
+			if(copy_to_user(&((struct in6_flowlabel_req __user *) optval)->flr_label,
+				     &fl->label, sizeof(fl->label))) {
+				err = -EFAULT;
+				goto done;
+			}
+		}
 
 		sfl1->fl = fl;
 		sfl1->next = np->ipv6_fl_list;
diff -Nurdp linux-2.6.11-rc3-mm-original/sound/oss/ad1848.c linux-2.6.11-rc3-mm/sound/oss/ad1848.c
--- linux-2.6.11-rc3-mm-original/sound/oss/ad1848.c	2005-02-03 03:56:10.000000000 +0200
+++ linux-2.6.11-rc3-mm/sound/oss/ad1848.c	2005-02-07 21:16:11.000000000 +0200
@@ -2955,6 +2955,7 @@ static struct {
 	{NULL}
 };
 
+#ifdef MODULE
 static struct isapnp_device_id id_table[] __devinitdata = {
 	{	ISAPNP_VENDOR('C','M','I'), ISAPNP_DEVICE(0x0001),
 		ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001), 0 },
@@ -2972,6 +2973,7 @@ static struct isapnp_device_id id_table[
 };
 
 MODULE_DEVICE_TABLE(isapnp, id_table);
+#endif /* MODULE */
 
 static struct pnp_dev *activate_dev(char *devname, char *resname, struct pnp_dev *dev)
 {
diff -Nurdp linux-2.6.11-rc3-mm-original/sound/oss/emu10k1/cardwi.c linux-2.6.11-rc3-mm/sound/oss/emu10k1/cardwi.c
--- linux-2.6.11-rc3-mm-original/sound/oss/emu10k1/cardwi.c	2005-02-03 03:56:11.000000000 +0200
+++ linux-2.6.11-rc3-mm/sound/oss/emu10k1/cardwi.c	2005-02-08 16:21:22.000000000 +0200
@@ -306,8 +306,10 @@ void emu10k1_wavein_getxfersize(struct w
 
 static void copy_block(u8 __user *dst, u8 * src, u32 str, u32 len, u8 cov)
 {
-	if (cov == 1)
-		__copy_to_user(dst, src + str, len);
+	if (cov == 1) {
+		if(__copy_to_user(dst, src + str, len))
+			BUG();
+	}
 	else {
 		u8 byte;
 		u32 i;
@@ -316,7 +318,8 @@ static void copy_block(u8 __user *dst, u
 
 		for (i = 0; i < len; i++) {
 			byte = src[2 * i] ^ 0x80;
-			__copy_to_user(dst + i, &byte, 1);
+			if(__copy_to_user(dst + i, &byte, 1))
+				BUG();
 		}
 	}
 }
diff -Nurdp linux-2.6.11-rc3-mm-original/sound/oss/emu10k1/passthrough.c linux-2.6.11-rc3-mm/sound/oss/emu10k1/passthrough.c
--- linux-2.6.11-rc3-mm-original/sound/oss/emu10k1/passthrough.c	2005-02-03 03:55:51.000000000 +0200
+++ linux-2.6.11-rc3-mm/sound/oss/emu10k1/passthrough.c	2005-02-08 16:18:13.000000000 +0200
@@ -162,12 +162,14 @@ ssize_t emu10k1_pt_write(struct file *fi
 
 		DPD(3, "prepend size %d, prepending %d bytes\n", pt->prepend_size, needed);
 		if (count < needed) {
-			copy_from_user(pt->buf + pt->prepend_size, buffer, count);
+			if(copy_from_user(pt->buf + pt->prepend_size, buffer, count))
+				return -EFAULT;
 			pt->prepend_size += count;
 			DPD(3, "prepend size now %d\n", pt->prepend_size);
 			return count;
 		}
-		copy_from_user(pt->buf + pt->prepend_size, buffer, needed);
+		if(copy_from_user(pt->buf + pt->prepend_size, buffer, needed))
+			return -EFAULT;
 		r = pt_putblock(wave_dev, (u16 *) pt->buf, nonblock);
 		if (r)
 			return r;
@@ -178,7 +180,8 @@ ssize_t emu10k1_pt_write(struct file *fi
 	blocks_copied = 0;
 	while (blocks > 0) {
 		u16 __user *bufptr = (u16 __user *) buffer + (bytes_copied/2);
-		copy_from_user(pt->buf, bufptr, PT_BLOCKSIZE);
+		if(copy_from_user(pt->buf, bufptr, PT_BLOCKSIZE))
+			return -EFAULT;
 		r = pt_putblock(wave_dev, (u16 *)pt->buf, nonblock);
 		if (r) {
 			if (bytes_copied)
@@ -193,7 +196,8 @@ ssize_t emu10k1_pt_write(struct file *fi
 	i = count - bytes_copied;
 	if (i) {
 		pt->prepend_size = i;
-		copy_from_user(pt->buf, buffer + bytes_copied, i);
+		if(copy_from_user(pt->buf, buffer + bytes_copied, i))
+			return -EFAULT;
 		bytes_copied += i;
 		DPD(3, "filling prepend buffer with %d bytes", i);
 	}
diff -Nurdp linux-2.6.11-rc3-mm-original/sound/usb/usx2y/usbusx2yaudio.c linux-2.6.11-rc3-mm/sound/usb/usx2y/usbusx2yaudio.c
--- linux-2.6.11-rc3-mm-original/sound/usb/usx2y/usbusx2yaudio.c	2005-02-03 03:55:52.000000000 +0200
+++ linux-2.6.11-rc3-mm/sound/usb/usx2y/usbusx2yaudio.c	2005-02-07 21:15:02.000000000 +0200
@@ -415,7 +415,6 @@ static int usX2Y_urbs_allocate(snd_usX2Y
 	unsigned int pipe;
 	int is_playback = subs == subs->usX2Y->subs[SNDRV_PCM_STREAM_PLAYBACK];
 	struct usb_device *dev = subs->usX2Y->chip.dev;
-	struct usb_host_endpoint *ep;
 
 	pipe = is_playback ? usb_sndisocpipe(dev, subs->endpoint) :
 			usb_rcvisocpipe(dev, subs->endpoint);

--Message-Boundary-23503
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Message-Boundary-23503--
