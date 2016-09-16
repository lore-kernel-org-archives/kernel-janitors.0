From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 16 Sep 2016 10:55:23 +0000
Subject: [PATCH 0/3] constify iio_info structures
Message-Id: <1474023326-24645-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lars-Peter Clausen <lars@metafoo.de>, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>

Constify iio_info structures.

---

 drivers/iio/accel/ssp_accel_sensor.c |    2 +-
 drivers/iio/adc/men_z188_adc.c       |    2 +-
 drivers/iio/gyro/ssp_gyro_sensor.c   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
