From: Colin King <colin.king@canonical.com>
Date: Sat, 17 Aug 2019 12:21:24 +0000
Subject: [PATCH][drm-next] drm/panel: remove redundant assignment to val
Message-Id: <20190817122124.29650-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable val is initialized to a value in a for-loop that is
never read and hence it is redundant. Remove it.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index 3b4f30c0fdae..84370562910f 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -116,7 +116,7 @@ static void td043mtea1_write_gamma(struct td043mtea1_panel *lcd)
 	td043mtea1_write(lcd, 0x13, val);
 
 	/* gamma bits [7:0] */
-	for (val = i = 0; i < 12; i++)
+	for (i = 0; i < 12; i++)
 		td043mtea1_write(lcd, 0x14 + i, gamma[i] & 0xff);
 }
 
-- 
2.20.1
