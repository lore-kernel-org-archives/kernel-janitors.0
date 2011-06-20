From: Liam Girdwood <lrg@ti.com>
Date: Mon, 20 Jun 2011 14:03:19 +0000
Subject: Re: [patch] ASoC: adau1701: signedness bug in adau1701_write()
Message-Id: <4DFF5327.40903@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110620071125.GG14591@shale.localdomain>
	<4DFF1AD6.4090103@metafoo.de>
In-Reply-To: <4DFF1AD6.4090103@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: "open list:SOUND - SOC LAYER..." <alsa-devel@alsa-project.org>, Dan Carpenter <error27@gmail.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 20/06/11 11:03, Lars-Peter Clausen wrote:
> On 06/20/2011 09:11 AM, Dan Carpenter wrote:
>> "ret" is supposed to be signed here.  The current code will only
>> return -EIO on error, instead of a more appropriate error code such
>> as -EAGAIN etc.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Acked-by: Lars-Peter Clausen <lars@metafoo.de>
> 

Acked-by: Liam Girdwood <lrg@ti.com>
