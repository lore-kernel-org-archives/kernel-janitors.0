From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Feb 2018 21:22:04 +0000
Subject: [PATCH 0/2] GPU-DRM-TILCDC: Adjustments for seven function implementations
Message-Id: <a7c7cebb-f4c9-04b7-5507-e41f8ebfb5f9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2018 22:17:44 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in seven functions
  Use common error handling code in of_get_panel_info()

 drivers/gpu/drm/tilcdc/tilcdc_crtc.c   |  4 +---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c    |  4 +---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c  | 21 +++++++--------------
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c |  8 ++------
 4 files changed, 11 insertions(+), 26 deletions(-)

-- 
2.16.1

