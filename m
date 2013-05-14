From: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Date: Tue, 14 May 2013 12:34:18 +0000
Subject: Re: [patch] ASoC: wm_adsp: memory leak in wm_adsp_create_control()
Message-Id: <20130514123418.GA13656@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130514120244.GA27826@elgon.mountain>
In-Reply-To: <20130514120244.GA27826@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>

On Tue, May 14, 2013 at 03:02:44PM +0300, Dan Carpenter wrote:
> There are two return paths which don't kfree(name).
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good.

Thanks,
Dimitris
