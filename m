From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 09:09:47 +0000
Subject: Re: [patch] [ALSA] sb16 - info leak in snd_sb_csp_ioctl()
Message-Id: <20131107090947.GS26669@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107080954.GS21844@elgon.mountain>
 <s5hli10vbqv.wl%tiwai@suse.de>
In-Reply-To: <s5hli10vbqv.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Thu, Nov 07, 2013 at 09:48:08AM +0100, Takashi Iwai wrote:
> At Thu, 7 Nov 2013 11:09:54 +0300,
> Dan Carpenter wrote:
> > 
> > There is a 2 byte hole after "info.func_nr" so we could leak unitialized
> > stack information to userspace.
> > 
> > Fixes: 1da177e4c3f4 ('Linux-2.6.12-rc2')
> 
> Does this help at all?  It means that the bug has been there even
> before moving to git.  I think it's better to be removed for avoid
> confusion.

I think if you are back porting it then you know it goes back all the
way.  That seems useful.

The Fixes tag is still new so it's not totally clear what the rules are.
I don't have strong feelings about this either way.

regards,
dan carpenter

