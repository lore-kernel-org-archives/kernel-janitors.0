From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 11:20:06 +0000
Subject: [PATCH 0/2] GPU-DRM-Etnaviv: Fine-tuning for two function implementations
Message-Id: <6652b09b-393b-01db-a0d4-de53dce8994e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 13:16:15 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use seq_putc() in etnaviv_buffer_dump()
  Delete an error message for a failed memory allocation in etnaviv_bind()

 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.12.2

