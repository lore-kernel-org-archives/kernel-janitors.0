From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 14 May 2004 05:20:25 +0000
Subject: [Kernel-janitors] current KJ patchset merge status
Message-Id: <20040513222025.4ba038be.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15079504757548956=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15079504757548956==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


status for 2.6.6-rc2-kj1 patchset:

patch is at:
http://developer.osdl.org/rddunlap/kj-patches/2.6.6-rc2/2.6.6-rc2-kj1.patch.bz2  [2004-04-23]

M: merged at kernel.org;   mm: in -mm;   tx: sent;   mntr: maintainer merged;

This patch applies to linux-2.6.6-rc2.
new (for 2.6.6-rc2):  [2004-04-23]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

drop/	cdu31a_yield_sched_tmout.patch
	From: Gustavo Franco <stratus@legolas.alternex.com.br>
	needs: set_current_state(TASK_INTERRUPTIBLE);
	has been resubmtted IIRC;

tx/	com90io_message.patch
M/	com90xx_message.patch
	From: Greg Aumann <Greg_Aumann@sil.org>
	sent to akpm: 2004.0427;

M/	cyclades_cleanup.patch
	From: Don Koch <aardvark@krl.com>
	sent to mntr: 2004.0427;

tx/	sis900_yield_schedtmout.patch
	From: maximilian attems <janitor@sternwelten.at>
	sent to netdev/mntrs: 2004.0427;
tx/	needs to be: schedule_timeout(1);
	resent with correction;

tx/	videodev_class_reg.patch
	From: <WHarms@bfs.de>(Walter Harms)
	sent to kraxel/akpm: 2004.0427;

M/	kernel-api-docs.patch
M/	parport_doc_arg.patch
	From: Alexey Dobriyan <adobriyan@mail.ru>
	sent to akpm: 2004.0427;

tx/	ieee1394_init_register.patch
	From: <WHarms@bfs.de>(Walter Harms)
	sent to mntr: 2004.0513;

rej/	scsi_aic7xcur_macros.patch : rejected by maintainer;
M/	scsi_aic7xold_macros.patch
M/	scsi_ncr53c_macros.patch
M/	scsi_nsp_macros.patch
M/	scsi_pcmcia_macros.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to linux-scsi/mntrs: 2004.0427;

tx/	floppy_audit_v3.patch
tx/	floppy_debugt.patch
	From: Luiz Fernando N. Capitulino <lcapitulino@prefeitura.sp.gov.br>
	sent to akpm: 2004.0513;


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

M/	drivers_ide_minmax.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to mntr/linux-ide: 2004.0316;

M/	drivers_ide_minmax2.patch
	From: Michael Veeck <michael.veeck@gmx.net>
	sent to mntr/linux-ide: 2004.0316;

Dropped:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Backlog:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- check kernel_thread() results (Walter);
- list_for_each() usage (max attems);
- ifdef cleanup (Domen Puncer);
- replace yield() with schedule_timeout() (Gustavo Franco);

###
~Randy

--===============15079504757548956==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15079504757548956==--
