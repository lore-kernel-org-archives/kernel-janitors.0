From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 21 Jan 2004 23:24:46 +0000
Subject: [Kernel-janitors] [announce] 2.6.1-bk6-kj1 patchset
Message-Id: <20040121152446.61020605.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kjo <kernel-janitors@osdl.org>
Cc: lkml <linux-kernel@vger.kernel.org>


patch is at:
http://developer.osdl.org/rddunlap/kj-patches/2.6.1-bk6/2.6.1-bk6-kj1.patch.bz2  [2004-01-16]

M: merged at kernel.org;   mm: in -mm;   tx: sent;

This patch applies to linux-2.6.1-bk6.

new (for 2.6.1-bk6):  [2004-01-21]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

add/	aha1542_kmalloc_type.patch
	From: Timmy Yee <shoujun@masterofpi.org>

add/	aha1542_qcommand_return.patch
	From: Timmy Yee <shoujun@masterofpi.org>

add/	char_dz_vrfy_area.patch
	From: Domen Puncer <domen@coderock.org>

add/	config_sysrq.patch
	From: Domen Puncer <domen@coderock.org>

add/	mcfserial_remove_casts_args.patch
	From: Domen Puncer <domen@coderock.org>

add/	netdev_get_stats.patch
	From: Domen Puncer <domen@coderock.org>

add/	scsi_config_doc.patch
	From: Jean Delvare <khali@linux-fr.org>

add/	saa7146_hlp_min_max.patch
	From: Eugene Teo <eugene.teo@eugeneteo.net>

previous (for 2.6.1-bk4):  [2004-01-16]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
add/	config_ledman_rm.patch
	From: Domen Puncer <domen@coderock.org>

add/	ipt_register_target_retval.patch
	From: Daniele Bellucci <bellucda@tiscali.it>

add/	kconfig_cleanups_v1.patch
	From: Matthew Wilcox <willy@debian.org>
  drop	drivers/block/Kconfig: merge conflicts
  drop	drivers/video/console/Kconfig: merge conflicts
  drop	drivers/i2c/*/Kconfig: already merged

add?	kswapd_init_fail.patch
	From: Eugene Teo <eugene.teo@eugeneteo.net>

add/	lmc_proto_raw_h_rm.patch
	From: Domen Puncer <domen@coderock.org>

add/	netdev_rm_casts.patch
	From: Carlo Perassi <carlo@linux.it>

add/	s390_net_ctctty_putuser.patch
	From: Domen Puncer <domen@coderock.org>
	(rediffed)

add/	setup_bootmem_fail.patch
	From: Eugene Teo <eugene.teo@eugeneteo.net>

?add	skfddi_regions_pciupdate.patch
	From: Matthew Wilcox <willy@debian.org>

add/	acpi_boot_message_typo.patch
	From: Simon Richard Grint <rgrint@mrtall.compsoc.man.ac.uk>

add/	cpcihp_zt5550_iounmap.patch
	From: Leann Ogasawara <ogasawara@osdl.org>

add/	mfcserial_vrfyarea.patch
	From: Domen Puncer <domen@coderock.org>

add/	vga16fb.c_iounmap.patch
	From: Leann Ogasawara <ogasawara@osdl.org>

add/	vgastate.c_iounmap.patch
	From: Leann Ogasawara <ogasawara@osdl.org>

add/	tc35815.c_iounmap.patch
	From: Leann Ogasawara <ogasawara@osdl.org>

add/	depca_iounmap.patch
	From: Leann Ogasawara <ogasawara@osdl.org>

add/	dgrs_iounmap.patch
	From: Leann Ogasawara <ogasawara@osdl.org>

previous (for 2.6.1):  [2004-01-13]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
M/	fdport.patch: reorder outb() macro names to reflect reality;
	From: Randy Dunlap <rddunlap@osdl.org>
	sent to akpm: 2004.0118;

M/	vmdocs.patch
	From: Patrick McLean <pmclean@linuxfreak.ca>
	sent to akpm: 2004.0118;

M/	2.6_spelling_Unix98.diff.patch
	From: Andreas Beckmann <sparclinux@abeckmann.de>
	sent to akpm: 2004.0118;

M/	md_notifdef.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm: 2004.0118;

M/	fsstat64.patch
	From: Michael Still <mikal@stillhq.com>
	sent to akpm: 2004.0118;

previous (for 2.6.1-rc3):  [2004-01-08]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
add	update EXTRAVERSION: add -kj1

M/	amd74_noprocfs.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm/bart: 2004.0118;

M/	siimage_noprocfs2.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm/bart: 2004.0118;

M/	apm_thread_retval.patch
	From: Eugene TEO <eugeneteo@eugeneteo.net>
	sent to akpm: 2004.0118;

drop/	init_thread_retval.patch
	From: Eugene TEO <eugeneteo@eugeneteo.net>
	sent to akpm: 2004.0118;
	not worth the effort

M/	mca_retval.patch
	From: Eugene TEO <eugeneteo@eugeneteo.net>
	sent to akpm: 2004.0118;

maint/	cifs_dalloc_retval.patch
	From: Eugene TEO <eugeneteo@eugeneteo.net>
	sent to akpm/sfrench: 2004.0118;
	merged by CIFS maintainer;

M/	md_noprocfs.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm: 2004.0118;

drop/	mminit_retval.patch
	From: Eugene TEO <eugeneteo@eugeneteo.net>
	sent to akpm: 2004.0118;
	Wrong.  If mm_init() fails, it frees `mm'.   Bad design.

drop/	pdflush_retval.patch
	From: Eugene TEO <eugeneteo@eugeneteo.net>
	sent to akpm: 2004.0118;
	Nope, if we fail to start a thread here we'll just try again later. 
	There's no need to warn.

drop/	setfpxregs_retval.patch
	From: Eugene TEO <eugeneteo@eugeneteo.net>
	see source code comment:  clearing mxcsr bits must be done;

drop/	ipv4_ipmr_retval.patch
done/	From: Eugene TEO <eugeneteo@eugeneteo.net>

M/	sunrpc_retval.patch
	From: Eugene TEO <eugeneteo@eugeneteo.net>
	sent to davem/netdev: 2004.0118;

tx/	tr3c_kmalloc.patch
	From: Pablo Menichini <pablo@menichini.com.ar>
	and maximilian attems <janitor@sternwelten.at>
	sent to jgarzik/netdev: 2004.0118;

###

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
