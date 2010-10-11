From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Mon, 11 Oct 2010 10:07:47 +0000
Subject: Re: [patch] ASoC: soc: snprintf() doesn't return negative
Message-Id: <1286791667.3306.0.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101011035416.GD5851@bicker>
In-Reply-To: <20101011035416.GD5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, Jassi Brar <jassi.brar@samsung.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Peter Ujfalusi <peter.ujfalusi@nokia.com>

On Mon, 2010-10-11 at 05:54 +0200, Dan Carpenter wrote:
> In user space snprintf() returns negative on errors but the kernel
> version only returns positives.  It could potentially return sizes
> larger than the size of the buffer so we should check for that.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

