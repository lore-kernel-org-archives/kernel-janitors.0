From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 05 Sep 2012 20:22:24 +0000
Subject: [PATCH] ASoC: wm0010: Fix warning, use format %zu for type size_t
Message-Id: <1346876544-24514-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Fix warning by using format specifier %zu for type size_t

Sparse warning:
sound/soc/codecs/wm0010.c:411:2: warning:
        format ‘%d’ expects argument of type ‘int’,
        but argument 4 has type ‘size_t’ [-Wformat]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 sound/soc/codecs/wm0010.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 5f99148..8343d74 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -408,7 +408,7 @@ static int wm0010_boot(struct snd_soc_codec *codec)
 	wm0010->state = WM0010_BOOTROM;
 	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
 
-	dev_dbg(codec->dev, "Downloading %d byte stage 2 loader\n", fw->size);
+	dev_dbg(codec->dev, "Downloading %zu byte stage 2 loader\n", fw->size);
 
 	/* Copy to local buffer first as vmalloc causes problems for dma */
 	img = kzalloc(fw->size, GFP_KERNEL);
-- 
1.7.10.4

