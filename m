From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 13:56:12 +0000
Subject: [PATCH 4/5] drm/sti: Fix typos in a comment line
Message-Id: <e70bf37b-a461-873e-4ba3-40bf43cc7b21@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
In-Reply-To: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 15:32:08 +0200

Adjust this description for a function call.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/sti/sti_tvout.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index 63b982048743..8959fcc743a8 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -846,7 +846,7 @@ static int sti_tvout_probe(struct platform_device *pdev)
 
 	tvout->dev = dev;
 
-	/* get Memory ressources */
+	/* get memory resources */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tvout-reg");
 	if (!res) {
 		DRM_ERROR("Invalid glue resource\n");
-- 
2.12.2

