From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 14:40:14 +0000
Subject: [PATCH 3/3] drm/gma500: Delete an unnecessary return statement in oaktrail_crtc_hdmi_dpms()
Message-Id: <9871ef86-0cd6-aab8-1252-53bc08fc79af@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <079c31b2-a2e6-cf42-cecb-e1e10dd241f6@users.sourceforge.net>
In-Reply-To: <079c31b2-a2e6-cf42-cecb-e1e10dd241f6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 15:17:48 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/gma500/oaktrail_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index dbc58e5130bb..24c7c6edfca5 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -484,8 +484,6 @@ void oaktrail_crtc_hdmi_dpms(struct drm_crtc *crtc, int mode)
 
 	/* LNC Chicken Bits - Squawk! */
 	REG_WRITE(0x70400, 0x4000);
-
-	return;
 }
 
 static void oaktrail_hdmi_dpms(struct drm_encoder *encoder, int mode)
-- 
2.16.1

