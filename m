From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 29 Mar 2004 16:53:55 +0000
Subject: Re: [Kernel-janitors] [PATCH] 81 patches for strings
Message-Id: <20040329165355.GB14260@sputnik.stro.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040319150659.GA20615@localhost>
In-Reply-To: <20040319150659.GA20615@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 21 Mar 2004, Carlo Perassi wrote:

> > It's better to review patches _before_ sending them the first time.
> 
> The review is made before by me and after by others.

please the next time, compile those modules. 
add an size output for this kind of patches.
it's an good argument :)

thx,
maks

ps.  well so we've got a nice list of potential substitutions
of string forms:

 arch/arm/mm/mm-armv.c                                      |    4 ++--
 arch/i386/kernel/apm.c                                     |    2 +-
 arch/ia64/sn/io/sn2/klconflib.c                            |    2 +-
 arch/ia64/sn/io/sn2/pcibr/pcibr_dvr.c                      |    2 +-
 arch/mips/tx4927/toshiba_rbtx4927/toshiba_rbtx4927_setup.c |    2 +-
 arch/ppc/boot/openfirmware/start.c                         |    2 +-
 arch/ppc/boot/simple/misc-embedded.c                       |    2 +-
 arch/ppc/platforms/chrp_setup.c                            |    2 +-
 arch/ppc/syslib/prom_init.c                                |    2 +-
 arch/ppc64/kernel/chrp_setup.c                             |    2 +-
 arch/ppc64/kernel/lparcfg.c                                |    4 ++--
 arch/ppc64/kernel/prom.c                                   |    2 +-
 arch/sh/kernel/kgdb_stub.c                                 |    2 +-
 arch/sparc/prom/tree.c                                     |    2 +-
 arch/sparc64/kernel/cpu.c                                  |    4 ++--
 arch/x86_64/ia32/sys_ia32.c                                |    2 +-
 arch/x86_64/kernel/e820.c                                  |    2 +-
 arch/x86_64/kernel/traps.c                                 |    2 +-
 drivers/acpi/battery.c                                     |    6 +++---
 drivers/acpi/utilities/utglobal.c                          |    2 +-
 drivers/atm/idt77252.c                                     |    2 +-
 drivers/char/agp/intel-agp.c                               |    2 +-
 drivers/char/lp.c                                          |    2 +-
 drivers/char/nvram.c                                       |    2 +-
 drivers/i2c/chips/adm1021.c                                |    2 +-
 drivers/i2c/chips/it87.c                                   |    2 +-
 drivers/i2c/chips/lm75.c                                   |    2 +-
 drivers/i2c/chips/lm78.c                                   |    2 +-
 drivers/i2c/chips/lm83.c                                   |    2 +-
 drivers/i2c/chips/lm85.c                                   |    2 +-
 drivers/i2c/chips/lm90.c                                   |    2 +-
 drivers/i2c/chips/w83627hf.c                               |    2 +-
 drivers/i2c/chips/w83781d.c                                |    4 ++--
 drivers/ide/legacy/hd.c                                    |    2 +-
 drivers/isdn/hardware/eicon/diva_didd.c                    |    2 +-
 drivers/isdn/hardware/eicon/divamnt.c                      |    2 +-
 drivers/isdn/hardware/eicon/divasi.c                       |    2 +-
 drivers/isdn/hardware/eicon/divasmain.c                    |    2 +-
 drivers/message/fusion/mptbase.c                           |    2 +-
 drivers/message/fusion/mptscsih.c                          |    2 +-
 drivers/mtd/maps/epxa10db-flash.c                          |    2 +-
 drivers/net/3c59x.c                                        |    2 +-
 drivers/net/arm/ether3.c                                   |    2 +-
 drivers/net/ioc3-eth.c                                     |    2 +-
 drivers/net/ne2.c                                          |    2 +-
 drivers/net/pcmcia/fmvj18x_cs.c                            |    2 +-
 drivers/net/tokenring/smctr.c                              |    2 +-
 drivers/parisc/dino.c                                      |    2 +-
 drivers/parport/parport_pc.c                               |    4 ++--
 drivers/pci/hotplug/pciehp_ctrl.c                          |    2 +-
 drivers/pci/hotplug/pciehp_pci.c                           |    2 +-
 drivers/pci/hotplug/shpchp_ctrl.c                          |    2 +-
 drivers/pci/hotplug/shpchp_pci.c                           |    2 +-
 drivers/pnp/pnpbios/rsparser.c                             |    2 +-
 drivers/s390/cio/cmf.c                                     |    2 +-
 drivers/s390/net/iucv.c                                    |    2 +-
 drivers/sbus/char/bbc_envctrl.c                            |    2 +-
 drivers/scsi/aic7xxx_old.c                                 |    2 +-
 drivers/scsi/aic7xxx_old/aic7xxx_proc.c                    |    4 ++--
 drivers/scsi/ini9100u.c                                    |    4 ++--
 drivers/scsi/inia100.c                                     |    4 ++--
 drivers/serial/suncore.c                                   |    6 +++---
 drivers/usb/host/ehci-dbg.c                                |    2 +-
 drivers/usb/host/ohci-dbg.c                                |    2 +-
 drivers/usb/misc/usbtest.c                                 |    2 +-
 drivers/usb/serial/ftdi_sio.c                              |    2 +-
 drivers/video/console/promcon.c                            |    2 +-
 fs/binfmt_misc.c                                           |    2 +-
 fs/partitions/acorn.c                                      |    2 +-
 fs/smbfs/proc.c                                            |    2 +-
 lib/bitmap.c                                               |    2 +-
 net/sunrpc/svcauth_unix.c                                  |    2 +-
 sound/drivers/opl3/opl3_midi.c                             |    2 +-
 sound/isa/wavefront/wavefront_synth.c                      |    2 +-
 sound/oss/cmpci.c                                          |    2 +-
 sound/oss/gus_wave.c                                       |    2 +-
 sound/oss/msnd_pinnacle.c                                  |    2 +-
 sound/oss/wavfront.c                                       |    2 +-
 sound/pci/cs46xx/dsp_spos.c                                |    2 +-
 sound/pci/trident/trident_main.c                           |    2 +-
 80 files changed, 92 insertions(+), 92 deletions(-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
