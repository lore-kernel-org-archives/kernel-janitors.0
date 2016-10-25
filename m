From: Joe Perches <joe@perches.com>
Date: Tue, 25 Oct 2016 08:04:32 +0000
Subject: Re: [PATCH 5/7] ASoC: constify snd_soc_ops structures
Message-Id: <1477382672.1998.5.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1476543351-17858-1-git-send-email-Julia.Lawall@lip6.fr>
         <1476543351-17858-6-git-send-email-Julia.Lawall@lip6.fr>
         <20161024173423.GL17252@sirena.org.uk>
         <alpine.DEB.2.20.1610250754220.2084@hadrien>
In-Reply-To: <alpine.DEB.2.20.1610250754220.2084@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

On Tue, 2016-10-25 at 07:55 +0200, Julia Lawall wrote:
> On Mon, 24 Oct 2016, Mark Brown wrote:
> > On Sat, Oct 15, 2016 at 04:55:49PM +0200, Julia Lawall wrote:
> > > ---
> > >  sound/soc/generic/simple-card.c                 |    2 +-
[...]
> > >  sound/soc/mxs/mxs-sgtl5000.c                    |    2 +-
> > >  16 files changed, 28 insertions(+), 28 deletions(-)
> > 
> > You split out a few drivers as separate patches but not these ones -
> > what's special about these ones?
> 
> If it's preferred, I could send them all one file at a time, or when the
> maintainers are very similar just send one patch to all the maintainers.

Whatever works.
There's no single style appropriate for the entire kernel.

