From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Sep 2012 12:32:18 +0000
Subject: [patch] ALSA: compress_core: integer overflow in snd_compr_allocate_buffer()
Message-Id: <20120905123217.GD6128@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jesper Juhl <jj@chaosbits.net>, Namarta Kohli <namartax.kohli@intel.com>

These are 32 bit values that come from the user, we need to check for
integer overflows or we could end up allocating a smaller buffer than
expected.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index ec2118d..5a733e7 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -409,6 +409,10 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 	unsigned int buffer_size;
 	void *buffer;
 
+	if (params->buffer.fragment_size = 0 ||
+	    params->buffer.fragments > SIZE_MAX / params->buffer.fragment_size)
+		return -EINVAL;
+
 	buffer_size = params->buffer.fragment_size * params->buffer.fragments;
 	if (stream->ops->copy) {
 		buffer = NULL;
