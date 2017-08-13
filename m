From: Colin King <colin.king@canonical.com>
Date: Sun, 13 Aug 2017 15:00:33 +0000
Subject: [PATCH] ASoC: max98926: make max98926_spk_tlv and max98926_current_tlv static
Message-Id: <20170813150033.17049-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bhumika Goyal <bhumirks@gmail.com>, "Gustavo A . R . Silva" <garsilva@embeddedor.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

max98926_spk_tlv and max98926_current_tlv are local to the source and do
not need to be in global scope, so make them static.

Cleans up sparse warnings:
symbol 'max98926_spk_tlv' was not declared. Should it be static?
symbol 'max98926_current_tlv' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/max98926.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index 59d03d036945..03d07bf4d942 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -213,8 +213,8 @@ static bool max98926_readable_register(struct device *dev, unsigned int reg)
 	}
 };
 
-DECLARE_TLV_DB_SCALE(max98926_spk_tlv, -600, 100, 0);
-DECLARE_TLV_DB_RANGE(max98926_current_tlv,
+static DECLARE_TLV_DB_SCALE(max98926_spk_tlv, -600, 100, 0);
+static DECLARE_TLV_DB_RANGE(max98926_current_tlv,
 	0, 11, TLV_DB_SCALE_ITEM(20, 20, 0),
 	12, 15, TLV_DB_SCALE_ITEM(320, 40, 0),
 );
-- 
2.11.0

