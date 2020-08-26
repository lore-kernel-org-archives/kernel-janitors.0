From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Aug 2020 08:47:27 +0000
Subject: [PATCH] drm/mgag200: fix spelling mistake "expeced" -> "expected"
Message-Id: <20200826084727.42703-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a drm_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index b282b0e42c2d..771b26aeee19 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -168,7 +168,7 @@ static void mgag200_g200_interpret_bios(struct mga_device *mdev,
 		return;
 	}
 	if (pins_len != expected_length[version]) {
-		drm_warn(dev, "Unexpected BIOS PInS size: %d expeced: %d\n",
+		drm_warn(dev, "Unexpected BIOS PInS size: %d expected: %d\n",
 			 pins_len, expected_length[version]);
 		return;
 	}
-- 
2.27.0
