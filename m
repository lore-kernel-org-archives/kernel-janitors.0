From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 31 Mar 2017 14:24:07 +0000
Subject: Re: [PATCH] ALSA: emux: stop if copy_from_user() fails
Message-Id: <s5ha88134oo.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170331135340.GA22338@mwanda>
In-Reply-To: <20170331135340.GA22338@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Fri, 31 Mar 2017 15:53:40 +0200,
Dan Carpenter wrote:
> 
> If we can't fill the "patch" struct because "count" is too small (it can
> be as low as 4 bytes) or because copy_from_user() failed, then just
> return instead of using unintialized data.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied now.


Takashi
