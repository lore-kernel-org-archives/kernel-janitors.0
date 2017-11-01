From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 01 Nov 2017 15:38:31 +0000
Subject: [PATCH v2 0/2] R-Car Display Unit: Fine-tuning for some function implementations
Message-Id: <26b811dd-9dfa-cfd3-7d4d-e7f1c852b8ed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201710262044.165nsaJp%fengguang.wu@intel.com>
In-Reply-To: <201710262044.165nsaJp%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kbuild test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kbuild-all@01.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 16:23:45 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
  drm/rcar-du: Adjust 14 checks for null pointers
---

v2:
Advice was taken into account from the first round of corresponding
source code review.

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c     |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 24 ++++++++++++------------
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c   |  6 +++---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  6 +++---
 8 files changed, 23 insertions(+), 23 deletions(-)

-- 
2.14.3

