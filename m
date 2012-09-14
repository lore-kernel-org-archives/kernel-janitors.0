From: Vinod Koul <vinod.koul@linux.intel.com>
Date: Fri, 14 Sep 2012 09:36:42 +0000
Subject: Re: [patch] ALSA: compress_core: integer overflow in snd_compr_allocate_buffer()
Message-Id: <1347614682.1943.35.camel@vkoul-udesk3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123217.GD6128@elgon.mountain>
 <s5hwr08ziyx.wl%tiwai@suse.de> <20120906145912.GK19410@mwanda>
 <s5h627rxjpw.wl%tiwai@suse.de>  <s5hligdc6su.wl%tiwai@suse.de>
In-Reply-To: <s5hligdc6su.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jesper Juhl <jj@chaosbits.net>, Namarta Kohli <namartax.kohli@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Fri, 2012-09-14 at 11:06 +0200, Takashi Iwai wrote:
> > So, we actually should have two distinct fixes.
> 
> I took Dan's patch now for next branch.  But it's still better to
> filter weird parameters in the caller side, too.
> 
> Vinod, care to write such a patch and submit? 
Yes am already on it :)

-- 
~Vinod

