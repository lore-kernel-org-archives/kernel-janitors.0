From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 05 Aug 2017 20:37:13 +0000
Subject: [PATCH 0/4] constify thermal_zone_of_device_ops structures
Message-Id: <1501965437-30730-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The thermal_zone_of_device_ops structures are only passed as the fourth
argument to thermal_zone_of_sensor_register, which is declared as const.
Thus the thermal_zone_of_device_ops structures themselves can be const.

Done with the help of Coccinelle.

---

 drivers/thermal/broadcom/bcm2835_thermal.c |    2 +-
 drivers/thermal/qoriq_thermal.c            |    2 +-
 drivers/thermal/samsung/exynos_tmu.c       |    2 +-
 drivers/thermal/zx2967_thermal.c           |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
