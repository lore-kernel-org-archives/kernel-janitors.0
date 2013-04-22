From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 22 Apr 2013 08:42:25 +0000
Subject: Re: [patch] ALSA: compress: info leak in snd_compr_get_caps()
Message-Id: <s5hd2tn553i.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130421110729.GA6171@elgon.mountain>
In-Reply-To: <20130421110729.GA6171@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Vinod Koul <vinod.koul@intel.com>, kernel-janitors@vger.kernel.org, Jeeja KP <jeeja.kp@intel.com>, Namarta Kohli <namartax.kohli@intel.com>

At Sun, 21 Apr 2013 14:07:29 +0300,
Dan Carpenter wrote:
> 
> If the ->get_caps() function doesn't clear the buffer then there would
> stack information leaked to userspace.  For example,
> soc_compr_get_caps() can return success without clearing the buffer.

Thanks, applied now.

I found that we have also a similar problem in other ioctls
(snd_compr_get_codec_caps() and snd_compr_get_params()), so applied
the following patch in addition.


Takashi

---
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: compress: Use kzalloc() for ioctls writing back data

Like the previous patch by Dan, we should clear the data to be
returned from certain compress ioctls, namely,
snd_compr_get_codec_caps() and snd_compr_get_params().
This time, we can simply replace kmalloc() with kzalloc().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 664c693..a0bc47f 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -428,7 +428,7 @@ snd_compr_get_codec_caps(struct snd_compr_stream *stream, unsigned long arg)
 	if (!stream->ops->get_codec_caps)
 		return -ENXIO;
 
-	caps = kmalloc(sizeof(*caps), GFP_KERNEL);
+	caps = kzalloc(sizeof(*caps), GFP_KERNEL);
 	if (!caps)
 		return -ENOMEM;
 
@@ -545,7 +545,7 @@ snd_compr_get_params(struct snd_compr_stream *stream, unsigned long arg)
 	if (!stream->ops->get_params)
 		return -EBADFD;
 
-	params = kmalloc(sizeof(*params), GFP_KERNEL);
+	params = kzalloc(sizeof(*params), GFP_KERNEL);
 	if (!params)
 		return -ENOMEM;
 	retval = stream->ops->get_params(stream, params);
-- 
1.8.2.1

