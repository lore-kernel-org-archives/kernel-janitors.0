From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:00:43 +0000
Subject: [PATCH 00/16] fix sparse warnings: Using plain integer as NULL pointer
Message-Id: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The following series fix the sparse warning 'Using plain integer as
NULL pointer' all over the kernel tree.  This series is based on
linux-next/next-20090220.

---

Hannes Eder (16):
      ALSA: msnd: fix sparse warning: Using plain integer as NULL pointer
      ipv6: fix sparse warning: Using plain integer as NULL pointer
      memcg: fix sparse warning: Using plain integer as NULL pointer
      kprobes: fix sparse warnings: Using plain integer as NULL pointer
      reiserfs: fix sparse warning: Using plain integer as NULL pointer
      fs/super.c: fix sparse warning: Using plain integer as NULL pointer
      viafb: fix sparse warning: Using plain integer as NULL pointer
      usb host: fix sparse warning: Using plain integer as NULL pointer
      [SCSI] FlashPoint: fix sparse warnings: Using plain integer as NULL pointer
      panasonic-laptop: fix sparse warning: Using plain integer as NULL pointer
      MTD: tests: fix sparse warnings: Using plain integer as NULL pointer
      dvb: fix sparse warnings: Using plain integer as NULL pointer
      ide: fix sparse warnings: Using plain integer as NULL pointer
      drm: radeon: fix sparse warnings: Using plain integer as NULL pointer
      x86, numa_32.c: fix sparse warning: Using plain integer as NULL pointer
      kexec/i386: fix sparse warnings: Using plain integer as NULL pointer


 arch/x86/kernel/machine_kexec_32.c      |    2 +-
 arch/x86/kernel/traps.c                 |    2 +-
 arch/x86/mm/numa_32.c                   |    2 +-
 drivers/gpu/drm/radeon/radeon_cp.c      |    2 +-
 drivers/gpu/drm/radeon/radeon_state.c   |    2 +-
 drivers/ide/ide-disk_proc.c             |    2 +-
 drivers/ide/ide-floppy_proc.c           |    2 +-
 drivers/ide/ide-proc.c                  |    2 +-
 drivers/ide/ide-tape.c                  |    2 +-
 drivers/media/dvb/frontends/drx397xD.c  |    2 +-
 drivers/mtd/tests/mtd_oobtest.c         |   24 ++++++++++++------------
 drivers/mtd/tests/mtd_readtest.c        |    2 +-
 drivers/platform/x86/panasonic-laptop.c |    2 +-
 drivers/scsi/FlashPoint.c               |    7 +++----
 drivers/usb/host/oxu210hp-hcd.c         |    2 +-
 drivers/video/via/hw.c                  |    2 +-
 fs/reiserfs/inode.c                     |    2 +-
 fs/super.c                              |    2 +-
 kernel/test_kprobes.c                   |    6 +++---
 mm/memcontrol.c                         |    2 +-
 net/ipv6/xfrm6_state.c                  |    2 +-
 sound/isa/msnd/msnd_pinnacle.c          |    2 +-
 22 files changed, 37 insertions(+), 38 deletions(-)
