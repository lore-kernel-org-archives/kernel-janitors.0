From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 06:18:13 +0000
Subject: [PATCH 0/4] GPU-DRM-QXL: Fine-tuning for three function implementations
Message-Id: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Tejun Heo <tj@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 08:08:08 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use kmalloc_array() in qxl_device_init()
  Move three assignments in qxl_device_init()
  Improve a size determination in qxl_driver_load()
  Adjust checks for null pointers in three functions

 drivers/gpu/drm/qxl/qxl_kms.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

-- 
2.10.0

