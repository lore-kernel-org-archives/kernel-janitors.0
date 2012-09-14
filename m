From: Vinod Koul <vinod.koul@linux.intel.com>
Date: Fri, 14 Sep 2012 09:52:40 +0000
Subject: Re: [patch] ALSA: compress_core: integer overflow in snd_compr_allocate_buffer()
Message-Id: <1347616148.1943.51.camel@vkoul-udesk3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123217.GD6128@elgon.mountain>
 <s5hwr08ziyx.wl%tiwai@suse.de> <20120906145912.GK19410@mwanda>
 <s5h627rxjpw.wl%tiwai@suse.de> <s5hligdc6su.wl%tiwai@suse.de>
 <1347614682.1943.35.camel@vkoul-udesk3>
 <1347614934.1943.38.camel@vkoul-udesk3>  <s5hr4q50wgv.wl%tiwai@suse.de>
In-Reply-To: <s5hr4q50wgv.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jesper Juhl <jj@chaosbits.net>, Namarta Kohli <namartax.kohli@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Fri, 2012-09-14 at 11:45 +0200, Takashi Iwai wrote:
> > Btw I saw that you took Dan's fix for flags:
> > ALSA: compress_core: fix open flags test in snd_compr_open()
> > 
> > Did you apply anything for this?
> 
> You mean anything else?  So far only two patches from Dan.
I meant else :) Your for-next updated 20hours ago doesn't shows only one
patch. Can you please push.

-- 
~Vinod

