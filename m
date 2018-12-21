From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Fri, 21 Dec 2018 12:31:13 +0000
Subject: Re: [PATCH 1/2] ASoC: qdsp6: q6asm-dai: Off by one in of_q6asm_parse_dai_data()
Message-Id: <034ee933-9e9c-0370-67d7-e0bb86f4c509@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221090442.GA2735@kadam>
In-Reply-To: <20181221090442.GA2735@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Patrick Lai <plai@codeaurora.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>



On 21/12/2018 09:04, Dan Carpenter wrote:
> The q6asm_fe_dais[] array has MAX_SESSIONS (8) elements so the >
> comparison should be >= or we access one element beyond the end of the
> array.
> 
> Fixes: 22930c79ac5c ("ASoC: qdsp6: q6asm-dai: Add support to compress offload")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks for the patch!

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
