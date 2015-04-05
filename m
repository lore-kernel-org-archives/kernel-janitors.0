From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Apr 2015 12:06:31 +0000
Subject: [PATCH 11/16] drm/msm/dp: fix error return code
Message-Id: <1428235596-4757-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/msm/edp/edp_ctrl.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
index 0ec5abd..29e52d7 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -1149,12 +1149,13 @@ int msm_edp_ctrl_init(struct msm_edp *edp)
 	ctrl->aux = msm_edp_aux_init(dev, ctrl->base, &ctrl->drm_aux);
 	if (!ctrl->aux || !ctrl->drm_aux) {
 		pr_err("%s:failed to init aux\n", __func__);
-		return ret;
+		return -ENOMEM;
 	}
 
 	ctrl->phy = msm_edp_phy_init(dev, ctrl->base);
 	if (!ctrl->phy) {
 		pr_err("%s:failed to init phy\n", __func__);
+		ret = -ENOMEM;
 		goto err_destory_aux;
 	}
 

