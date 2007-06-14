From: vignesh babu <vignesh.babu@wipro.com>
Date: Thu, 14 Jun 2007 08:21:52 +0000
Subject: [KJ] [PATCH]is_power_of_2-sound/pcm_params.h
Message-Id: <1181808592.2474.13.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: perex@suse.cz
Cc: Kernel Janitors List <kernel-janitors@lists.osdl.org>, alsa-devel@alsa-project.org


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/include/sound/pcm_params.h b/include/sound/pcm_params.h
index 85cf1cf..dee298e 100644
--- a/include/sound/pcm_params.h
+++ b/include/sound/pcm_params.h
@@ -21,6 +21,7 @@
  *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
  *
  */
+#include <linux/log2.h>
 
 int snd_pcm_hw_param_first(struct snd_pcm_substream *pcm, 
 			   struct snd_pcm_hw_params *params,
@@ -170,7 +171,7 @@ static inline int snd_mask_single(const struct snd_mask *mask)
 	for (i = 0; i < SNDRV_MASK_SIZE; i++) {
 		if (! mask->bits[i])
 			continue;
-		if (mask->bits[i] & (mask->bits[i] - 1))
+		if (!is_power_of_2(mask->bits[i]))
 			return 0;
 		if (c)
 			return 0;

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
