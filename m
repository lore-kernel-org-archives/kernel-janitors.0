From: Domen Puncer <domen@coderock.org>
Date: Wed, 08 Dec 2004 15:54:39 +0000
Subject: [KJ] patches: delete 75 unused files
Message-Id: <20041208155439.GC31550@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50212945957995569=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50212945957995569==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Each of this filenames (ie dbg_stackcheck\.) was grepped trough whole
source, finding no references.

Comments?

Patches can be found at:
http://coderock.org/kernel/janitor/unreferenced_files/

(4 files with 2004 copyright message are not included in .bz2 as there
 are chances it's a uncomplete merge)

List of deleted files:
 arch/alpha/lib/dbg_stackcheck.S
 arch/alpha/lib/dbg_stackkill.S
 arch/alpha/lib/stacktrace.c
 arch/arm/mach-iop3xx/iop331-mm.c
 arch/arm26/boot/compressed/hw-bse.c
 arch/m68k/apollo/dn_debug.c
 arch/m68k/sun3x/sun3x_ksyms.c
 arch/m68knommu/platform/68EZ328/ucsimm/crt0_himem.S
 arch/m68knommu/platform/68VZ328/ucdimm/crt0_himem.S
 arch/mips/arc/salone.c
 arch/mips/pmc-sierra/yosemite/ht-irq.c
 arch/ppc/kernel/find_name.c
 arch/ppc/syslib/ppc4xx_pm.c
 arch/ppc/syslib/ppc4xx_serial.c
 arch/ppc64/boot/no_initrd.c
 arch/sh64/lib/old-checksum.c
 arch/um/include/umn.h
 arch/x86_64/lib/old-checksum.c
 drivers/char/hp600_keyb.c
 drivers/char/rio/cdproto.h
 drivers/char/rsf16fmi.h
 drivers/media/dvb/frontends/dvb_dummy_fe.c
 drivers/media/dvb/frontends/sp887x_firm.h
 drivers/net/gt64240eth.h
 drivers/parport/parport_arc.c
 drivers/pci/hotplug/pcihp_skeleton.c
 drivers/pcmcia/au1000_generic.c
 drivers/pcmcia/au1000_pb1x00.c
 drivers/scsi/dpt/dpt_osdutil.h
 drivers/video/aty/xlinit.c
 drivers/video/riva/nv4ref.h
 fs/jffs2/histo.h
 fs/jfs/jfs_defragfs.h
 include/asm-alpha/numnodes.h
 include/asm-arm/arch-epxa10db/mode_ctrl00.h
 include/asm-arm/arch-epxa10db/pld_conf00.h
 include/asm-arm/hardware/linkup-l1110.h
 include/asm-arm26/ian_char.h
 include/asm-m68k/atari_SCCserial.h
 include/asm-m68knommu/io_hw_swap.h
 include/asm-m68knommu/semp3.h
 include/asm-mips/gfx.h
 include/asm-mips/it8172/it8172_lpc.h
 include/asm-mips/mach-au1x00/au1100_mmc.h
 include/asm-mips/mipsprom.h
 include/asm-mips/ng1.h
 include/asm-mips/ng1hw.h
 include/asm-mips/riscos-syscall.h
 include/asm-parisc/bootdata.h
 include/asm-ppc64/iSeries/iSeries_fixup.h
 include/asm-um/arch-signal-i386.h
 include/asm-um/archparam-i386.h
 include/asm-um/archparam-ppc.h
 include/asm-um/module-generic.h
 include/asm-um/module-i386.h
 include/asm-um/processor-i386.h
 include/asm-um/processor-ppc.h
 include/asm-um/ptrace-i386.h
 include/asm-um/sigcontext-i386.h
 include/asm-um/sigcontext-ppc.h
 include/asm-um/system-i386.h
 include/asm-um/system-ppc.h
 include/linux/byteorder/pdp_endian.h
 include/linux/netfilter_ipv4/ip_logging.h
 include/linux/netfilter_ipv6/ip6_logging.h
 include/linux/umsdos_fs_i.h
 include/sound/soundmem.h
 net/sunrpc/auth_gss/gss_pseudoflavors.c
 net/sunrpc/auth_gss/sunrpcgss_syms.c
 sound/core/seq/oss/seq_oss_misc.c
 sound/oss/maestro_tables.h
 sound/pci/cs46xx/imgs/cwcemb80.h

Files with 2004 copyright message:
 arch/mips/pci/ops-tx3927.c
 include/asm-ia64/sn/fetchop.h
 include/asm-ia64/sn/sndrv.h
 include/asm-mips/mach-au1x00/au1xxx_psc.h

--===============50212945957995569==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50212945957995569==--
