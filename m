From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Tue, 18 Oct 2011 13:26:03 +0000
Subject: Re: [alsa-devel] [PATCH 1/3] sound/soc/mxs/mxs-saif.c: keep
Message-Id: <20111018132603.GC18713@sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1318909555-12933-1-git-send-email-julia@diku.dk>
	<65EE16ACC360FA4D99C96DC085B3F7722AB64D@039-SN1MPN1-003.039d.mgd.msft.net>
	<Pine.LNX.4.64.1110181517320.17200@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1110181517320.17200@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wolfram Sang <w.sang@pengutronix.de>, Dong Aisheng-B29396 <B29396@freescale.com>, Liam Girdwood <lrg@ti.com>

On Tue, Oct 18, 2011 at 03:18:01PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Add a new variable for storing resources accessed subsequent to the one
> accessed using request_mem_region, so the one accessed using
> request_mem_region can be released if needed.

The same issue applies to all the patches in the series, adding a number
onto the end of the variable name to make the new one isn't ideal.
