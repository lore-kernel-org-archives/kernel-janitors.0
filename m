From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:35:59 +0000
Subject: [PATCH 00/14] GPU-DRM-OMAP: Fine-tuning for several function implementations
Message-Id: <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 18:28:38 +0200

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (14):
  Use kmalloc_array() in tiler_map_show()
  Replace another kmalloc() call by kmalloc_array() in tiler_map_show()
  Less function calls in tiler_map_show() after error detection
  Delete an unnecessary variable initialisation in tiler_map_show()
  Improve a size determination in dmm_txn_append()
  Improve a size determination in omap_dmm_probe()
  Rename a jump label in omap_dmm_probe()
  Rename a jump label in dmm_txn_commit()
  Delete an unnecessary variable initialisation in dmm_txn_commit()
  Use kmalloc_array() in omap_gem_attach_pages()
  Replace a kzalloc() call by kcalloc() in omap_gem_attach_pages()
  Move a variable assignment in omap_gem_attach_pages()
  Rename a jump label in omap_gem_new_dmabuf()
  Rename a jump label in four functions

 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 58 ++++++++++++++++----------------
 drivers/gpu/drm/omapdrm/omap_gem.c       | 44 +++++++++++-------------
 2 files changed, 49 insertions(+), 53 deletions(-)

-- 
2.10.0

