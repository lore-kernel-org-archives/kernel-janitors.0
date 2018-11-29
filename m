From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Nov 2018 23:40:51 +0000
Subject: [PATCH] drm/mgag200: make array m_div_val static, shrinks object size
Message-Id: <20181129234051.5463-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array m_div_val on the stack but instead
make it static. Makes the object code smaller by 60 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  32339	   1728	      0	  34067	   8513	mgag200/mgag200_mode.o

After:
   text	   data	    bss	    dec	    hex	filename
  32215	   1792	      0	  34007	   84d7	mgag200/mgag200_mode.o

(gcc version 8.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index acf7bfe68454..9939f0174bf7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -629,7 +629,7 @@ static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
 	unsigned int p, m, n;
 	unsigned int computed, vco;
 	int tmp;
-	const unsigned int m_div_val[] = { 1, 2, 4, 8 };
+	static const unsigned int m_div_val[] = { 1, 2, 4, 8 };
 
 	m = n = p = 0;
 	vcomax = 1488000;
-- 
2.19.1
