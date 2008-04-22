From: Roel Kluin <12o3l@tiscali.nl>
Date: Tue, 22 Apr 2008 21:28:43 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <480E588B.2030703@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> I found 63 occurrences of this problem with the following semantic match
> (http://www.emn.fr/x-info/coccinelle/):
> 
> @@ unsigned int i; @@
> 
> * i < 0
> 

Spatch did find some that my script didn't, and mine had a few false
positives.
However, your spatch script did not catch some that my script covered. Below
are the results of my script (after a few modifications) and below that yours
for comparison. for instance not caught were:
* unsigned (or any unsigned typedef) i;

and besides your evaluated the tests:

* i < [any negative value]
* i >= [0 or any negative value]
* i = [any negative value]
* i != [any negative value]
* [0 or any negative value] <= i
* [0 or any negative value] > i

You could create a spatch script for all cases, but I think it'd be better to
write a script to create spatch scripts dependent on matches in source. I may
write this when I have time, Is there some reference on spatch syntax? And is
spatch open source? if so, how can I obtain its source code?

Roel
---
My matches:
vi arch/alpha/math-emu/math.c +186      # unsigned variable 'res'
vi arch/ia64/kernel/ptrace.c +2008      # unsigned variable 'pos'
vi arch/ia64/kernel/ptrace.c +2101      # unsigned variable 'pos'
vi arch/mips/kernel/irixelf.c +590      # unsigned variable 'v'
vi arch/mips/mm/sc-mips.c +84   # unsigned variable 'tmp'
vi arch/mips/mm/sc-mips.c +90   # unsigned variable 'tmp'
vi arch/mips/sgi-ip27/ip27-timer.c +231 # unsigned variable 'irq'
vi arch/powerpc/boot/oflib.c +159       # unsigned variable 'result'
vi arch/powerpc/kernel/iommu.c +152     # unsigned variable 'n'
vi arch/powerpc/oprofile/cell/vma_map.c +232    # unsigned variable 'overlay_tbl_offset'
vi arch/powerpc/platforms/pseries/lpar.c +528   # unsigned variable 'slot'
vi arch/ppc/boot/of1275/claim.c +84     # unsigned variable 'result'
vi arch/sh/kernel/cpu/sh2a/fpu.c +303   # unsigned variable 'ix'
vi arch/sh/kernel/cpu/sh2a/fpu.c +388   # unsigned variable 'ix'
vi arch/sparc64/kernel/iommu.c +140     # unsigned variable 'n'
vi arch/x86/kernel/cpu/cpufreq/longhaul.c +486  # unsigned variable 'ratio'
vi arch/x86/kernel/io_apic_32.c +249    # unsigned variable 'pin'
vi arch/x86/kernel/pci-gart_64.c +100   # unsigned variable 'offset'
vi arch/x86/kernel/pci-gart_64.c +105   # unsigned variable 'offset'
vi arch/x86/kernel/pci-gart_64.c +249   # unsigned variable 'iommu_page'
vi arch/x86/kernel/pci-gart_64.c +374   # unsigned variable 'iommu_start'
vi arch/x86/mm/init_64.c +831   # unsigned variable 'above'
vi arch/x86/mm/ioremap.c +554   # unsigned variable 'nesting'
vi arch/x86/mm/numa_64.c +179   # unsigned variable 'mem'
vi drivers/char/drm/drm_bufs.c +1540    # unsigned variable 'virtual'
vi drivers/gpio/mcp23s08.c +181 # unsigned variable 't'
vi drivers/ide/ide-cd.c +185    # unsigned variable 'valid'
vi drivers/lguest/page_tables.c +163    # unsigned variable 'pfn'
vi drivers/media/video/planb.c +881     # unsigned variable 'fr'
vi drivers/media/video/planb.c +885     # unsigned variable 'format'
vi drivers/media/video/videodev.c +1216 # unsigned variable 'index'
vi drivers/media/video/videodev.c +1216 # unsigned variable 'index'
vi drivers/mtd/devices/slram.c +273     # unsigned variable 'devlength'
vi drivers/net/irda/stir4200.c +769     # unsigned variable 'new_speed'
vi drivers/net/r8169.c +1708    # unsigned variable 'i'
vi drivers/net/r8169.c +1712    # unsigned variable 'i'
vi drivers/usb/host/ehci-dbg.c +457     # unsigned variable 'temp'
vi drivers/usb/host/ehci-dbg.c +468     # unsigned variable 'temp'
vi drivers/usb/serial/mos7840.c +1744   # unsigned variable 'status'
vi drivers/usb/storage/sddr55.c +368    # unsigned variable 'pba'
vi drivers/usb/storage/sddr55.c +368    # unsigned variable 'pba'
vi drivers/video/sis/sis_main.c +4053   # unsigned variable 'temp'
vi drivers/video/sis/sis_main.c +4059   # unsigned variable 'temp'
vi drivers/video/sis/sis_main.c +4067   # unsigned variable 'temp'
vi drivers/watchdog/wdt285.c +165       # unsigned variable 'new_margin'
vi fs/proc/task_mmu.c +148      # unsigned variable 'last_addr'
vi lib/iommu-helper.c +61       # unsigned variable 'index'
vi net/decnet/af_decnet.c +1589 # unsigned variable 'val'
vi net/netfilter/xt_TCPOPTSTRIP.c +98   # unsigned variable 'tcphoff'
vi sound/oss/dmabuf.c +800      # unsigned variable 'active_offs'
vi sound/pci/emu10k1/emu10k1x.c +1044   # unsigned variable 'reg'
vi sound/pci/hda/hda_codec.c +158       # unsigned variable 'parm'
vi sound/pci/hda/hda_codec.c +1929      # unsigned variable 'val'
vi sound/pci/hda/hda_codec.c +2026      # unsigned variable 'val'
vi sound/pci/hda/hda_codec.c +2031      # unsigned variable 'val'
vi sound/pci/hda/hda_proc.c +56 # unsigned variable 'caps'
vi sound/pci/hda/hda_proc.c +139        # unsigned variable 'stream'
vi sound/soc/codecs/cs4270.c +402       # unsigned variable 'ret'
vi sound/soc/codecs/cs4270.c +414       # unsigned variable 'ret'
vi sound/soc/codecs/cs4270.c +437       # unsigned variable 'ret'
vi sound/soc/codecs/cs4270.c +448       # unsigned variable 'ret'
vi sound/soc/codecs/cs4270.c +456       # unsigned variable 'ret'
vi drivers/block/cciss.c +3063  # unsigned variable 'cfg_base_addr_index'
vi drivers/net/irda/ali-ircc.c +1452    # unsigned variable 'speed'
vi drivers/net/irda/ali-ircc.c +1978    # unsigned variable 'speed'
vi drivers/net/irda/via-ircc.c +834     # unsigned variable 'speed'
vi drivers/net/irda/via-ircc.c +910     # unsigned variable 'speed'
vi fs/ext4/mballoc.c +2621      # unsigned variable 'i'
vi fs/ext4/mballoc.c +2627      # unsigned variable 'i'
vi arch/powerpc/platforms/iseries/call_pci.h +303       # unsigned variable 'xRc'
vi arch/powerpc/sysdev/fsl_soc.c +843   # unsigned variable 'sysclk'
vi arch/powerpc/sysdev/fsl_soc.c +845   # unsigned variable 'sysclk'
vi drivers/atm/fore200e.c +2923 # unsigned variable 'media_index'
vi drivers/hwmon/lm93.c +1728   # unsigned variable 'val'
vi drivers/infiniband/core/user_mad.c +715      # unsigned variable 'id'
vi drivers/infiniband/hw/ipath/ipath_intr.c +1162       # unsigned variable 'istat'
vi drivers/infiniband/hw/ipath/ipath_qp.c +114  # unsigned variable 'ret'
vi drivers/infiniband/hw/ipath/ipath_stats.c +80        # unsigned variable 'val'
vi drivers/infiniband/hw/mthca/mthca_av.c +177  # unsigned variable 'index'
vi drivers/infiniband/hw/mthca/mthca_mr.c +187  # unsigned variable 'seg'
vi drivers/infiniband/hw/mthca/mthca_mr.c +437  # unsigned variable 'key'
vi drivers/infiniband/hw/mthca/mthca_mr.c +597  # unsigned variable 'key'
vi drivers/macintosh/therm_adt746x.c +503       # unsigned variable 'val'
vi drivers/media/video/saa7115.c +1216  # unsigned variable 'wss'
vi drivers/net/ehea/ehea_main.c +440    # unsigned variable 'tmp_addr'
vi drivers/net/ehea/ehea_qmr.c +618     # unsigned variable 'mapped_addr'
vi drivers/net/mlx4/mr.c +175   # unsigned variable 'seg'
vi drivers/net/mlx4/mr.c +261   # unsigned variable 'index'
vi drivers/net/wireless/ipw2200.c +9152 # unsigned variable 'target_rate'
vi drivers/net/wireless/iwlwifi/iwl-3945.c +480 # unsigned variable 'rate'
vi drivers/net/wireless/iwlwifi/iwl-3945.c +1007        # unsigned variable 'data_retry_limit'
vi drivers/net/wireless/iwlwifi/iwl-4965.c +3001        # unsigned variable 'data_retry_limit'
vi drivers/net/wireless/iwlwifi/iwl-4965.c +3124        # unsigned variable 'num_tbs'
vi drivers/video/aty/mach64_gx.c +371   # unsigned variable 'program_bits'
vi fs/jfs/jfs_dtree.c +3070     # unsigned variable 'dir_index'
vi sound/pci/ca0106/ca0106_proc.c +307  # unsigned variable 'reg'
vi arch/ppc/syslib/open_pic.c +127      # unsigned variable 'ipi'
vi arch/ppc/syslib/open_pic.c +130      # unsigned variable 'timer'
vi arch/ppc/syslib/open_pic.c +130      # unsigned variable 'timer'
vi arch/ppc/syslib/open_pic.c +136      # unsigned variable 'pri'
vi arch/ppc/syslib/open_pic.c +136      # unsigned variable 'pri'
vi arch/ppc/syslib/open_pic.c +136      # unsigned variable 'pri'
vi arch/ppc/syslib/open_pic2.c +102     # unsigned variable 'timer'
vi arch/ppc/syslib/open_pic2.c +102     # unsigned variable 'timer'
vi arch/ppc/syslib/open_pic2.c +108     # unsigned variable 'pri'
vi arch/ppc/syslib/open_pic2.c +108     # unsigned variable 'pri'
vi arch/ppc/syslib/open_pic2.c +108     # unsigned variable 'pri'
vi drivers/mtd/rfd_ftl.c +255   # unsigned variable 'addr'
vi drivers/mtd/rfd_ftl.c +746   # unsigned variable 'old_addr'
vi arch/v850/kernel/ptrace.c +148       # unsigned variable 'addr'
vi arch/v850/kernel/ptrace.c +148       # unsigned variable 'addr'

yours (unsigned int)
> diff -u -p a/arch/arm/mach-davinci/psc.c b/arch/arm/mach-davinci/psc.c
> diff -u -p a/arch/cris/arch-v10/kernel/dma.c b/arch/cris/arch-v10/kernel/dma.c
> diff -u -p a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
> diff -u -p a/arch/mips/vr41xx/common/irq.c b/arch/mips/vr41xx/common/irq.c
> diff -u -p a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
> diff -u -p a/arch/powerpc/oprofile/cell/vma_map.c b/arch/powerpc/oprofile/cell/vma_map.c
> diff -u -p a/arch/s390/appldata/appldata_base.c b/arch/s390/appldata/appldata_base.c
> diff -u -p a/arch/sh/kernel/cpu/irq/intc.c b/arch/sh/kernel/cpu/irq/intc.c
> diff -u -p a/arch/sh/kernel/cpu/sh2a/fpu.c b/arch/sh/kernel/cpu/sh2a/fpu.c
> diff -u -p a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> diff -u -p a/drivers/char/esp.c b/drivers/char/esp.c
> diff -u -p a/drivers/char/hvc_console.c b/drivers/char/hvc_console.c
> diff -u -p a/drivers/char/hvcs.c b/drivers/char/hvcs.c
> diff -u -p a/drivers/char/hvsi.c b/drivers/char/hvsi.c
> diff -u -p a/drivers/gpio/mcp23s08.c b/drivers/gpio/mcp23s08.c
> diff -u -p a/drivers/ieee1394/dv1394.c b/drivers/ieee1394/dv1394.c
> diff -u -p a/drivers/ieee1394/video1394.c b/drivers/ieee1394/video1394.c
> diff -u -p a/drivers/macintosh/windfarm_smu_sat.c b/drivers/macintosh/windfarm_smu_sat.c
> diff -u -p a/drivers/media/video/bt8xx/bttv-driver.c b/drivers/media/video/bt8xx/bttv-driver.c
> diff -u -p a/drivers/media/video/meye.c b/drivers/media/video/meye.c
> diff -u -p a/drivers/media/video/mt20xx.c b/drivers/media/video/mt20xx.c
> diff -u -p a/drivers/media/video/planb.c b/drivers/media/video/planb.c
> diff -u -p a/drivers/media/video/saa7134/saa7134-video.c b/drivers/media/video/saa7134/saa7134-video.c
> diff -u -p a/drivers/media/video/usbvision/usbvision-video.c 
> diff -u -p a/drivers/media/video/videodev.c b/drivers/media/video/videodev.c
> diff -u -p a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> diff -u -p a/drivers/net/gianfar.c b/drivers/net/gianfar.c
> diff -u -p a/drivers/net/r8169.c b/drivers/net/r8169.c
> diff -u -p a/drivers/net/wireless/hermes.c b/drivers/net/wireless/hermes.c
> diff -u -p a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
> diff -u -p a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
> diff -u -p a/drivers/scsi/u14-34f.c b/drivers/scsi/u14-34f.c
> diff -u -p a/drivers/spi/spi_s3c24xx.c b/drivers/spi/spi_s3c24xx.c
> diff -u -p a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
> diff -u -p a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> diff -u -p a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> diff -u -p a/drivers/watchdog/wdt285.c b/drivers/watchdog/wdt285.c
> diff -u -p a/fs/ext3/inode.c b/fs/ext3/inode.c
> diff -u -p a/fs/ext4/inode.c b/fs/ext4/inode.c
> diff -u -p a/kernel/relay.c b/kernel/relay.c
> diff -u -p a/mm/slab.c b/mm/slab.c
> diff -u -p a/net/irda/ircomm/ircomm_tty.c b/net/irda/ircomm/ircomm_tty.c
> diff -u -p a/net/netfilter/xt_TCPOPTSTRIP.c b/net/netfilter/xt_TCPOPTSTRIP.c
> diff -u -p a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c

yours (unsigned long)
> diff -u -p a/arch/m32r/kernel/ptrace.c b/arch/m32r/kernel/ptrace.c
> diff -u -p a/arch/mips/kernel/irixelf.c b/arch/mips/kernel/irixelf.c
> diff -u -p a/drivers/atm/fore200e.c b/drivers/atm/fore200e.c
> diff -u -p a/drivers/char/dsp56k.c b/drivers/char/dsp56k.c
> diff -u -p a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
> diff -u -p a/drivers/hwmon/fscpos.c b/drivers/hwmon/fscpos.c
> diff -u -p a/drivers/i2c/chips/tsl2550.c b/drivers/i2c/chips/tsl2550.c
> diff -u -p a/drivers/ide/ide-cd.c b/drivers/ide/ide-cd.c
> diff -u -p a/drivers/message/i2o/i2o_block.c b/drivers/message/i2o/i2o_block.c
> diff -u -p a/drivers/misc/intel_menlow.c b/drivers/misc/intel_menlow.c
> diff -u -p a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
> diff -u -p a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> diff -u -p a/drivers/telephony/ixj.c b/drivers/telephony/ixj.c
> diff -u -p a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> diff -u -p a/drivers/video/atmel_lcdfb.c b/drivers/video/atmel_lcdfb.c
> diff -u -p a/kernel/softlockup.c b/kernel/softlockup.c
> diff -u -p a/kernel/sys.c b/kernel/sys.c
> diff -u -p a/sound/oss/dmabuf.c b/sound/oss/dmabuf.c
> diff -u -p a/sound/oss/trident.c b/sound/oss/trident.c
> diff -u -p a/sound/spi/at73c213.c b/sound/spi/at73c213.c
