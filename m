From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 13:57:25 +0000
Subject: [PATCH 5/5] drm/sti: Adjust two checks for null pointers in sti_hqvdp_probe()
Message-Id: <918229e6-80fe-629f-8fec-bf60ac15275f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
In-Reply-To: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dri-devel@lists.freedesktop.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 15:33:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/sti/sti_hqvdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 372ea294da80..a1c161f77804 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1356,12 +1356,12 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
 
 	/* Get Memory resources */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res = NULL) {
+	if (!res) {
 		DRM_ERROR("Get memory resource failed\n");
 		return -ENXIO;
 	}
 	hqvdp->regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (hqvdp->regs = NULL) {
+	if (!hqvdp->regs) {
 		DRM_ERROR("Register mapping failed\n");
 		return -ENXIO;
 	}
-- 
2.12.2

