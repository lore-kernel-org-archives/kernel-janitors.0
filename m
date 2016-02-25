From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Feb 2016 07:50:38 +0000
Subject: [patch 2/2] ASoC: max9867: silence and array overflow warning
Message-Id: <20160225075038.GC7333@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Axel Lin <axel.lin@ingics.com>, anish kumar <yesanishhere@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

Smatch complains that we might reach the end of this loop without
finding what we're looking for leading to a buffer overflow.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 4fb6fc7..9fb03c6 100755
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -156,6 +156,8 @@ static inline int get_ni_value(int mclk, int rate)
 		if (ni_div[i].mclk >= mclk)
 			break;
 	}
+	if (i = ARRAY_SIZE(ni_div))
+		return -EINVAL;
 
 	switch (rate) {
 	case 8000:
