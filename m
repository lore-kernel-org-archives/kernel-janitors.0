From: Cyril Roelandt <tipecaml@gmail.com>
Date: Wed, 12 Dec 2012 00:24:49 +0000
Subject: [PATCH 0/5] Use IS_ERR() rather than a NULL check when necessary.
Message-Id: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>

The following five patches replace NULL checks by calls to IS_ERR() when
checking the return values of functions that return ERR_PTR() on error.

Regards,
Cyril Roelandt.
---

Cyril Roelandt (5):
  staging: omap-thermal: fix error check in
    omap_thermal_expose_sensor() and in
    omap_thermal_register_cpu_cooling().
  media: davinci: fix return value check in vpbe_display_reqbufs().
  c2port: fix return value check in duramar2150_c2port_init().
  net: sfc: fix return value check in efx_ptp_probe_channel().
  spi: fix return value check in hspi_probe().

 drivers/media/platform/davinci/vpbe_display.c      |    2 +-
 drivers/misc/c2port/c2port-duramar2150.c           |    2 +-
 drivers/net/ethernet/sfc/ptp.c                     |    2 +-
 drivers/spi/spi-sh-hspi.c                          |    2 +-
 drivers/staging/omap-thermal/omap-thermal-common.c |    4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.7.10.4

