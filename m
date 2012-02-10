From: Dong Aisheng <dongas86@gmail.com>
Date: Fri, 10 Feb 2012 19:20:36 +0000
Subject: Re: [PATCH] sound/soc/mxs/mxs-saif.c: use devm_ functions
Message-Id: <20120210192036.GA2630@b29396-Latitude-E6410>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328861821-3380-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1328861821-3380-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@ti.com>

On Fri, Feb 10, 2012 at 09:17:01AM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The various devm_ functions allocate memory that is released when a driver
> detaches.  This patch uses these functions for data that is allocated in
> the probe function of a platform device and is only freed in the remove
> function.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> patch against
> git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git from the
> branch for-3.4
> 
It's ok now.
Acked-by: Dong Aisheng <dong.aisheng@linaro.org>

Regards
Dong Aisheng
