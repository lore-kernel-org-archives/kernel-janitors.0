From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 16:00:08 +0000
Subject: [PATCH 0/2] R-Car Display Unit: Fine-tuning for some function implementations
Message-Id: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 17:55:43 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common error handling code in rcar_du_encoders_init()
  Adjust 14 checks for null pointers

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c     |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 22 +++++++++++-----------
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c   |  6 +++---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  6 +++---
 8 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.14.3

