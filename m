From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 07:33:12 +0000
Subject: [drm:drm-opt-pwr 83/84] ERROR: "nouveau_drm_resume" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
Message-Id: <20120912073312.GB26877@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dave,

FYI, kernel build failed on

tree:   git://people.freedesktop.org/~airlied/linux.git drm-opt-pwr
head:   75c2c97fd7c783f4f06423a41671f61840e65fa5
commit: e25e78a2514cd70ecc2b3597f7fefa530c731db1 [83/84] nouveau: convert to dev_pm_ops
config: i386-allmodconfig

All related error/warning messages:

ERROR: "nouveau_drm_resume" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
ERROR: "nouveau_drm_suspend" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!

drivers/gpu/drm/nouveau/nouveau_drm.c:394:1: sparse: symbol 'nouveau_do_suspend' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nouveau_drm.c:435:5: sparse: symbol 'nouveau_pmops_suspend' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nouveau_drm.c:456:1: sparse: symbol 'nouveau_do_resume' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nouveau_drm.c:482:5: sparse: symbol 'nouveau_pmops_resume' was not declared. Should it be static?

WARNING: drivers/net/ethernet/3com/3c509.o(.data+0x190): Section mismatch in reference from the variable el3_eisa_driver to the function .init.text:el3_eisa_probe()
The variable el3_eisa_driver references
the function __init el3_eisa_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/ethernet/3com/3c59x.o(.data+0xd8): Section mismatch in reference from the variable vortex_eisa_driver to the function .init.text:vortex_eisa_probe()
The variable vortex_eisa_driver references
the function __init vortex_eisa_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/ethernet/8390/ne3210.o(.data+0x40): Section mismatch in reference from the variable ne3210_eisa_driver to the function .init.text:ne3210_eisa_probe()
The variable ne3210_eisa_driver references
the function __init ne3210_eisa_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/ethernet/amd/depca.o(.data+0x34): Section mismatch in reference from the variable depca_eisa_driver to the function .init.text:depca_eisa_probe()
The variable depca_eisa_driver references
the function __init depca_eisa_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/ethernet/amd/depca.o(.devinit.text+0x2c): Section mismatch in reference from the function depca_isa_probe() to the function .init.text:depca_common_init()
The function __devinit depca_isa_probe() references
a function __init depca_common_init().
If depca_common_init is only used by depca_isa_probe then
annotate depca_common_init with a matching annotation.

WARNING: drivers/net/ethernet/amd/depca.o(.devinit.text+0x5f): Section mismatch in reference from the function depca_isa_probe() to the function .init.text:depca_shmem_probe()
The function __devinit depca_isa_probe() references
a function __init depca_shmem_probe().
If depca_shmem_probe is only used by depca_isa_probe then
annotate depca_shmem_probe with a matching annotation.

WARNING: drivers/net/ethernet/amd/depca.o(.devinit.text+0xb2): Section mismatch in reference from the function depca_isa_probe() to the function .init.text:depca_hw_init()
The function __devinit depca_isa_probe() references
a function __init depca_hw_init().
If depca_hw_init is only used by depca_isa_probe then
annotate depca_hw_init with a matching annotation.

WARNING: drivers/net/ethernet/dec/tulip/de4x5.o(.data+0xcc): Section mismatch in reference from the variable de4x5_eisa_driver to the function .init.text:de4x5_eisa_probe()
The variable de4x5_eisa_driver references
the function __init de4x5_eisa_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/net/ethernet/hp/hp100.o(.data+0x70): Section mismatch in reference from the variable hp100_eisa_driver to the function .init.text:hp100_eisa_probe()
The variable hp100_eisa_driver references
the function __init hp100_eisa_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/scsi/sim710.o(.data+0x4c): Section mismatch in reference from the variable sim710_eisa_driver to the function .init.text:sim710_eisa_probe()
The variable sim710_eisa_driver references
the function __init sim710_eisa_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/staging/ipack/bridges/tpci200.o(.data+0xc): Section mismatch in reference from the variable tpci200_pci_drv to the variable .devinit.rodata:tpci200_idtable
The variable tpci200_pci_drv references
the variable __devinitconst tpci200_idtable
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/staging/ipack/bridges/tpci200.o(.data+0x14): Section mismatch in reference from the variable tpci200_pci_drv to the function .devexit.text:tpci200_pci_remove()
The variable tpci200_pci_drv references
the function __devexit tpci200_pci_remove()
If the reference is valid then annotate the
variable with __exit* (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
