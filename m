From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Mon, 27 Mar 2006 23:52:32 +0000
Subject: [KJ] 2.6.16-post section mismatches
Message-Id: <20060327155232.345bed3d.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32406579807694857=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32406579807694857==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Looks like there is a ton of (possible) work here if anyone is
interested.  This is from 2.6.16-git13.


WARNING: arch/x86_64/kernel/cpuid.o - Section mismatch: reference to .init.text: from .data between 'cpuid_class_cpu_notifier' (at offset 0x0) and 'cpuid_fops'
WARNING: arch/x86_64/kernel/msr.o - Section mismatch: reference to .init.text: from .data between 'msr_class_cpu_notifier' (at offset 0x0) and 'msr_fops'
WARNING: drivers/acpi/processor.o - Section mismatch: reference to .init.data: from .text between 'acpi_processor_power_init' (at offset 0x2630) and 'acpi_processor_power_exit'
WARNING: drivers/atm/zatm.o - Section mismatch: reference to .init.data: from .data between 'zatm_driver' (at offset 0x18) and 'err_txt'
WARNING: drivers/char/tpm/tpm_infineon.o - Section mismatch: reference to .init.text:tpm_inf_pnp_probe from .data between 'tpm_inf_pnp' (at offset 0x18) and 'tpm_inf'
WARNING: drivers/char/tpm/tpm_infineon.o - Section mismatch: reference to .exit.text:tpm_inf_pnp_remove from .data between 'tpm_inf_pnp' (at offset 0x20) and 'tpm_inf'
WARNING: drivers/i2c/busses/i2c-ali1563.o - Section mismatch: reference to .init.data: from .data between 'ali1563_pci_driver' (at offset 0x18) and 'ali1563_adapter'
WARNING: drivers/i2c/busses/i2c-i810.o - Section mismatch: reference to .init.data: from .data between 'i810_driver' (at offset 0x18) and 'i810_i2c_adapter'
WARNING: drivers/i2c/busses/i2c-savage4.o - Section mismatch: reference to .init.data: from .data between 'savage4_driver' (at offset 0x18) and 'savage4_i2c_adapter'
WARNING: drivers/i2c/busses/i2c-sis5595.o - Section mismatch: reference to .init.data: from .data between 'sis5595_driver' (at offset 0x38) and 'sis5595_adapter'
WARNING: drivers/i2c/busses/i2c-sis630.o - Section mismatch: reference to .init.data: from .data between 'sis630_driver' (at offset 0x38) and 'sis630_adapter'
WARNING: drivers/i2c/busses/i2c-via.o - Section mismatch: reference to .init.data: from .data between 'vt586b_driver' (at offset 0x18) and 'vt586b_adapter'
WARNING: drivers/i2c/busses/i2c-voodoo3.o - Section mismatch: reference to .init.data: from .data between 'voodoo3_driver' (at offset 0x18) and 'voodoo3_ddc_adapter'
WARNING: drivers/ide/pci/aec62xx.o - Section mismatch: reference to .init.text:aec62xx_init_one from .data between 'driver' (at offset 0xe0) and 'aec6xxx_34_base'
WARNING: drivers/ide/pci/alim15x3.o - Section mismatch: reference to .init.text:alim15x3_init_one from .data between 'driver' (at offset 0x80) and 'channel_status'
WARNING: drivers/ide/pci/amd74xx.o - Section mismatch: reference to .init.text:amd74xx_probe from .data between 'driver' (at offset 0x280) and 'amd_ide_chips'
WARNING: drivers/ide/pci/atiixp.o - Section mismatch: reference to .init.text:atiixp_init_one from .data between 'driver' (at offset 0xa0) and 'mdma_timing'
WARNING: drivers/ide/pci/cmd64x.o - Section mismatch: reference to .init.text:cmd64x_init_one from .data after 'driver' (at offset 0xc0)
WARNING: drivers/ide/pci/cs5520.o - Section mismatch: reference to .init.text:cs5520_init_one from .data between 'driver' (at offset 0x80) and 'cs5520_pio_clocks'
WARNING: drivers/ide/pci/cs5530.o - Section mismatch: reference to .init.text:cs5530_init_one from .data between 'driver' (at offset 0x60) and 'cs5530_pio_timings'
WARNING: drivers/ide/pci/cy82c693.o - Section mismatch: reference to .init.text:cy82c693_init_one from .data after 'driver' (at offset 0x60)
WARNING: drivers/ide/pci/generic.o - Section mismatch: reference to .init.text:generic_init_one from .data after 'driver' (at offset 0x220)
WARNING: drivers/ide/pci/hpt34x.o - Section mismatch: reference to .init.text:hpt34x_init_one from .data between 'driver' (at offset 0x60) and 'chipset_names.18859'
WARNING: drivers/ide/pci/hpt366.o - Section mismatch: reference to .init.text:hpt366_init_one from .data between 'driver' (at offset 0x100) and 'bad_ata33'
WARNING: drivers/ide/pci/it821x.o - Section mismatch: reference to .init.text:it821x_init_one from .data between 'driver' (at offset 0xa0) and 'mode.19102'
WARNING: drivers/ide/pci/ns87415.o - Section mismatch: reference to .init.text:ns87415_init_one from .data after 'driver' (at offset 0x60)
WARNING: drivers/ide/pci/opti621.o - Section mismatch: reference to .init.text:opti621_init_one from .data after 'driver' (at offset 0x80)
WARNING: drivers/ide/pci/pdc202xx_new.o - Section mismatch: reference to .init.text:pdc202new_init_one from .data between 'driver' (at offset 0x120) and 'pdc_quirk_drives'
WARNING: drivers/ide/pci/pdc202xx_old.o - Section mismatch: reference to .init.text:pdc202xx_init_one from .data between 'driver' (at offset 0xe0) and 'pdc_quirk_drives'
WARNING: drivers/ide/pci/piix.o - Section mismatch: reference to .init.text:piix_init_one from .data after 'driver' (at offset 0x360)
WARNING: drivers/ide/pci/rz1000.o - Section mismatch: reference to .init.text:rz1000_init_one from .data after 'driver' (at offset 0x80)
WARNING: drivers/ide/pci/sc1200.o - Section mismatch: reference to .init.text:sc1200_init_one from .data between 'driver' (at offset 0x60) and 'modes.18929'
WARNING: drivers/ide/pci/serverworks.o - Section mismatch: reference to .init.text:svwks_init_one from .data between 'driver' (at offset 0xe0) and 'svwks_bad_ata100'
WARNING: drivers/ide/pci/siimage.o - Section mismatch: reference to .init.text:siimage_init_one from .data after 'driver' (at offset 0xa0)
WARNING: drivers/ide/pci/sis5513.o - Section mismatch: reference to .init.text:sis5513_init_one from .data between 'driver' (at offset 0x80) and 'rco_time_value'
WARNING: drivers/ide/pci/slc90e66.o - Section mismatch: reference to .init.text:slc90e66_init_one from .data after 'driver' (at offset 0x60)
WARNING: drivers/ide/pci/triflex.o - Section mismatch: reference to .init.text:triflex_init_one from .data after 'driver' (at offset 0x60)
WARNING: drivers/ide/pci/trm290.o - Section mismatch: reference to .init.text:trm290_init_one from .data after 'driver' (at offset 0x60)
WARNING: drivers/ide/pci/via82cxxx.o - Section mismatch: reference to .init.text:via_init_one from .data between 'driver' (at offset 0xa0) and 'via_isa_bridges'
WARNING: drivers/infiniband/hw/mthca/ib_mthca.o - Section mismatch: reference to .exit.text:mthca_unmap_eq_icm from .text between 'mthca_free_icms' (at offset 0x8e) and 'mthca_close_hca'
WARNING: drivers/mmc/sdhci.o - Section mismatch: reference to .init.data: from .data between 'sdhci_driver' (at offset 0x18) and 'sdhci_ops'
WARNING: drivers/net/cassini.o - Section mismatch: reference to .init.data: from .data between 'cas_driver' (at offset 0x2398) and 'cas_prog_workaroundtab'
WARNING: drivers/net/chelsio/cxgb.o - Section mismatch: reference to .init.text:init_one from .data between 'driver' (at offset 0x40) and 't1_ethtool_ops'
WARNING: drivers/net/chelsio/cxgb.o - Section mismatch: reference to .exit.text:remove_one from .data between 'driver' (at offset 0x48) and 't1_ethtool_ops'
WARNING: drivers/net/forcedeth.o - Section mismatch: reference to .init.text:nv_probe from .data between 'driver' (at offset 0x2a0) and 'ops'
WARNING: drivers/net/forcedeth.o - Section mismatch: reference to .exit.text:nv_remove from .data between 'driver' (at offset 0x2a8) and 'ops'
WARNING: drivers/net/ns83820.o - Section mismatch: reference to .init.text:ns83820_init_one from .data between 'driver' (at offset 0x80) and 'ops'
WARNING: drivers/net/ns83820.o - Section mismatch: reference to .exit.text:ns83820_remove_one from .data between 'driver' (at offset 0x88) and 'ops'
WARNING: drivers/net/s2io.o - Section mismatch: reference to .init.data: from .data between 's2io_driver' (at offset 0x258) and 'rxd_count'
WARNING: drivers/net/sis190.o - Section mismatch: reference to .init.data: from .data between 'sis190_pci_driver' (at offset 0x38) and 'sis190_ethtool_ops'
WARNING: drivers/net/via-velocity.o - Section mismatch: reference to .init.data: from .data between 'velocity_driver' (at offset 0x6f8) and 'msglevel'
WARNING: drivers/net/wan/farsync.o - Section mismatch: reference to .init.data: from .data between 'fst_driver' (at offset 0xb8) and 'fst_tx_task'
WARNING: drivers/net/wan/pc300.o - Section mismatch: reference to .init.data: from .data between 'cpc_driver' (at offset 0x18) and 'rcsid'
WARNING: drivers/net/wan/pci200syn.o - Section mismatch: reference to .init.data: from .data between 'pci200_pci_driver' (at offset 0x38) and 'devname'
WARNING: drivers/net/wan/wanxl.o - Section mismatch: reference to .init.data: from .data between 'wanxl_pci_driver' (at offset 0x18) and 'firmware'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.text: from .text between 'parport_pc_probe_port' (at offset 0x1a34) and 'parport_pc_pci_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.text: from .text between 'parport_pc_probe_port' (at offset 0x1a87) and 'parport_pc_pci_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.text: from .text between 'parport_pc_probe_port' (at offset 0x1bea) and 'parport_pc_pci_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.text: from .text between 'parport_pc_probe_port' (at offset 0x1c04) and 'parport_pc_pci_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.text: from .text between 'parport_pc_probe_port' (at offset 0x1c67) and 'parport_pc_pci_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.text: from .text between 'parport_pc_probe_port' (at offset 0x1c8c) and 'parport_pc_pci_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.data:superios from .text between 'parport_pc_probe_port' (at offset 0x1d50) and 'parport_pc_pci_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.data: from .text between 'parport_pc_probe_port' (at offset 0x1d6e) and 'parport_pc_pci_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.data: from .text between 'parport_pc_pci_probe' (at offset 0x255b) and 'parport_pc_pnp_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.data: from .text between 'parport_pc_pci_probe' (at offset 0x2593) and 'parport_pc_pnp_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.data: from .text between 'parport_pc_pci_probe' (at offset 0x259b) and 'parport_pc_pnp_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.data:cards from .text between 'parport_pc_pci_probe' (at offset 0x2626) and 'parport_pc_pnp_probe'
WARNING: drivers/parport/parport_pc.o - Section mismatch: reference to .init.data: from .text between 'parport_pc_pci_probe' (at offset 0x2636) and 'parport_pc_pnp_probe'
WARNING: drivers/scsi/3w-9xxx.o - Section mismatch: reference to .init.data: from .data between 'twa_driver' (at offset 0x18) and 'twa_error_table'
WARNING: drivers/scsi/3w-xxxx.o - Section mismatch: reference to .init.data: from .data between 'tw_driver' (at offset 0x18) and 'tw_sense_table'
WARNING: drivers/scsi/gdth.o - Section mismatch: reference to .init.text:gdth_detect from .data between 'driver_template' (at offset 0x270) and 'async_cache_tab'
WARNING: drivers/scsi/megaraid/megaraid_mbox.o - Section mismatch: reference to .init.text:megaraid_probe_one from .data between 'megaraid_pci_driver_g' (at offset 0x2e0) and 'megaraid_mbox_version'
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x0)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x8)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x10)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x18)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x20)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x28)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x30)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x38)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x40)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x48)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x50)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x58)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x60)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x68)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x70)
WARNING: drivers/scsi/sd_mod.o - Section mismatch: reference to .exit.text: from .rodata after '' (at offset 0x78)
WARNING: drivers/scsi/sym53c8xx_2/sym53c8xx.o - Section mismatch: reference to .init.data: from .data between 'sym2_driver' (at offset 0x2558) and 'sym2_template'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text: from .data between 'pci_serial_quirks' (at offset 0x12f8) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:pci_inteli960ni_init from .data between 'pci_serial_quirks' (at offset 0x1320) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:pci_plx9050_init from .data between 'pci_serial_quirks' (at offset 0x1348) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:pci_plx9050_init from .data between 'pci_serial_quirks' (at offset 0x1370) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:pci_plx9050_init from .data between 'pci_serial_quirks' (at offset 0x1398) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:pci_plx9050_init from .data between 'pci_serial_quirks' (at offset 0x13c0) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:pci_plx9050_init from .data between 'pci_serial_quirks' (at offset 0x13e8) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:sbs_init from .data between 'pci_serial_quirks' (at offset 0x1410) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:sbs_init from .data between 'pci_serial_quirks' (at offset 0x1438) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:sbs_init from .data between 'pci_serial_quirks' (at offset 0x1460) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:sbs_init from .data between 'pci_serial_quirks' (at offset 0x1488) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:pci_timedia_init from .data between 'pci_serial_quirks' (at offset 0x1528) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:pci_xircom_init from .data between 'pci_serial_quirks' (at offset 0x1578) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .init.text:pci_netmos_init from .data between 'pci_serial_quirks' (at offset 0x15a0) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .exit.text:pci_plx9050_exit from .data between 'pci_serial_quirks' (at offset 0x1358) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .exit.text:pci_plx9050_exit from .data between 'pci_serial_quirks' (at offset 0x1380) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .exit.text:pci_plx9050_exit from .data between 'pci_serial_quirks' (at offset 0x13a8) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .exit.text:pci_plx9050_exit from .data between 'pci_serial_quirks' (at offset 0x13d0) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .exit.text:pci_plx9050_exit from .data between 'pci_serial_quirks' (at offset 0x13f8) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .exit.text:sbs_exit from .data between 'pci_serial_quirks' (at offset 0x1420) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .exit.text:sbs_exit from .data between 'pci_serial_quirks' (at offset 0x1448) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .exit.text:sbs_exit from .data between 'pci_serial_quirks' (at offset 0x1470) and 'timedia_eight_port'
WARNING: drivers/serial/8250_pci.o - Section mismatch: reference to .exit.text:sbs_exit from .data between 'pci_serial_quirks' (at offset 0x1498) and 'timedia_eight_port'
WARNING: drivers/video/macmodes.o - Section mismatch: reference to .init.text:mac_find_mode from __ksymtab between '__ksymtab_mac_find_mode' (at offset 0x0) and '__ksymtab_mac_map_monitor_sense'
WARNING: drivers/video/pm2fb.o - Section mismatch: reference to .init.data: from .text after 'pm2fb_set_par' (at offset 0xd5d)
WARNING: drivers/video/pm2fb.o - Section mismatch: reference to .init.data: from .text after 'pm2fb_set_par' (at offset 0xd82)
WARNING: drivers/video/radeonfb.o - Section mismatch: reference to .init.data: from .text after 'radeonfb_pci_register' (at offset 0x19fb)
WARNING: drivers/video/radeonfb.o - Section mismatch: reference to .init.data: from .text after 'radeonfb_pci_register' (at offset 0x1a0f)
WARNING: drivers/video/savage/savagefb.o - Section mismatch: reference to .init.text: from .text between 'savagefb_resume' (at offset 0x232b) and 'savage4_gpio_getscl'
WARNING: drivers/video/savage/savagefb.o - Section mismatch: reference to .init.text: from .exit.text after 'savagefb_remove' (at offset 0x66)
WARNING: drivers/video/savage/savagefb.o - Section mismatch: reference to .init.text: from .exit.text after 'savagefb_remove' (at offset 0x6e)
WARNING: drivers/video/savage/savagefb.o - Section mismatch: reference to .init.data:savagefb_devices from .data between 'savagefb_driver' (at offset 0x38) and 'savagefb_ops'
WARNING: drivers/video/sis/sisfb.o - Section mismatch: reference to .init.data: from .data between 'sisfb_driver' (at offset 0xf8) and 'sisfb_ops'
WARNING: net/ipv4/netfilter/ip_conntrack.o - Section mismatch: reference to .init.text:ip_conntrack_init from .text between 'init_or_cleanup' (at offset 0x7ea) and '__hash_conntrack'
WARNING: net/ipv4/netfilter/iptable_nat.o - Section mismatch: reference to .init.text:ip_nat_rule_init from .text between 'init_or_cleanup' (at offset 0x455) and 'nat_decode_session'


---
~Randy

--===============32406579807694857==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32406579807694857==--
