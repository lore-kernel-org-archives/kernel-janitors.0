From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Wed, 24 Mar 2010 13:51:46 +0000
Subject: Re: [patch] wm8994: playback => capture
Message-Id: <1269438706.3798.53.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100324115834.GG21571@bicker>
In-Reply-To: <20100324115834.GG21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, Joonyoung Shim <jy0922.shim@samsung.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2010-03-24 at 14:58 +0300, Dan Carpenter wrote:
> Sparse caught that initialize "playback" two times instead of
> initializing "capture".
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>

-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

