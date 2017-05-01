From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 May 2017 16:45:10 +0000
Subject: [PATCH 0/4] drm/dp: Fine-tuning for three function implementations
Message-Id: <1949e36b-5039-a7b6-5774-6ada7eb05ea6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 18:38:08 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use seq_putc() in drm_dp_mst_dump_topology()
  Combine two seq_printf() calls into one call in drm_dp_mst_dump_topology()
  Replace six seq_printf() calls by seq_puts() in drm_dp_mst_dump_topology()
  Adjust four checks for null pointers

 drivers/gpu/drm/drm_dp_mst_topology.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

-- 
2.12.2

