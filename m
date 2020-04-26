From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Apr 2020 20:06:31 +0000
Subject: [PATCH] media: s5p-g2d: Fix a memory leak in an error handling path in 'g2d_probe()'
Message-Id: <20200426200631.42497-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kyungmin.park@samsung.com, kamil@wypas.org, a.hajda@samsung.com, mchehab@kernel.org, s.nawrocki@samsung.com, sachin.kamat@linaro.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

Memory allocated with 'v4l2_m2m_init()' must be freed by a corresponding
call to 'v4l2_m2m_release()'

Fixes: 5ce60d790a24 ("[media] s5p-g2d: Add DT based discovery support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/s5p-g2d/g2d.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
index 6932fd47071b..ded6fa24677c 100644
--- a/drivers/media/platform/s5p-g2d/g2d.c
+++ b/drivers/media/platform/s5p-g2d/g2d.c
@@ -717,12 +717,14 @@ static int g2d_probe(struct platform_device *pdev)
 	of_id = of_match_node(exynos_g2d_match, pdev->dev.of_node);
 	if (!of_id) {
 		ret = -ENODEV;
-		goto unreg_video_dev;
+		goto free_m2m;
 	}
 	dev->variant = (struct g2d_variant *)of_id->data;
 
 	return 0;
 
+free_m2m:
+	v4l2_m2m_release(dev->m2m_dev);
 unreg_video_dev:
 	video_unregister_device(dev->vfd);
 rel_vdev:
-- 
2.25.1
