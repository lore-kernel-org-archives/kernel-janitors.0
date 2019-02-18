From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Mon, 18 Feb 2019 09:45:01 +0000
Subject: Re: [PATCH -next] ASoC: wm8741: Make function 'wm8741_mute' static
Message-Id: <20190218094501.GA27940@ediswmail.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216013556.117839-1-weiyongjun1@huawei.com>
In-Reply-To: <20190216013556.117839-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sergej Sawazki <sergej@taudac.com>

On Sat, Feb 16, 2019 at 01:35:56AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> sound/soc/codecs/wm8741.c:371:5: warning:
>  symbol 'wm8741_mute' was not declared. Should it be static?
> 
> Fixes: 36b1599340b5 ("ASoC: wm8741: Add digital mute callback")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
