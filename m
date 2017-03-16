From: "Andrew F. Davis" <afd@ti.com>
Date: Thu, 16 Mar 2017 15:19:52 +0000
Subject: [PATCH 0/3] Add public w1 driver interface
Message-Id: <20170316151955.10710-1-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Hi All,

As part of continuing work to cleanup the BQ27xxx driver I am attempting
to remove the need for the platform driver interface. For this we first
need the w1 subsystem to act more like a traditional bus subsystem
and allow drivers for attached devices to live outside of the w1
directory.

The first couple patches are trivial, the last a bit more involved
but should make no functional change, just a re-organization of
header files.

Thanks,
Andrew

Andrew F. Davis (3):
  w1: Use kernel common min() implementation
  w1: Remove unneeded use of assert() and remove w1_log.h
  w1: Add subsystem kernel public interface

 MAINTAINERS                        |   1 +
 drivers/w1/masters/ds1wm.c         |   3 +-
 drivers/w1/masters/ds2482.c        |   3 +-
 drivers/w1/masters/ds2490.c        |   3 +-
 drivers/w1/masters/matrox_w1.c     |   9 +--
 drivers/w1/masters/mxc_w1.c        |   3 +-
 drivers/w1/masters/omap_hdq.c      |   3 +-
 drivers/w1/masters/w1-gpio.c       |   3 +-
 drivers/w1/slaves/w1_bq27000.c     |   6 +-
 drivers/w1/slaves/w1_ds2405.c      |   5 +-
 drivers/w1/slaves/w1_ds2406.c      |   6 +-
 drivers/w1/slaves/w1_ds2408.c      |   6 +-
 drivers/w1/slaves/w1_ds2413.c      |   6 +-
 drivers/w1/slaves/w1_ds2423.c      |   6 +-
 drivers/w1/slaves/w1_ds2431.c      |   6 +-
 drivers/w1/slaves/w1_ds2433.c      |   6 +-
 drivers/w1/slaves/w1_ds2760.c      |   7 ++-
 drivers/w1/slaves/w1_ds2780.c      |   7 ++-
 drivers/w1/slaves/w1_ds2781.c      |   7 ++-
 drivers/w1/slaves/w1_ds28e04.c     |   6 +-
 drivers/w1/slaves/w1_smem.c        |   7 ++-
 drivers/w1/slaves/w1_therm.c       |  10 +++-
 drivers/w1/w1.c                    |   7 +--
 drivers/w1/w1_family.c             |   3 +-
 drivers/w1/w1_family.h             |  97 -------------------------------
 drivers/w1/w1_int.c                |   4 +-
 drivers/w1/w1_int.h                |  27 ---------
 drivers/w1/w1_internal.h           |  87 ++++++++++++++++++++++++++++
 drivers/w1/w1_io.c                 |   3 +-
 drivers/w1/w1_log.h                |  31 ----------
 drivers/w1/w1_netlink.c            |   7 +--
 drivers/w1/w1_netlink.h            |   2 +-
 {drivers/w1 => include/linux}/w1.h | 116 ++++++++++++++++---------------------
 33 files changed, 205 insertions(+), 298 deletions(-)
 delete mode 100644 drivers/w1/w1_family.h
 delete mode 100644 drivers/w1/w1_int.h
 create mode 100644 drivers/w1/w1_internal.h
 delete mode 100644 drivers/w1/w1_log.h
 rename {drivers/w1 => include/linux}/w1.h (76%)

-- 
2.11.0

