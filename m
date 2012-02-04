From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 04 Feb 2012 22:08:24 +0000
Subject: Re: devm_request_and_ioremap
Message-Id: <alpine.DEB.2.02.1202042306520.1992@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7FE21149F4667147B645348EC605788508FBDB@039-SN2MPN1-013.039d.mgd.msft.net>
	<alpine.DEB.2.02.1201241828480.1779@localhost6.localdomain6>
	<20120124202203.GD1135@opensource.wolfsonmicro.com>
	<alpine.DEB.2.02.1201242144580.1998@hadrien>
	<20120126110506.GB2611@pengutronix.de>
	<alpine.DEB.2.02.1201261220460.1851@localhost6.localdomain6>
	<20120126112242.GA9401@opensource.wolfsonmicro.com>
	<alpine.DEB.2.02.1201261439460.1851@localhost6.localdomain6>
	<20120126135135.GD2611@pengutronix.de>
	<alpine.DEB.2.02.1202041922070.1974@hadrien>
	<20120204184638.GA10688@opensource.wolfsonmicro.com>
In-Reply-To: <20120204184638.GA10688@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Wolfram Sang <w.sang@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dong Aisheng-B29396 <B29396@freescale.com>, Liam Girdwood <lrg@ti.com>

And how about a function devm_clk_get?  It looks like there would be 
around 150 opportunities for its use.

julia
