From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 07 Feb 2018 21:46:41 +0000
Subject: [PATCH 2/2] drm/msm/mdp4: Return directly after a failed kzalloc() in mdp4_kms_init()
Message-Id: <5ae5dd90-6306-52a4-7601-3fb9dbe2f23a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e090cf0c-0bb0-d28c-ac21-9e045993a995@users.sourceforge.net>
In-Reply-To: <e090cf0c-0bb0-d28c-ac21-9e045993a995-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sushmita Susheelendra <ssusheel-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 7 Feb 2018 22:34:45 +0100

* Return directly after a call of the function "kzalloc" failed
  at the beginning.

* Delete an initialisation and a check (for the local variable "kms")
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
index 5c5965a9d1f9..4f15cd569ee1 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
@@ -411,15 +411,13 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct mdp4_platform_config *config = mdp4_get_config(pdev);
 	struct mdp4_kms *mdp4_kms;
-	struct msm_kms *kms = NULL;
+	struct msm_kms *kms;
 	struct msm_gem_address_space *aspace;
 	int irq, ret;
 
 	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
-	if (!mdp4_kms) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!mdp4_kms)
+		return ERR_PTR(-ENOMEM);
 
 	mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 
@@ -550,8 +548,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 	return kms;
 
 fail:
-	if (kms)
-		mdp4_destroy(kms);
+	mdp4_destroy(kms);
 	return ERR_PTR(ret);
 }
 
-- 
2.16.1

