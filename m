From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:10:55 +0000
Subject: [PATCH v2 00/15] NULL noise fix: allmodconfig (x86_64), entire tree
Message-Id: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The following series does a minor aka. trivial thing, i.e. fixes 'NULL
noise' for allmodconfig (x86_64) for the entire tree.

---
Hannes Eder (15):
      NULL noise: mm/memcontrol.c
      NULL noise: kernel/test_kprobes.c
      NULL noise: fs/reiserfs/inode.c
      NULL noise: fs/super.c
      NULL noise: drivers/video/via/hw.c
      NULL noise: drivers/usb/host/oxu210hp-hcd.c
      NULL noise: drivers/scsi/FlashPoint.c
      NULL noise: drivers/platform/x86/panasonic-laptop.c
      NULL noise: drivers/pci/dmar.c
      NULL noise: drivers/mtd/tests/mtd_*test.c
      NULL noise: drivers/media/dvb/frontends/drx397xD_fw.h
      NULL noise: drivers/gpu/drm/radeon/radeon_*.c
      NULL noise: arch/x86/xen/smp.c
      NULL noise: arch/x86/kernel/amd_iommu*.c
      NULL noise: arch/x86/kernel


 arch/x86/kernel/amd_iommu.c             |    2 +-
 arch/x86/kernel/amd_iommu_init.c        |    2 +-
 arch/x86/kernel/io_apic.c               |    2 +-
 arch/x86/kernel/machine_kexec_32.c      |    2 +-
 arch/x86/kernel/traps.c                 |    2 +-
 arch/x86/xen/smp.c                      |    4 ++--
 drivers/gpu/drm/radeon/r600_cp.c        |    2 +-
 drivers/gpu/drm/radeon/radeon_cp.c      |    2 +-
 drivers/gpu/drm/radeon/radeon_state.c   |    2 +-
 drivers/media/dvb/frontends/drx397xD.c  |    2 +-
 drivers/mtd/tests/mtd_oobtest.c         |   24 ++++++++++++------------
 drivers/mtd/tests/mtd_readtest.c        |    2 +-
 drivers/pci/dmar.c                      |    4 ++--
 drivers/platform/x86/panasonic-laptop.c |    2 +-
 drivers/scsi/FlashPoint.c               |    7 +++----
 drivers/usb/host/oxu210hp-hcd.c         |    2 +-
 drivers/video/via/hw.c                  |    2 +-
 fs/reiserfs/inode.c                     |    2 +-
 fs/super.c                              |    2 +-
 kernel/test_kprobes.c                   |    6 +++---
 mm/memcontrol.c                         |    2 +-
 21 files changed, 38 insertions(+), 39 deletions(-)
