From: Andre Haupt <andre@bitwigglers.org>
Date: Tue, 27 Nov 2007 15:51:39 +0000
Subject: [PATCH 1/2] fbmon: remove unnecessary local variable
Message-Id: <94ed2e6692de667821f02aacc69b8df99de683cf.1196176751.git.andre@bitwigglers.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: y
In-Reply-To: y
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jsimmons@users.sourceforge.net, kernel-janitors@vger.kernel.org, adaplas@gmail.com, Andre Haupt <andre@bitwigglers.org>

This fixes a sparse warning about symbol 'i' shadowing an earlier one.

From: Andre Haupt <andre@bitwigglers.org>
Signed-off-by: Andre Haupt <andre@bitwigglers.org>
---
 drivers/video/fbmon.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/video/fbmon.c b/drivers/video/fbmon.c
index 4ba9c08..3f3a4e9 100644
--- a/drivers/video/fbmon.c
+++ b/drivers/video/fbmon.c
@@ -686,7 +686,7 @@ static int fb_get_monitor_limits(unsigned char *edid, struct fb_monspecs *specs)
 	/* estimate monitor limits based on modes supported */
 	if (retval) {
 		struct fb_videomode *modes, *mode;
-		int num_modes, i, hz, hscan, pixclock;
+		int num_modes, hz, hscan, pixclock;
 		int vtotal, htotal;
 
 		modes = fb_create_modedb(edid, &num_modes);
-- 
1.4.4.4

