From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 04 Sep 2005 01:13:10 +0000
Subject: [KJ] 2.6.13-git4-kj1
Message-Id: <20050904011310.GA15222@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37025635700254184=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37025635700254184==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2.6.13-git4-kj1 patchset is out: http://coderock.org/kj/2.6.13-git4-kj1/

I cleaned up changelogs and subject lines. Minor tweaking and collapsing
of patches into bigger ones was also made.

I won't be surprised if something was lost due to change of maintainer.
Please, recheck and drop me a line if needed.

Since -git4 appears to be empty on kernel.org, commit SHA against which
patch was generated is f505380ba7b98ec97bf25300c2a58aeae903530b aka
"Merge refs/heads/ieee80211-wifi from master.kernel.org:/pub/scm/linux/kernel/git/jgarzik/netdev-2.6".

Don't forget to tweak Makefile if you use rsync since patches were
hand-edited as if they were against to-be-uploaded 2.6.13-git4.

I'm not seeing many "can be used uninitialized" gcc warnings with almost
latest gcc-4.1 snapshot. After installing gcc-4.0.[01] their future
will be more certain.

At the end of this email you'll find nice shortlog.

	Alexey [fingers crossed] Dobriyan


New in this release
-------------------

Tobias Klauser:
  drivers/net/*: remove unused header files

Denis Vlasenko:
  "space before \n" removal


Merged wrt tarball Domen sent me
--------------------------------
remove_file-include_linux_netfilter_ipv4_ip_logging.h.patch
remove_file-include_linux_netfilter_ipv6_ip6_logging.h.patch
msleep_interruptible-drivers_net_wan_cycx_drv
module_param-drivers_net_pci-skeleton
sparse-include_net_bluetooth_bluetooth.h
sparse-drivers_bluetooth_hci_usb
sparse-drivers_bluetooth_bpa10x
time_after-drivers_net_hamradio_mkiss
warning-drivers_net


Dropped
-------
return_code-drivers_ide.patch
return_code-drivers_isdn_hisax.patch
return_code-drivers_isdn_pcbit.patch

	Makes copying from userspace in a non-canonical way. Likely not
	what author meant.

printk-drivers_block_cciss.patch

	Converting to pr_debug() should be better. Currently only does
		+printk(KERN_DEBUG, );

set_current_state-drivers_cdrom_sbpcd

	Looks like code around changes is buggy. At least, there is
	
		sti();
		...
		sti();

warning-fs_devfs_base.c

	devfs is deeead.


=======================================================================
Alejandro Andres:
  kernel/module.c: use __set_current_state() instead of direct assigment

Alexey Dobriyan:
  2.6.13-git4-kj1
  Remove arch/ppc/syslib/qspan_pci.c
  [PATCH 01/15] FlashPoint: remove unused things
  [PATCH 02/15] FlashPoint: remove trivial wrappers
  [PATCH 03/15] FlashPoint: remove UCHAR
  [PATCH 04/15] FlashPoint: remove USHORT
  [PATCH 05/15] FlashPoint: remove UINT
  [PATCH 06/15] FlashPoint: remove ULONG
  [PATCH 07/15] FlashPoint: remove ushort_ptr
  [PATCH 08/15] FlashPoint: use standard fixed size types
  [PATCH 09/15] FlashPoint: untypedef struct _SCCB
  [PATCH 1/2] cifs: __le'ify cifssmb.c
  [PATCH 1/2] sb16_csp: remove home-grown le??_to_cpu macros
  [PATCH 10/15] FlashPoint: untypedef struct SCCBMgr_info
  [PATCH 11/15] FlashPoint: untypedef struct SCCBMgr_tar_info
  [PATCH 12/15] FlashPoint: untypedef struct NVRAMInfo
  [PATCH 13/15] FlashPoint: untypedef struct SCCBcard
  [PATCH 14/15] ./scripts/Lindent drivers/scsi/FlashPoint.c
  [PATCH 15/15] FlashPoint: don't use parenthesis with "return"
  [PATCH 2/2] fs/cifs/cifssmb.c: fix the rest of sparse warnings
  [PATCH 2/2] sb16_csp: untypedef
  affs: fix sparse warning
  amifdreg.h: remove unused macros
  atm: remove __AAL_STAT_ITEMS
  atm_zatm.h: remove unused things
  befs: fix sparse warnings
  drivers/ide/legacy/hd.c: remove DEBUG
  dvb: fmt warning fixes for 64-bit platforms
  ext3: fix sparse warnings
  fs/cifs/netmisc.c: fix sparse warning
  hpfs: fix sparse warnings
  include/linux/coff.h: remove unused things
  ldusb: fmt warnings fixes for 64-bit platforms
  mtd: remove compatmac.h
  ntfs: fmt warning fix for 64-bit platforms
  parport_serial: fmt warning fixes for 64-bit platforms
  pktgen: remove useless assignment
  smbfs: fix sparse warnings

Amit Gud:
  cs5520: fix return value of cs5520_init_one()

Baruch Even:
  proc_ipmi_root depends on CONFIG_PROC_FS

Brandon Niemczyk:
  fec.c: cli() cleanup

Carlo Perassi:
  atmel: CodingStyle cleanup
  bond_main.c: uninitialize static variables initialized to 0
  cypress_m8.c: CodingStyle cleanup

Christophe Lucas:
  DAC960: use KERN_* constants
  apllicom: audit return codes of misc_register()
  arm26: ecard.c: audit return code of create_proc_info_entry()
  arm: apm.c: audit return code of create_proc_info_entry()
  arm: sa1111.c: use sizeof(*pointer)
  atmel: audit return code of create_proc_* functions
  cciss.c: audit return code of create_proc_read_entry()
  cpqarray.c: audit return code of create_proc_read_entry()
  drivers/acpi/container.c: use KERN_INFO
  drivers/acpi/osl.c: use set_current_state()
  drivers/acpi/pci_link.c: use KERN_ERR
  drivers/acpi/system.c: remove unused brackets
  drivers/block/paride/*: use KERN_* constants
  drivers/char/ip2/i2lib.c: use set_current_state()
  drivers/ide/*: convert to pci_register_driver()
  drivers/net/*: convert to pci_register_driver()
  drivers/net/arcnet/*: convert to pci_register_driver()
  drivers/net/irda/*: convert to pci_register_driver()
  drivers/net/skfp/*: convert to pci_register_driver()
  drivers/net/tokenring/*: convert to pci_register_driver()
  drivers/net/tulip/*: convert to pci_register_driver()
  drivers/net/wan/*: convert to pci_register_driver()
  drivers/net/wan/lmc/*: convert to pci_register_driver()
  drivers/net/wireless/*: convert to pci_register_driver()
  drivers/parport/*: convert to pci_register_driver()
  hdpu_cpustate.c: audit return codes
  hp100: include appropriate KERN_* constants
  hp_sdc_rtc.c: audit return codes
  lcd: audit return code of misc_register()
  mca-proc.c: audit return code of create_proc_read_entry()
  parisc: pci-dma.c: audit return code of create_proc_read_entry()
  pktcdvd: use KERN_* constants in printk()s
  sh64: audit return code of create_proc_read_entry()
  sh: audit return code of create_proc_read_entry()
  sparc: ioport.c: audit return code of create_proc_read_entry()
  wdt285: add KERN_* constants

Clemens Buchacher:
  Don't concatenate __FUNCTION__ with strings
  ide-timing.h: use min/max macros

Daniel Smertnig:
  /proc/tty/driver/* filtering for non CAP_SYS_RAWIO

David chosrova:
  ep7211: remove sti()/cli()

Denis Vlasenko:
  "space before \n" removal

Domen Puncer:
  Remove arch/arm26/boot/compressed/hw-bse.c
  Remove arch/mips/arc/salone.c
  Remove arch/mips/pmc-sierra/yosemite/ht-irq.c
  Remove arch/ppc/syslib/ppc4xx_pm.c
  Remove drivers/parport/parport_arc.c
  Remove fs/jffs2/histo.h
  Remove include/asm-arm/hardware/linkup-l1110.h
  Remove include/asm-mips/gfx.h
  Remove include/asm-mips/mach-au1x00/au1100_mmc.h
  Remove include/asm-mips/mipsprom.h
  Remove include/asm-mips/riscos-syscall.h
  de4x5: make code more readable with list_for_each
  drivers/isdn/sc/ioctl.c: copy_from_user() size fix
  drivers/macintosh/via-pmu.c: use list_for_each*()
  floppy: remove unused LOCAL_END_REQUEST
  fs/*: make code more readable with list_for_each_{entry,safe}()
  fs/devpts: use lib/parser.c for parsing mount options.
  jffs: make code more readable with list_for_each_entry*
  ppp_generic: make code more readable with list_for_each*
  umem: use pr_debug()

Gabriel A. Devenyi:
  pktcdvd: remove unused variable

Grant Coady:
  Make kbuild CONFIG_DEBUG_INFO usage consistent 

Hanna Linder:
  alim15x3: replace pci_find_device() with pci_dev_present()
  arch/i386/pci/acpi.c: use for_each_pci_dev

James Lamanna:
  agp: backend: vfree() checking cleanup
  reiserfs: [kv]free() checking cleanup

James Nelson:
  drivers/video/*: add KERN_* constants
  fd1772: printk()s cleanup
  floppy: relocate devfs comment
  mfmhd: printk()s cleanup
  scripts/Lindent arch/ppc/4xx_io/serial_sicc.c

Jan Veldeman:
  sysfs.txt: fix whitespace after comma between parameters
  sysfs.txt: use S_IRUSR | ... instead of 0644
  sysfs.txt: use snprintf and strnlen

Jerome Steunenberg:
  vgastate.c: remove unnecessary calls to init_module and cleanup_module

Jesse Millan:
  ext2: fix gcc4 warning, size may be used uninitialized
  ext3: fix misleading gcc4 warning, size may be used uninitialized
  fs/cifs/asn1.c: fix gcc4 warning
  fs/eventpoll.c: fix gcc4 warning
  wavelan_cs.c: fix gcc4 warning: large integer implicitly truncated to unsigned type

Jim Cromie:
  drivers/char/Makefile: indenting cleanup

Kirk True:
  olympic: check return code for /proc entry creation

Marcelo Feitoza Parisi:
  3c523: use time_after macro
  3c589_cs.c: use time_before macro
  3c59x.c: use time_after() macro
  DAC960: use time_{after,after_eq,before}() macros
  apne: use time_after()
  ati_remote.c: use time_after and time_before macros
  drivers/ieee1394/hosts.c: use time_before
  drivers/net/arcnet/arcnet.c: use time_after() macro
  drivers/net/arm/etherh.c: use time_after()
  drivers/net/hamradio/*: use time_after_eq macro
  drivers/net/tokenring/lanstreamer.c: use time_after macro
  drivers/net/tokenring/olympic.c: use time_after macro
  drivers/net/tulip/pnic.c: use time_after macro
  drivers/net/wireless/strip.c: use time_after()
  drivers/scsi/*: use time_after macro
  dvb-ttusb-budget: use time_after_eq() macro
  eth16i: use time_after() macro
  floppy: use time_after() and time_before() macros
  hp100: use time_before macro
  ide-tape: use time_after macro
  lp: use time_after() macro
  ne-h8300: use time_after()
  ne2: use time_after()
  ne: use time_after()
  ns83820: use time_after_eq macro
  nvidia-agp.c: use time_before_eq() macro
  oaknet: use time_after() macro
  ppp_async.c: use time_after_eq() macro
  qlogicfc: use time_after() macro
  seeq8005: use time_before() macro
  shaper: use time_after() macro
  zorro8390: use time_after()

Michael Veeck:
  Remove DRM_ARRAY_SIZE
  arch/sh/*: remove MAX

Nishanth Aravamudan:
  8139too: remove interruptible_sleep_on_timeout() usage
  DAC960: remove *sleep_on*() usage
  acsi_slm: replace interruptible_sleep_on() with wait_event_interruptible()
  atari: time.c: use msleep_interruptible()
  capi: replace interruptible_sleep_on() with wait_event_interruptible()
  cciss: use msleep()
  cciss: use msleep() instead of schedule_timeout()
  drivers/acpi/osl.c: correct HZ dependencies
  drivers/block/xd.c: use msleep()/msleep_interruptible()
  drivers/ide/*: replace schedule_timeout() with msleep()
  drivers/parport/*: use msleep_interruptible()
  i386: smpboot.c: use msleep() instead of schedule_timeout()
  i4l: isdn_common.c: replace interruptible_sleep_on() with wait_event()
  i830_irq.c: use wait_event_interruptible_timeout()
  ibmtr: remove *sleep_on*() usage
  ibmtr: use msleep()/msleep_interruptible()
  ieee1284: use human time units in sleeping logic
  ixgb_ethtool.c: replace schedule_timeout() with msleep_interruptible()
  ixj: use msleep() instead of schedule_timeout()
  lanstreamer: replace interruptible_sleep_on_timeout() with wait_event_interruptible_timeout()
  lockd: remove interruptible_sleep_on_timeout() usage
  lockd: replace schedule_timeout() with msleep_interruptible()
  lpfc_scsi: use msleep() instead of schedule_timeout()
  mcdx: remove interruptible_sleep_on*() usage
  mips: bcm1250_tbprof.c: remove interruptible_sleep_on() usage
  net/sunrpc/clnt.c: remove sleep_on_timeout() usage
  osst: use msleep() instead of schedule_timeout()
  pcd: use msleep()/ssleep()
  pf: replace pf_sleep() with msleep()
  pg: replace pg_sleep() with msleep()
  ppc: fcc_enet: replace schedule_timeout() with ssleep()
  prism54: use msleep()
  ps2esdi: replace sleep_on() with wait_event()
  pt: replace pt_sleep() with msleep()/ssleep()
  qla2xxx: use msleep{,_interruptible}() instead of schedule_timeout()
  sjcd: remove sleep_on() usage
  smbfs: replace schedule_timeout() with msleep()
  sonycd535: replace schedule_timeout() with msleep()
  stir4200: use set_current_state()
  sunrpc: replace schedule_timeout() with msleep()
  swim3: replace schedule_timeout() with msleep_interruptible()
  swim_iop: use msleep_interruptible()
  usblp: use wait_event_interruptible_timeout()
  wan: sycx_drv.c: replace delay_cycx() with msleep_interruptible()
  xd: remove sleep_on() usage

Ricardo Nabinger Sanchez:
  cris: axisflashmap: fixes static strings declaration

Scott Feldman:
  gt96100: stop using pci_find_device()

Tobias Klauser:
  Documentation/*:  spelling fixes
  REPORTING-BUGS: spelling and whitespace fixes
  cpqarray: use DMA_32BIT_MASK
  drivers/net/*: remove unused header files
  drivers/net/*: use DMA_{64,32}BIT_MASK
  drivers/scsi/*: use DMA_32BIT_MASK
  drivers/serial/usb-serial.c: remove unneeded casts
  ioc3-eth: use DMA_{32,64}BIT_MASK constants
  meye: use DMA_32BIT_MASK
  umem: use DMA_{32,64}BIT_MASK and correct call to pci_set_dma_mask()

Travis Spencer:
  diva.c: supress warning caused by label being defined but unused
  hisax_fcpcipnp.c: reorganize control flow to suppress warning

Victor Fusco:
  as-iosched: fix sparse warnings (__nocast type)
  bond_main.c: fix "nocast type" warnings
  cfq-iosched: fix sparse warnings (__nocast type)
  deadline-iosched: fix sparse warnings (__nocast type)
  dm-crypt: fix "nocast type" warnings
  drivers/base/dmapool.c: fix "nocast type" warnings
  fs/reiserfs/fix_node.c:: fix sparse warnings (__nocast type)
  fs/reiserfs/journal.c: replace direct assignment with __set_current_state()
  kernel/audit.c: fix sparse warnings (__nocast type)
  lib/radix-tree.c: fix "nocast type" warnings
  ll_rw_blk.c: fix sparse warnings
  mm/swap_state.c: fix "nocast type" warnings
  n_tty.c: fix sparse warnings (__nocast type)
  ns83820: fix "nocast type" warnings
  pci-skeleton.c: MODULE_PARM -> module_param
  sungem: fix "nocast type" warnings
  xfs: fix "nocast type" warnings



--===============37025635700254184==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37025635700254184==--
