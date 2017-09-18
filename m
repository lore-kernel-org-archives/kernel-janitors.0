From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 18 Sep 2017 13:39:28 +0000
Subject: Re: [PATCH] ALSA: hwdep: prevent a harmless shift wrapping bug
Message-Id: <s5hinggi0rz.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170913230116.yspku7ov2hgqtigh@mwanda>
In-Reply-To: <20170913230116.yspku7ov2hgqtigh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Thu, 14 Sep 2017 01:01:16 +0200,
Dan Carpenter wrote:
> 
> The "info.index" variable represents a bit in hw->dsp_loaded which is
> an unsigned int.  If it's higher than 31 we hit a shift wrapping bug.
> This seems harmless, but I wanted to silence the static checker warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi
