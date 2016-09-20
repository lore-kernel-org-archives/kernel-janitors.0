From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 08:54:06 +0000
Subject: [PATCH 0/6] GPU-DRM-GMA500: Fine-tuning for two function implementations
Message-Id: <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 10:48:04 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Use kmalloc_array() in mid_get_vbt_data_r10()
  Rename a jump label in mid_get_vbt_data_r10()
  Move a variable assignment in mid_get_vbt_data_r10()
  Fix indentation for a function call parameter in mid_get_vbt_data_r10()
  One error message less for a GCT revision mismatch in mid_get_vbt_data()
  Rename a jump label in mid_get_vbt_data()

 drivers/gpu/drm/gma500/mid_bios.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

-- 
2.10.0

