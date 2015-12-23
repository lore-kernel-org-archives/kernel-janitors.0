From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 23 Dec 2015 06:58:11 +0000
Subject: Re: [PATCH 4/4] ASoC: Intel: add NULL test
Message-Id: <alpine.DEB.2.02.1512230757420.2081@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450610153-7746-1-git-send-email-Julia.Lawall@lip6.fr>
 <1450610153-7746-5-git-send-email-Julia.Lawall@lip6.fr>
 <20151223000245.GF16023@sirena.org.uk>
In-Reply-To: <20151223000245.GF16023@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>



On Wed, 23 Dec 2015, Mark Brown wrote:

> On Sun, Dec 20, 2015 at 12:15:53PM +0100, Julia Lawall wrote:
> > Add NULL test on call to devm_kzalloc.
> > 
> > The semantic match that finds this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> 
> If there was a patch 3 in this series I seem to be missing it.

It's not for you (drivers/s390/char/con3215.c).  Sorry for the confusion.

julia
