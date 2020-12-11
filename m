From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Fri, 11 Dec 2020 09:46:45 +0000
Subject: Re: [PATCH] ASoC: wm_adsp: remove "ctl" from list on error in wm_adsp_create_control()
Message-Id: <20201211094645.GB9673@ediswmail.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9B0keV/02wrx9Xs@mwanda>
In-Reply-To: <X9B0keV/02wrx9Xs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Adam Brickman <Adam.Brickman@cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vlad Karpovich <Vlad.Karpovich@cirrus.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com, Luo Meng <luomeng12@huawei.com>, James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>

On Wed, Dec 09, 2020 at 09:54:09AM +0300, Dan Carpenter wrote:
> The error handling frees "ctl" but it's still on the "dsp->ctl_list"
> list so that could result in a use after free.  Remove it from the list
> before returning.
> 
> Fixes: 2323736dca72 ("ASoC: wm_adsp: Add basic support for rev 1 firmware file format")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Good spot there, thanks.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
