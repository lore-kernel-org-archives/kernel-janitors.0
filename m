From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 02 Oct 2020 19:28:01 +0000
Subject: [PATCH] ASoC: tlv320adcx140: Fix a typo in a comment
Message-Id: <20201002192801.639743-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, dmurphy@ti.com, robh@kernel.org, grandmaster@al2klimov.de
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

It is likely that this header file is about the TLV320ADCX140. (0 and 4
swapped)
While at it fix a missing "H" in a comment related to the include guard.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/tlv320adcx140.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index eedbc1d7221f..cafcbc0dd5fd 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-// TLV320ADCX104 Sound driver
+// TLV320ADCX140 Sound driver
 // Copyright (C) 2020 Texas Instruments Incorporated - https://www.ti.com/
 
 #ifndef _TLV320ADCX140_H
@@ -145,4 +145,4 @@
 #define ADCX140_GPO_CFG_MAX		4
 #define ADCX140_GPO_DRV_MAX		5
 
-#endif /* _TLV320ADCX140_ */
+#endif /* _TLV320ADCX140_H */
-- 
2.25.1
