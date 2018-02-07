From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 07 Feb 2018 21:45:33 +0000
Subject: [PATCH 1/2] drm/msm/mdp4: Delete an error message for a failed memory allocation in mdp4_kms_init()
Message-Id: <242c009d-e801-57ef-cc95-e342776244de@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e090cf0c-0bb0-d28c-ac21-9e045993a995@users.sourceforge.net>
In-Reply-To: <e090cf0c-0bb0-d28c-ac21-9e045993a995@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Jordan Crouse <jcrouse@codeaurora.org>, Jyri Sarha <jsarha@ti.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sushmita Susheelendra <ssusheel@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 7 Feb 2018 22:22:28 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
index f7f087419ed8..5c5965a9d1f9 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
@@ -417,7 +417,6 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 
 	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
 	if (!mdp4_kms) {
-		dev_err(dev->dev, "failed to allocate kms\n");
 		ret = -ENOMEM;
 		goto fail;
 	}
-- 
2.16.1

