From: Lars-Peter Clausen <lars@metafoo.de>
Date: Thu, 27 Nov 2014 08:09:41 +0000
Subject: Re: [patch] ASoC: sigmadsp: uninitialized variable in sigmadsp_activate_ctrl()
Message-Id: <5476DC45.6030809@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141126223516.GB443@mwanda>
In-Reply-To: <20141126223516.GB443@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

On 11/26/2014 11:35 PM, Dan Carpenter wrote:
> The "changed" variable should be set to false at the start.
>
> Fixes: a35daac77a03 ('ASoC: sigmadsp: Add support for fw v2')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Lars-Peter Clausen <lars@metafoo.de>

Thanks.
