From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 13:55:03 +0000
Subject: [PATCH 3/5] drm/sti: Fix a typo in a comment line
Message-Id: <a5a1f6cb-ba9d-0f7d-9126-9aeffb3783ad@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
In-Reply-To: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 15:30:44 +0200

Add a missing character in this description for a data structure.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/sti/sti_cursor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index cd35b9d9de26..5b3a41f74f21 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -33,7 +33,7 @@
 #define STI_CURS_MAX_SIZE   128
 
 /*
- * pixmap dma buffer stucture
+ * pixmap dma buffer structure
  *
  * @paddr:  physical address
  * @size:   buffer size
-- 
2.12.2

