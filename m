From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 17 Mar 2004 22:17:57 +0000
Subject: [Kernel-janitors] [announce] 2.6.5-rc1-kj1 patchset
Message-Id: <20040317141757.26364225.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kjo <kernel-janitors@osdl.org>
Cc: lkml <linux-kernel@vger.kernel.org>


patch is at:
http://developer.osdl.org/rddunlap/kj-patches/2.6.5-rc1/2.6.5-rc1-kj1.patch.bz2  [2004-03-16]

M: merged at kernel.org;   mm: in -mm;   tx: sent;   mntr: maintainer merged;
?: still evaluating;

This patch applies to linux-2.6.5-rc1.
new (for 2.6.5-rc1):  [2004-03-16]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
add/	extraver.patch
	rddunlap%osdl!org

X	make_html_docs.patch
	From: Don Scorgie <DonScorgie@Blueyonder.co.uk>
already fixed;

add	cpufreq_longhaul_section.patch
?	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add	cpufreq_longrun_section.patch
?	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	nfs_parse.patch
	From: Fabian_LoneStar_Frederick <fabian.frederick@gmx.fr>

add/	floppy_deugli_00.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	floppy_deugli_01.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	floppy_deugli_02.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	floppy_deugli_03.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add	floppy_audit.patch
?	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>


This patch applies to linux-2.6.4-rc2.
previous (for 2.6.4-rc2):  [2004-03-09]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

add/	kswapd_init_fail.patch
	From: Eugene Teo <eugene.teo@eugeneteo.net>

tx/	lmc_proto_raw_h_rm.patch
	From: Domen Puncer <domen@coderock.org>
	sent to netdev/jgarzik: 2004.0229;

tx/	atm_nicstar_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to netdev/mntr: 2004.0225;
	sent to mntr: 2004.0316;

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

tx/	dgrs_iounmap.patch
	From: Leann Ogasawara <ogasawara@osdl.org>
	sent to jgarzik/netdev: 2004.0124;

tx/	doc_var_updates.patch
	From: Alexey Dobriyan <adobriyan@mail.ru>
	sent to akpm: 2004.0316;

tx/	drivers_ide_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to mntr/linux-ide: 2004.0316;

tx/	drivers_ide_minmax2.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to mntr/linux-ide: 2004.0316;

tx/	fs_proc_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to akpm/viro: 2004.0316;

tx/	mm_slab_init.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm: 2004.0316;

tx/	reiserfs_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to akpm/mntr: 2004.0316;

tx/	serial_8250_pnp_init.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm/rmk: 2004.0316;

tx/	sound_oss_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to akpm/mntr: 2004.0316;

tx/	zlib_deflate_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to akpm: 2004.0316;

tx/	char_ip2_double_op.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm/mntr: 2004.0316;

add/	keyboard_ptr_to_string.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	string_form_drivers.patch
	From: maximilian attems <janitor@sternwelten.at>

###

backlog:
- check kernel_thread() results;
- list_for_each() usage;

###

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
