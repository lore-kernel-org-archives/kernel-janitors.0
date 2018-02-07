From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 07 Feb 2018 21:44:21 +0000
Subject: [PATCH 0/2] drm/msm/mdp4: Adjustments for mdp4_kms_init()
Message-Id: <e090cf0c-0bb0-d28c-ac21-9e045993a995@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Jordan Crouse <jcrouse@codeaurora.org>, Jyri Sarha <jsarha@ti.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sushmita Susheelendra <ssusheel@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 7 Feb 2018 22:38:44 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Return directly after a failed kzalloc()

 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.16.1

