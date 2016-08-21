From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 19:43:22 +0000
Subject: [PATCH 1/2] ALSA: compress: Use memdup_user() rather than duplicating its implementation
Message-Id: <375fcd8c-ebb5-5f63-f094-347559c5b9c1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <7233eb00-a941-4935-dce2-7cb907272d41@users.sourceforge.net>
In-Reply-To: <7233eb00-a941-4935-dce2-7cb907272d41@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 21:02:06 +0200

Reuse existing functionality from memdup_user() instead of keeping
duplicate source code.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/core/compress_offload.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 2c49848..583d407 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -553,13 +553,9 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		 * we should allow parameter change only when stream has been
 		 * opened not in other cases
 		 */
-		params = kmalloc(sizeof(*params), GFP_KERNEL);
-		if (!params)
-			return -ENOMEM;
-		if (copy_from_user(params, (void __user *)arg, sizeof(*params))) {
-			retval = -EFAULT;
-			goto out;
-		}
+		params = memdup_user((void __user *)arg, sizeof(*params));
+		if (IS_ERR(params))
+			return PTR_ERR(params);
 
 		retval = snd_compress_check_input(params);
 		if (retval)
-- 
2.9.3

