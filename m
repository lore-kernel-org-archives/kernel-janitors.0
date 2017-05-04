From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 04 May 2017 20:10:45 +0000
Subject: [PATCH 0/9] Drop unnecessary static
Message-Id: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com, linux-omap@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-input@vger.kernel.org, linux-iio@vger.kernel.org

These patches fix cases where there is a static on a local variable, but
the variable is either first initialized or never used, on every possible
execution path through the function.  The static has no benefit, and
dropping it reduces the code size.

---

 drivers/block/drbd/drbd_nl.c            |    2 +-
 drivers/clocksource/timer-fttmr010.c    |    2 +-
 drivers/iio/accel/hid-sensor-accel-3d.c |    2 +-
 drivers/mfd/max8925-i2c.c               |    2 +-
 drivers/mfd/twl4030-irq.c               |    2 +-
 drivers/mtd/chips/cfi_cmdset_0020.c     |    2 +-
 drivers/mtd/maps/physmap_of_gemini.c    |    2 +-
 drivers/power/supply/axp20x_usb_power.c |    2 +-
 drivers/regulator/palmas-regulator.c    |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)
