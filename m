From: Colin King <colin.king@canonical.com>
Date: Thu, 11 Jun 2020 13:39:24 +0000
Subject: [PATCH] drm/bridge: make array frs_limits static, makes object smaller
Message-Id: <20200611133924.923774-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array frs_limits on the stack but instead make it
static. Makes the object code smaller by 123 bytes

Before:
   text	   data	    bss	    dec	    hex	filename
  23456	   5712	     64	  29232	   7230	drivers/gpu/drm/bridge/tc358768.o

After:
   text	   data	    bss	    dec	    hex	filename
  23333	   5712	     64	  29109	   71b5	drivers/gpu/drm/bridge/tc358768.o

(gcc version 9.3.0, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 6650fe4cfc20..bd3fa3cbac16 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -291,7 +291,7 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
 			     const struct drm_display_mode *mode,
 			     bool verify_only)
 {
-	const u32 frs_limits[] = {
+	static const u32 frs_limits[] = {
 		1000000000,
 		500000000,
 		250000000,
-- 
2.27.0.rc0
