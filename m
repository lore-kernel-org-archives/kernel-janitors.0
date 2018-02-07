From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 07 Feb 2018 21:00:11 +0000
Subject: [PATCH] drm/msm/mdp5: Delete an error message for a failed memory allocation in two functions
Message-Id: <7726fab0-dbe4-9d70-36a8-17d6078a39ce@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Rob Clark <robdclark@gmail.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 7 Feb 2018 21:50:07 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c | 1 -
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c
index 439e0a300e25..daa224df4457 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c
@@ -717,7 +717,6 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 
 	ctl_mgr = kzalloc(sizeof(*ctl_mgr), GFP_KERNEL);
 	if (!ctl_mgr) {
-		dev_err(dev->dev, "failed to allocate CTL manager\n");
 		ret = -ENOMEM;
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
index 3e9bba4d6624..5bf54ca7ab0a 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
@@ -844,10 +844,8 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
 			continue;
 
 		intf = kzalloc(sizeof(*intf), GFP_KERNEL);
-		if (!intf) {
-			dev_err(dev->dev, "failed to construct INTF%d\n", i);
+		if (!intf)
 			return -ENOMEM;
-		}
 
 		intf->num = i;
 		intf->type = intf_types[i];
-- 
2.16.1

