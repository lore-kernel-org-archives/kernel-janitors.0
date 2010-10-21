From: "Koul, Vinod" <vinod.koul@intel.com>
Date: Thu, 21 Oct 2010 14:28:34 +0000
Subject: RE: [patch 3/3] Staging: sst: fixups in SNDRV_SST_STREAM_DECODE
Message-Id: <438BB0150E931F4B9CE701519A44630104BE8125B7@bgsmsx502.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101019055748.GE5839@bicker>
In-Reply-To: <20101019055748.GE5839@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Harsha, Priya" <priya.harsha@intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Alan Cox <alan@linux.intel.com>

> This is another patch about copying data to the kernel before using it.
> 
> SNDRV_SST_STREAM_DECODE is sort of tricky because we need to do a
> copy_from_user() that gives us another two pointers and we have copy
> those.  Those again give us some more pointers that we have to copy.
> 
> Besides those problems, the code had a stack overflow:
> -	struct snd_sst_buff_entry ibuf_temp[param->ibufs->entries],
> -		obuf_temp[param->obufs->entries];
> param->ibufs->entries comes from the user.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Vinod Koul <vinod.koul@intel.com>
