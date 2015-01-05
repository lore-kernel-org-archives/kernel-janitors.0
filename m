From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 05 Jan 2015 15:18:07 +0000
Subject: Re: [PATCH 6/13] ASoC: Intel: Delete an unnecessary check before the function call "sst_dma_free"
Message-Id: <s5hwq51fe8g.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
	<530CD2C4.4050903@users.sourceforge.net>
	<alpine.DEB.2.10.1402251840450.7035@hadrien>
	<530CF8FF.8080600@users.sourceforge.net>
	<alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	<530DD06F.4090703@users.sourceforge.net>
	<alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<54A9355F.4050102@users.sourceforge.net>
	<54A93B5A.9050504@users.sourceforge.net>
	<20150105143551.GQ11764@sirena.org.uk>
In-Reply-To: <20150105143551.GQ11764@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

At Mon, 5 Jan 2015 14:35:51 +0000,
Mark Brown wrote:
> 
> On Sun, Jan 04, 2015 at 02:08:42PM +0100, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sat, 3 Jan 2015 19:03:55 +0100
> > 
> > The sst_dma_free() function tests whether its argument is NULL and then
> > returns immediately. Thus the test around the call is not needed.
> 
> I'm missing aptches 1-5, are there any dependencies?

No, all individual fixes.


Takashi
