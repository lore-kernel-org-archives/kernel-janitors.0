From: maximilian attems <janitor@sternwelten.at>
Date: Wed, 01 Sep 2004 19:25:55 +0000
Subject: [Kernel-janitors] [announce] 2.6.9-rc1-bk7-kjt1
Message-Id: <20040901192555.GA7467@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78789944534597134=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kj <kernel-janitors@osdl.org>
Cc: linux-kernel@vger.kernel.org

--===============78789944534597134==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

212 patches in current kjt.
mainly a rsync to mainline, bits got merged :)
things changed, but look below..

here the patch:
http://debian.stro.at/kjt/2.6.9-rc1-kjt1/2.6.9-rc1-bk7-kjt1.patch.bz2

splitted out patches:
http://debian.stro.at/kjt/2.6.9-rc1-kjt1/split/

please test them out.
a++ maks


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
added since 2.6.8-kjt2

list-for-each-drivers_pci_setup-bus2.patch
  From: Domen Puncer <domen@coderock.org>
  Subject: [Kernel-janitors] [patch 12/12] pci_dev_b to list_for_each_entry:   drivers-pci-setup-bus.c
  
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
merged in linus current:
list_for_each-i386pci-common.patch
list_for_each-i386pci-pcbios.patch
list_for_each-pci-setup-bus.patch
list_for_each-usb-audio.patch
list_for_each-usb-core-devices.patch
list_for_each-usb-midi.patch
remove-old-ifdefs-eepro100.patch
msleep-drivers_scsi_eta_pio.patch
msleep-compile-fix.patch
msleep-drivers_scsi_ipr.patch
msleep-drivers_scsi_sata_promise.patch
remove-last-suser-call.patch

merged partially, needs rediff:
list-for-each-entry-sound_core_memory.patch

removed, needs rediff (yet again):
msleep-drivers_message_fusion_mptbase.patch


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reworked for current kjt

joined Domen's patches, added missing include for msleep:
list-for-each-arch_alpha_kernel_pci.patch
list-for-each-arch_i386_pci_i386.patch
list-for-each-arch_ia64_pci_pci.patch
list-for-each-arch_ia64_sn_io_machvec_pci_bus_cvlink.patch
list-for-each-arch_ppc64_kernel_pSeries_pci.patch
list-for-each-arch_ppc64_kernel_pci.patch
list-for-each-arch_ppc64_kernel_pci_dn.patch
list-for-each-arch_ppc_kernel_pci.patch
list-for-each-arch_sparc64_kernel_pci_common.patch
list-for-each-arch_sparc64_kernel_pci_sabre.patch
list-for-each-arch_sparc_kernel_pcic.patch
msleep-drivers_net_gt96100eth.patch
msleep-drivers_char_isicom.patch
msleep-drivers_char_hvc_console.patch
msleep-drivers_isdn_hysdn_boardergo.patch
msleep-drivers_isdn_hysdn_sched.patch
msleep-drivers_pcmcia_sa1100_h3600.patch


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
no more needed (therefor dropped):
macros-correct-comments-net-appletalk.patch
msleep-drivers_block_nbd.patch
msleep-drivers_message_i2o_i2o_block.patch
min-max-arch_ia64_sn_fakeprom_fw-emu.patch


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
todo:
- split kernel_thread() patches from Walter Harms
- check in missing patches from nacc

--===============78789944534597134==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78789944534597134==--
