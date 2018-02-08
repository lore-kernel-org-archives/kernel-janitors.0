From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 14:35:53 +0000
Subject: [PATCH 0/3] GPU-DRM-GMA500: Adjustments for four function implementations
Message-Id: <079c31b2-a2e6-cf42-cecb-e1e10dd241f6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 15:27:38 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in two functions
  Improve four size determinations
  Delete an unnecessary return statement in oaktrail_crtc_hdmi_dpms()

 drivers/gpu/drm/gma500/framebuffer.c   |  7 ++-----
 drivers/gpu/drm/gma500/oaktrail_hdmi.c | 13 ++++---------
 2 files changed, 6 insertions(+), 14 deletions(-)

-- 
2.16.1

