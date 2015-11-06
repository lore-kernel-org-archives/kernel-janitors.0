From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 06 Nov 2015 14:05:43 +0000
Subject: [PATCH] HDMI-HDCP: Delete an unnecessary check before the function call "kfree"
Message-Id: <563CB3B7.7010403@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 6 Nov 2015 15:00:22 +0100

The kfree() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
index 1dc9c34..205e931 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
@@ -1430,7 +1430,7 @@ struct hdmi_hdcp_ctrl *hdmi_hdcp_init(struct hdmi *hdmi)
 
 void hdmi_hdcp_destroy(struct hdmi *hdmi)
 {
-	if (hdmi && hdmi->hdcp_ctrl) {
+	if (hdmi) {
 		kfree(hdmi->hdcp_ctrl);
 		hdmi->hdcp_ctrl = NULL;
 	}
-- 
2.6.2

