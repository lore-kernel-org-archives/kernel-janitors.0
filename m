From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Nov 2016 13:55:38 +0000
Subject: Re: [patch] ASoC: sh: dma-sh7760: fix a debug printf
Message-Id: <20161117135537.GV28558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161117110046.GC32143@mwanda>
 <CAOmT4fR2Y5BPdpM8KrtdVqTpg2ewGOVyzzBC_wij55NSzbOdfQ@mail.gmail.com>
In-Reply-To: <CAOmT4fR2Y5BPdpM8KrtdVqTpg2ewGOVyzzBC_wij55NSzbOdfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bojan prtvar <prtvar.b@gmail.com>
Cc: alsa-devel@alsa-project.org, Manuel Lauss <mano@roarinelk.homelinux.net>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

On Thu, Nov 17, 2016 at 02:31:06PM +0100, bojan prtvar wrote:
> Hi,
> 
> On Thu, Nov 17, 2016 at 12:00 PM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
> 
> > -       pr_debug("PCM data: addr 0x%08ulx len %d\n",
> > +       pr_debug("PCM data: addr 0x%08lx len %d\n",
> >                  (u32)runtime->dma_addr, runtime->dma_bytes);
> 
> While there, why not using %pad as suggested by
> Documentation/printk-formats.txt?

Oh crap.  I never even compiled this stuff...   I'm really sorry it's
been a while since I screwed up like this.  Sorry about this.

That sounds like a good idea but I don't have a cross compiler set up
so I'm going to leave it alone for now.

regards,
dan carpenter
