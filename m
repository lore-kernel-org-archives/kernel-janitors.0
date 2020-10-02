From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 02 Oct 2020 16:59:08 +0000
Subject: [PATCH] ASoC: wm8523: Fix a typo in a comment
Message-Id: <20201002165908.637809-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

It is likely that this header file is about the WM8523.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/wm8523.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8523.h b/sound/soc/codecs/wm8523.h
index 79afbf1e4f1a..5f9bb3df1866 100644
--- a/sound/soc/codecs/wm8523.h
+++ b/sound/soc/codecs/wm8523.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * wm8523.h  --  WM8423 ASoC driver
+ * wm8523.h  --  WM8523 ASoC driver
  *
  * Copyright 2009 Wolfson Microelectronics, plc
  *
-- 
2.25.1
