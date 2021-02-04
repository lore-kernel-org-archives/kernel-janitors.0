From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Feb 2021 18:17:56 +0000
Subject: [PATCH] drm/mgag200: make a const array static, makes object smaller
Message-Id: <20210204181756.109549-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array m_div_val on the stack but instead make
it static. Makes the object code smaller by 29 bytes:

Before:
   text	   data	  bss   dec    hex filename
  34736	   4552	    0 39288   9978 drivers/gpu/drm/mgag200/mgag200_mode.o

After:
   text	   data	  bss   dec    hex filename
  34625	   4616	    0 39241   9949 drivers/gpu/drm/mgag200/mgag200_mode.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 1dfc42170059..27f33af09798 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -712,7 +712,7 @@ static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
 	unsigned int p, m, n;
 	unsigned int computed, vco;
 	int tmp;
-	const unsigned int m_div_val[] = { 1, 2, 4, 8 };
+	static const unsigned int m_div_val[] = { 1, 2, 4, 8 };
 
 	m = n = p = 0;
 	vcomax = 1488000;
-- 
2.29.2
