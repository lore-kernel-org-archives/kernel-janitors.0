From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Sep 2012 09:35:27 +0000
Subject: Re: [patch] ALSA: compress_core: integer overflow in snd_compr_allocate_buffer()
Message-Id: <20120914093527.GD4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123217.GD6128@elgon.mountain>
 <s5hwr08ziyx.wl%tiwai@suse.de> <20120906145912.GK19410@mwanda>
 <s5h627rxjpw.wl%tiwai@suse.de> <s5hligdc6su.wl%tiwai@suse.de>
 <1347614682.1943.35.camel@vkoul-udesk3>
In-Reply-To: <1347614682.1943.35.camel@vkoul-udesk3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jesper Juhl <jj@chaosbits.net>, Namarta Kohli <namartax.kohli@intel.com>

On Fri, Sep 14, 2012 at 02:54:42PM +0530, Vinod Koul wrote:
> On Fri, 2012-09-14 at 11:06 +0200, Takashi Iwai wrote:
> > > So, we actually should have two distinct fixes.
> > 
> > I took Dan's patch now for next branch.  But it's still better to
> > filter weird parameters in the caller side, too.
> > 
> > Vinod, care to write such a patch and submit? 
> Yes am already on it :)
> 

Thanks.  I've had my text editor open to the file all week, but it
felt like there was probably a better limit to use than just what
would overflow...  I just don't know the code very well.  I'm glad
that Vinod is handling this.

regards,
dan carpenter

