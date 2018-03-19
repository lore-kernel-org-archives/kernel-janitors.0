From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 19 Mar 2018 01:50:29 +0000
Subject: Re: [alsa-devel] [PATCH -next] ASoC: wm8400: Use       devm_snd_soc_register_component()
Message-Id: <87k1u8u97z.wl%kuninori.morimoto.gx@renesas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1521185527-164406-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1521185527-164406-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, patches@opensource.cirrus.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org


Hi Wei

> Since the remove callback is removed, the snd_soc_unregister_component()
> is missing when remove device. Using devm_snd_soc_register_component()
> instead of snd_soc_register_component().
> 
> Fixes: 10dc44c6462d ("ASoC: wm8400: replace codec to component")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Thank you for your patch

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Best regards
---
Kuninori Morimoto
