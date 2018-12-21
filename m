From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Fri, 21 Dec 2018 12:29:45 +0000
Subject: Re: [PATCH 2/2] ASoC: qdsp6: q6asm-dai: Fix a NULL vs IS_ERR() bug
Message-Id: <a9ebd36d-c13a-487d-79cc-72bd14134bab@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221090516.GB2735@kadam>
In-Reply-To: <20181221090516.GB2735@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Patrick Lai <plai@codeaurora.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>



On 21/12/2018 09:05, Dan Carpenter wrote:
> The q6asm_audio_client_alloc() doesn't return NULL, it returns error
> pointers.
> 
> Fixes: 22930c79ac5c ("ASoC: qdsp6: q6asm-dai: Add support to compress offload")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch!

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
