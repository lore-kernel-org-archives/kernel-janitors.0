From: maximilian attems <janitor@sternwelten.at>
Date: Fri, 18 Jun 2004 09:39:22 +0000
Subject: [Kernel-janitors] [announce] 2.6.7 kjt1 patchset
Message-Id: <20040618093922.GA21628@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98437932653648141=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98437932653648141==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hello everyone!

the kjt patchset is growing.
as Arnaldo appears to be quite busy,
i'll send the patches to MAINTAINERS after this weekend
if no one objects?

splitted out patches (1 file/mail) with nice description have 
a much higher probability of being included, as workload 
for submitting them tends toward an optimised work flow.

format changed a bit, thanks to the pointer of Luiz
used the patch-scripts from Randy. they are really handy!

the new patch is at:
http://debian.stro.at/kjt/2.6.7-kjt1/2.6.7-kjt1.patch.bz2

splitted out at:
http://debian.stro.at/kjt/2.6.7-kjt1/split/

a++ maks



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
added since 2.6.7-rc1-kjt2:

document-cpu-sched-dir.patch
  From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
  Subject: [Kernel-janitors] [PATCH] - Creates a dir for CPU sched docs in Documentation.

drvdata-eisa.patch
  From: yoonsoo@web.de
  Subject: [Kernel-janitors] [Patch] eisa_h driverdata access

fix-check_region-esp.patch
  From: Kristen Carlson <kristenc@cs.pdx.edu>
  Subject: Re: [Kernel-janitors] removing check_region from drivers/char/esp.c

fix-warning-af_econet.patch
  From: <WHarms@bfs.de>(Walter Harms)
  Subject: [Kernel-janitors] linux-2.6.6/net/econet/af_econet.c: yxz never used

kernel_thread-i2o_core.patch
  From: MJK <mkemp@cs.nmsu.edu>
  Subject: [Kernel-janitors] [REDIFF]  new.linux-2.6.7-rc2/drivers/message/i2o/i2o_core.c -  kernel_thread() audit

printk-fix-istallion.patch
  From: <WHarms@bfs.de>(Walter Harms)
  Subject: [Kernel-janitors] linux-2.6.6/drivers/char/istallion.c: fix 	formatstring error

sparse-floppy98.patch
  From: Alexander Nyberg <alexn@telia.com>
  Subject: Resending Sparse checks diffs #1

sparse-ipmi.patch
  From: Alexander Nyberg <alexn@telia.com>
  Subject: Resending Sparse checks #6

sparse-ubd_kern.patch
  From: Alexander Nyberg <alexn@telia.com>
  Subject: Resending Sparse checks diffs #2

extraver.patch
  extraver

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
changed since 2.6.7-rc1-kjt2:
remove-old-ifdefs-tmscsim.patch
  From: Domen Puncer <domen@coderock.org>
  ifdefs already removed, just remove unused include


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
removed since 2.6.7-rc1-kjt2: 
remove-old-ifdefs-scsiiom
  From: Domen Puncer <domen@coderock.org>
  already done in 2.6.7


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
todo (backlog):
- check kernel_thread() results (Walter Harms);
	split them out
- list_for_each() usage (Domen Puncer)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
all the patches:

document-cpu-sched-dir.patch
drvdata-eisa.patch
extraver.patch
faulty-inits-fbmem.patch
fix-check_region-esp.patch
fix-warning-af_econet.patch
ipv4_fib_hash_check.patch
kernel_thread-aacraid-rkt.patch
kernel_thread-aacraid-rx.patch
kernel_thread-aacraid-sa.patch
kernel_thread-i2o_core.patch
list_for_each-fs-dcache.patch
list_for_each-fs-dquot.patch
list_for_each-fs-jffs.patch
list_for_each-fs-namespace.patch
list_for_each-i386pci-common.patch
list_for_each-i386pci-pcbios.patch
list_for_each-pci-setup-bus.patch
list_for_each-pcmcia-rsrc_mgr.patch
list_for_each-ppp_generic.patch
list_for_each-sound-mem.patch
list_for_each-usb-audio.patch
list_for_each-usb-core-devices.patch
list_for_each-usb-midi.patch
printk-fix-istallion.patch
remove-old-ifdefs-aic79xx.patch
remove-old-ifdefs-aic79xx_core.patch
remove-old-ifdefs-aic79xx_inline.patch
remove-old-ifdefs-aic79xx_osm.c.patch
remove-old-ifdefs-aic79xx_osm.h.patch
remove-old-ifdefs-aic79xx_osm_pci.patch
remove-old-ifdefs-aic7xxx-cam.patch
remove-old-ifdefs-aic7xxx.patch
remove-old-ifdefs-aic7xxx_core.patch
remove-old-ifdefs-aic7xxx_osm.c.patch
remove-old-ifdefs-aic7xxx_osm.h.patch
remove-old-ifdefs-aic7xxx_osm_pci.patch
remove-old-ifdefs-cpqarray.patch
remove-old-ifdefs-dc390.patch
remove-old-ifdefs-dmascc.patch
remove-old-ifdefs-eepro100.patch
remove-old-ifdefs-fasttimer.patch
remove-old-ifdefs-mtd-cfi.patch
remove-old-ifdefs-mtdcore.patch
remove-old-ifdefs-tmscsim.patch
sparse-floppy98.patch
sparse-ipmi.patch
sparse-ubd_kern.patch
static-bsd_comp.patch
static-ppp_deflate.patch

--===============98437932653648141==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98437932653648141==--
