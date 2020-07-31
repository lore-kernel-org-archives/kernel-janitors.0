From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Fri, 31 Jul 2020 19:35:29 +0000
Subject: [PATCH] ALSA: docs: fix typo
Message-Id: <1596224129-7699-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

GFP_KRENEL -> GFP_KERNEL

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index fa49688..aa9d5ab 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3579,7 +3579,7 @@ dependent on the bus. For normal devices, pass the device pointer
 ``SNDRV_DMA_TYPE_DEV`` type. For the continuous buffer unrelated to the
 bus can be pre-allocated with ``SNDRV_DMA_TYPE_CONTINUOUS`` type.
 You can pass NULL to the device pointer in that case, which is the
-default mode implying to allocate with ``GFP_KRENEL`` flag.
+default mode implying to allocate with ``GFP_KERNEL`` flag.
 If you need a different GFP flag, you can pass it by encoding the flag
 into the device pointer via a special macro
 :c:func:`snd_dma_continuous_data()`.
