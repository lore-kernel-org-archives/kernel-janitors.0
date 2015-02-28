From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:02:23 +0000
Subject: [PATCH 0/7] mtd: various fixes caught by Coverity
Message-Id: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>, Masahiro Yamada <yamada.m@jp.panasonic.com>, Kyungmin Park <kyungmin.park@samsung.com>, Brian Norris <computersforpeace@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

Several unrelated MTD fixes inspired by Coverity Scan results. I couldn't test
all of them, but they're all pretty obvious.

Brian Norris (7):
  mtd: docg3: drop dead code
  mtd: onenand: drop dead code
  mtd: tests: fix more potential integer overflows
  mtd: nand: fixup bounds checks for nand_{lock,unlock}()
  mtd: nand: denali: drop dead code
  mtd: blkdevs: remove dead code
  mtd: nand: fully initialize mtd_oob_ops

 drivers/mtd/devices/docg3.c        |  2 --
 drivers/mtd/mtd_blkdevs.c          |  3 ---
 drivers/mtd/nand/denali.c          |  3 ---
 drivers/mtd/nand/nand_base.c       | 12 ++++++------
 drivers/mtd/onenand/onenand_base.c | 12 +++---------
 drivers/mtd/tests/oobtest.c        |  2 +-
 drivers/mtd/tests/speedtest.c      |  2 +-
 drivers/mtd/tests/stresstest.c     |  4 ++--
 drivers/mtd/tests/subpagetest.c    |  4 ++--
 drivers/mtd/tests/torturetest.c    |  8 ++++----
 10 files changed, 19 insertions(+), 33 deletions(-)

-- 
2.1.0

