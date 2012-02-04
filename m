From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 04 Feb 2012 18:25:05 +0000
Subject: devm_request_and_ioremap
Message-Id: <alpine.DEB.2.02.1202041922070.1974@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326362117-29371-1-git-send-email-Julia.Lawall@lip6.fr>
	<7FE21149F4667147B645348EC605788508FBDB@039-SN2MPN1-013.039d.mgd.msft.net>
	<alpine.DEB.2.02.1201241828480.1779@localhost6.localdomain6>
	<20120124202203.GD1135@opensource.wolfsonmicro.com>
	<alpine.DEB.2.02.1201242144580.1998@hadrien>
	<20120126110506.GB2611@pengutronix.de>
	<alpine.DEB.2.02.1201261220460.1851@localhost6.localdomain6>
	<20120126112242.GA9401@opensource.wolfsonmicro.com>
	<alpine.DEB.2.02.1201261439460.1851@localhost6.localdomain6>
	<20120126135135.GD2611@pengutronix.de>
In-Reply-To: <20120126135135.GD2611@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Dong Aisheng-B29396 <B29396@freescale.com>, Liam Girdwood <lrg@ti.com>

How important is the name argument to request_mem_region?

devm_request_and_ioremap uses:

name = res->name ?: dev_name(dev);

In trying to introduce uses of devm_request_and_ioremap I thus look for 
res->name and dev_name(dev) as well as the name in the driver structure in
the platform_driver structure.  But sometimes the name is pdev->name, ie 
the name field of the argument to the probe function.  And sometimes it is 
a string that is slightly different than what is in the driver structure.

thanks,
julia
