From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 23 Apr 2004 16:46:46 +0000
Subject: [Kernel-janitors] [announce] 2.6.6-rc2 kernel-janitors patchset
Message-Id: <20040423094646.18496e90.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37672911220647265=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kjo <kernel-janitors@osdl.org>
Cc: lkml <linux-kernel@vger.kernel.org>

--===============37672911220647265==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


patch is at:
http://developer.osdl.org/rddunlap/kj-patches/2.6.6-rc2/2.6.6-rc2-kj1.patch.bz2  [2004-04-23]

M: merged at kernel.org;   mm: in -mm;   tx: sent;   mntr: maintainer merged;

This patch applies to linux-2.6.6-rc2.
new (for 2.6.6-rc2):  [2004-04-23]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
add/	extraver.patch
	rddunlap%osdl!org

add/	cdu31a_yield_sched_tmout.patch
	From: Gustavo Franco <stratus@legolas.alternex.com.br>

add/	com90io_message.patch
add/	com90xx_message.patch
	From: Greg Aumann <Greg_Aumann@sil.org>

add/	cyclades_cleanup.patch
	From: Don Koch <aardvark@krl.com>

add/	sis900_yield_schedtmout.patch
	From: maximilian attems <janitor@sternwelten.at>

add/	videodev_class_reg.patch
	From: <WHarms@bfs.de>(Walter Harms)

add/	kernel-api-docs.patch
add/	parport_doc_arg.patch
	From: Alexey Dobriyan <adobriyan@mail.ru>

add/	ieee1394_init_register.patch
	From: <WHarms@bfs.de>(Walter Harms)

add/	scsi_aic7xcur_macros.patch
add/	scsi_aic7xold_macros.patch
add/	scsi_ncr53c_macros.patch
add/	scsi_nsp_macros.patch
add/	scsi_pcmcia_macros.patch
	From: Michael Veeck <michael.veeck@gmx.net>

add/	floppy_audit_v3.patch
add/	floppy_debugt.patch
	From: Luiz Fernando N. Capitulino <lcapitulino@prefeitura.sp.gov.br>


This patch applies to linux-2.6.4-rc2.
previous (for 2.6.4-rc2):  [2004-03-09]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
add/	ipv4_fib_hash_check.patch
	From: Francois Romieu <romieu@fr.zoreil.com>
	original From: <WHarms@bfs.de>(Walter Harms)

tx/	errno_numbers_assembly.patch
	From: Danilo Piazzalunga <danilopiazza@libero.it>
	to akpm: 2004.0126;
	to akpm: 2004.0316;
	must go thru arch maintainers;
	sent to 5 arch mntrs (sh, h8300, arm, arm26, i386): 2004.0405;
mntr/	h8300; arm26 ("Noted");
M/	arm;

add/	keyboard_ptr_to_string.patch
	From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>

add/	string_form_drivers.patch
	From: maximilian attems <janitor@sternwelten.at>

Merged (hence dropped from here):
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
M/	pcmcia_cs_class_reg.patch
	From: <WHarms@bfs.de>(Walter Harms)
	sent to mntr: 2004.0405;

Dropped:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drop/	drivers_ide_minmax.patch
drop/	drivers_ide_minmax2.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to mntr/linux-ide: 2004.0316;
	see Bart's reply/comments; no clear resolution on this;

backlog:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- check kernel_thread() results (Walter);
- list_for_each() usage (max attems);

###

--
~Randy
(Again.  Sometimes I think ln -s /usr/src/linux/.config .signature) -- akpm

--===============37672911220647265==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37672911220647265==--
