From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 09 Apr 2004 16:01:00 +0000
Subject: [Kernel-janitors] 2.6.5-kj1 merge status
Message-Id: <20040409090100.74e6940e.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33667016973558561=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33667016973558561==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi,

Here's an update on merge status for the 2.6.5-kj1 patchset, before
going on to the next patchset version.
Any 2.6.5-kj1 patches not listed here are still in my kj patchset.

If a patch has been merged in the -mm patchset or by its maintainer,
I'm dropping it from the kj patchset.  Those maintainers will either
merge it upstream or drop it as they see fit.

BTW, Linus has been away this week, so nothing has actually been merged
into his kernel in the last 6 or so days.
You can also look at http://linux.bkbits.net:8080/linux-2.5
to see what Linus has merged.


patch is at:
http://developer.osdl.org/rddunlap/kj-patches/2.6.5/2.6.5-kj1.patch.bz2  [2004-04-05]

M: merged at kernel.org;   mm: in -mm;   tx: sent;   mntr: maintainer merged;
drop: being dropped;


mm/	remove_concat_FUNCTION_arch.patch
	remove_concat_FUNCTION_drivers.patch (except for drivers/net/)
	remove_concat_FUNCTION_include.patch
	remove_concat_FUNCTION_sound.patch
	From: Tony Breeds <tony@bakeyournoodle.com>
	sent to akpm: 2004.0406;

tx/	floppy_audit_v2.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm: 2004.0408;
*	need to rediff vs. Lindented source file (see below)

drop/	eth1394_kmemcc.patch
	From: <WHarms@bfs.de>(Walter Harms)
	sent to mntr: 2004.0405;  obsolete: using skb's now;

drop/	jfs_metapage_kmemcc.patch
	From: <WHarms@bfs.de>(Walter Harms)
	sent to mntr: 2004.0405;  declined;

mntr/	mandocs_params-001.patch
	mandocs_params-002.patch
	mandocs_params-003.patch
	mandocs_params-004.patch
	mandocs_params-005.patch
	mandocs_params-006.patch
	1-6 sent to mntr: 2004.0405;
mm/	mandocs_params-007.patch
	From: mikal@stillhq.com
	sent to akpm/mntr: 2004.0405;

drop/	floppy_deugli_00.patch
drop/	floppy_deugli_01.patch
drop/	floppy_deugli_02.patch
drop/	floppy_deugli_03.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm: 2004.0408;
	Andrew suggested using scripts/Lindent instead, which I did;
	new patch is at:
	http://developer.osdl.org/rddunlap/patches/floppy_format_265.patch

drop/	kswapd_init_fail.patch
	From: Eugene Teo <eugene.teo@eugeneteo.net>
	sent to akpm: 2004.0406;  dont-care, let it fail;

mntr/	lmc_proto_raw_h_rm.patch
	From: Domen Puncer <domen@coderock.org>
	sent to netdev/jgarzik: 2004.0229;
	sent to netdev/jgarzik: 2004.0405;

drop/	file2alias_signcomp.patch
	From: Ron Gage <ron@rongage.org>
	sent to mntrs: 2004.0316;
	rejected, too much casting; needs other changes;

drop/	fixdep_signcomp.patch
	From: Ron Gage <ron@rongage.org>
	sent to mntrs: 2004.0316;
	sent to mntrs: 2004.0406;  incorrect and incomplete;

drop/	modpost_signcomp.patch
	From: Ron Gage <ron@rongage.org>
	sent to mntrs: 2004.0316;
	sent to mntrs: 2004.0406;  incorrect and incomplete;

tx/	errno_numbers_assembly.patch
	From: Danilo Piazzalunga <danilopiazza@libero.it>
	to akpm: 2004.0126;
	to akpm: 2004.0316;
	must go thru arch maintainers;
	sent to 5 arch mntrs (sh, h8300, arm, arm26, i386): 2004.0405;
mntr/	h8300; arm26;

mntr/	dgrs_iounmap.patch
	From: Leann Ogasawara <ogasawara@osdl.org>
	sent to jgarzik/netdev: 2004.0124;
	sent to jgarzik/netdev: 2004.0405;

tx/	drivers_ide_minmax.patch
tx/	drivers_ide_minmax2.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to mntr/linux-ide: 2004.0316;
*	needs more work; see Bart's reply/comments;

mntr/	nfs_parse.patch
	From: Fabian_LoneStar_Frederick <fabian.frederick@gmx.fr>
	sent to mntr: 2004.0319; he acked it & will merge it;

backlog:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- check kernel_thread() results (Walter);
- list_for_each() usage (max attems);

Dropped:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- remove sleep_on() in drivers/usb/ (Domen): needs USB feedback;

###

--
~Randy
"We have met the enemy and he is us."  -- Pogo (by Walt Kelly)
(Again.  Sometimes I think ln -s /usr/src/linux/.config .signature)

--===============33667016973558561==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33667016973558561==--
