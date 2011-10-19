From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Wed, 19 Oct 2011 16:48:36 +0000
Subject: Re: [PATCH 3/3] sound/soc/au1x: keep pointer to resource so it can
Message-Id: <20111019164836.GC4275@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1318909555-12933-3-git-send-email-julia@diku.dk>
	<CAOLZvyFoiuHEfpnozWpAM5h92rjay-asqXX0tY1P1ZzO8eTGOQ@mail.gmail.com>
	<CABS+qY2pBkNjHUKrtD3QttQOQD-LpStHopSGxzeG-iyc7RtVgw@mail.gmail.com>
In-Reply-To: <CABS+qY2pBkNjHUKrtD3QttQOQD-LpStHopSGxzeG-iyc7RtVgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Girdwood, Liam" <lrg@ti.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Manuel Lauss <manuel.lauss@googlemail.com>, Julia Lawall <julia@diku.dk>, Axel Lin <axel.lin@gmail.com>

On Wed, Oct 19, 2011 at 05:47:25PM +0100, Girdwood, Liam wrote:
> > From 940e38b3f0beff6fcd8f62f627dce622e9ca0e54 Mon Sep 17 00:00:00 2001
> > From: Manuel Lauss <manuel.lauss@googlemail.com>
> > Date: Wed, 19 Oct 2011 16:45:12 +0200
> > Subject: [PATCH] ASoC: au1x: fix error paths in ac97c/i2cs probe callbacks.
> >
> > add iounmap() and release the correct mem resource.
> >
> > Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>

> Acked-by: Liam Girdwood <lrg@ti.com>

...but since it was buried in the middle of the e-mail please resend
with Liam's ack for application.
