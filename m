From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 08:30:18 +0000
Subject: [PATCH 0/4] GPU-DRM-TILCDC: Fine-tuning for two function implementations
Message-Id: <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 10:25:43 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use kmalloc_array()
  Return directly after a failed kfree_table_init() in tilcdc_convert_slave_node()
  Less function calls in tilcdc_convert_slave_node() after error detection
  Delete unnecessary variable initialisations

 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c | 36 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 16 deletions(-)

-- 
2.10.0

