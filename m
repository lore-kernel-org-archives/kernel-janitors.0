From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 02 Apr 2004 01:26:17 +0000
Subject: [Kernel-janitors] [announce] 2.6.5-rc3-kj1 patchset
Message-Id: <20040401172617.09e52deb.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kjo <kernel-janitors@osdl.org>
Cc: lkml <linux-kernel@vger.kernel.org>


patch is at:
http://developer.osdl.org/rddunlap/kj-patches/2.6.5-rc3/2.6.5-rc3-kj1.patch.bz2  [2004-04-01]

M: merged at kernel.org;   mm: in -mm;   tx: sent;   mntr: maintainer merged;

This patch applies to linux-2.6.5-rc3.
new (for 2.6.5-rc3):  [2004-04-01]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
add/	extraver.patch
	rddunlap%osdl!org

add/	floppy_audit_v2.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	eth1394_kmemcc.patch
	From: <WHarms@bfs.de>(Walter Harms)

add/	pcmcia_cs_class_reg.patch
	From: <WHarms@bfs.de>(Walter Harms)

add/	jfs_metapage_kmemcc.patch
	From: <WHarms@bfs.de>(Walter Harms)

add/	mandocs_params-001.patch
	mandocs_params-002.patch
	mandocs_params-003.patch
	mandocs_params-004.patch
	mandocs_params-005.patch
	mandocs_params-006.patch
	mandocs_params-007.patch
	From: mikal@stillhq.com

This patch applies to linux-2.6.5-rc1.
previous (for 2.6.5-rc1):  [2004-03-16]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tx/	nfs_parse.patch
	From: Fabian_LoneStar_Frederick <fabian.frederick@gmx.fr>
	sent to mntr: 2004.0319; he acked it & will merge it;

add/	floppy_deugli_00.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	floppy_deugli_01.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	floppy_deugli_02.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	floppy_deugli_03.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>


This patch applies to linux-2.6.4-rc2.
previous (for 2.6.4-rc2):  [2004-03-09]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
add/	kswapd_init_fail.patch
	From: Eugene Teo <eugene.teo@eugeneteo.net>

tx/	lmc_proto_raw_h_rm.patch
	From: Domen Puncer <domen@coderock.org>
	sent to netdev/jgarzik: 2004.0229;

add/	ipv4_fib_hash_check.patch
	From: Francois Romieu <romieu@fr.zoreil.com>
	original From: <WHarms@bfs.de>(Walter Harms)

tx/	file2alias_signcomp.patch
fxd	From: Ron Gage <ron@rongage.org>
	sent to mntrs: 2004.0316;

tx/	fixdep_signcomp.patch
fxd	From: Ron Gage <ron@rongage.org>
	sent to mntrs: 2004.0316;

tx/	modpost_signcomp.patch
	From: Ron Gage <ron@rongage.org>
	sent to mntrs: 2004.0316;

tx/	errno_numbers_assembly.patch
	From: Danilo Piazzalunga <danilopiazza@libero.it>
	to akpm: 2004.0126;
	to akpm: 2004.0316;
	must go thru arch maintainers;

tx/	dgrs_iounmap.patch
	From: Leann Ogasawara <ogasawara@osdl.org>
	sent to jgarzik/netdev: 2004.0124;

tx/	drivers_ide_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to mntr/linux-ide: 2004.0316;

tx/	drivers_ide_minmax2.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to mntr/linux-ide: 2004.0316;

add/	keyboard_ptr_to_string.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	string_form_drivers.patch
	From: maximilian attems <janitor@sternwelten.at>

###

Merged (hence dropped from here):
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
M/	atm_nicstar_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>

M/	doc_var_updates.patch
	From: Alexey Dobriyan <adobriyan@mail.ru>

M/	fs_proc_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to akpm/viro: 2004.0316;

M/	mm_slab_init.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm: 2004.0316;

M/	reiserfs_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to akpm/mntr: 2004.0316;

M/	serial_8250_pnp_init.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm/rmk: 2004.0316;

M/	sound_oss_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to akpm/mntr: 2004.0316;

M/	zlib_deflate_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to akpm: 2004.0316;

M/	char_ip2_double_op.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm/mntr: 2004.0316;

mm/	cpufreq_longhaul_section.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to mntr: 2004.0319; for review, but looks incorrect to me;

mm/	cpufreq_longrun_section.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to mntr: 2004.0319;

backlog:
- check kernel_thread() results (Walter);
- list_for_each() usage (max attems);
- 81 patches for strings (Carlo);
- remove sleep_on() (Domen);

###

--
~Randy
(Again.  Sometimes I think ln -s /usr/src/linux/.config .signature)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
