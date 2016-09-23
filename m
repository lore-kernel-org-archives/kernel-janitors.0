From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 16:34:44 +0000
Subject: [PATCH 0/3] drm/vmwgfx: Fine-tuning for 13 function implementations
Message-Id: <8de6f7c3-5614-b210-7b2f-66c1aed4279b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, David Airlie <airlied@linux.ie>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 18:24:32 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use kmalloc_array() in vmw_surface_define_ioctl()
  Use memdup_user() rather than duplicating its implementation
  Adjust checks for null pointers in 13 functions

 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 56 ++++++++++++++-------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

-- 
2.10.0

