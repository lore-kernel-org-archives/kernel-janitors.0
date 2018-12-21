From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Fri, 21 Dec 2018 12:29:31 +0000
Subject: Re: [alsa-devel] [PATCH 3/4] ASoC: qdsp6: q6asm-dai: Fix a small memory leak
Message-Id: <2630a14e-ba15-0ed2-11f7-d217569a31c0@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221090610.GC2735@kadam>
In-Reply-To: <20181221090610.GC2735@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Patrick Lai <plai@codeaurora.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>



On 21/12/2018 09:06, Dan Carpenter wrote:
> We can't return directly if snd_dma_alloc_pages() fails; we first need
> to free prtd->audio_client and prtd.
> 
> Fixes: 22930c79ac5c ("ASoC: qdsp6: q6asm-dai: Add support to compress offload")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---


Thanks for the patch! I was due to send something similar!

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
