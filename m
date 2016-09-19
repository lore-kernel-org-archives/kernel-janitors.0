From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Sep 2016 15:51:42 +0000
Subject: [PATCH 0/5] GPU-DRM: Fine-tuning for four function implementations
Message-Id: <2fd2da19-d57e-5017-0594-fd52e78493fa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Sep 2016 17:47:37 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kmalloc_array() in drm_legacy_addbufs_pci()
  Replace two kzalloc() calls by kcalloc() in drm_legacy_addbufs_pci()
  Replace a kzalloc() call by kcalloc() in drm_legacy_addbufs_agp()
  Replace a kzalloc() call by kcalloc() in drm_legacy_addbufs_sg()
  Rename a jump label in drm_legacy_mapbufs()

 drivers/gpu/drm/drm_bufs.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

-- 
2.10.0

