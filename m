From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Wed, 30 Dec 2009 01:22:55 +0000
Subject: [PATCH] drm/radeon/radeon_connectors.c: add a NULL test before
Message-Id: <1262136175.8733.31.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The encoder variable can be NULL in this function so I believe it should
be checked before dereference.

Coverity CID: 13253

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

diff --git drivers/gpu/drm/radeon/radeon_connectors.c drivers/gpu/drm/radeon/radeon_connectors.c
index 2016156..b82ae61 100644
--- drivers/gpu/drm/radeon/radeon_connectors.c
+++ drivers/gpu/drm/radeon/radeon_connectors.c
@@ -615,7 +615,7 @@ static enum drm_connector_status radeon_vga_detect(struct drm_connector *connect
 				ret = connector_status_connected;
 		}
 	} else {
-		if (radeon_connector->dac_load_detect) {
+		if (radeon_connector->dac_load_detect && encoder) {
 			encoder_funcs = encoder->helper_private;
 			ret = encoder_funcs->detect(encoder, connector);
 		}


