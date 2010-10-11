From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 11 Oct 2010 12:59:34 +0000
Subject: Re: [PATCH] ASoC: wm8804: fix error handling code
Message-Id: <20101011125934.GM9231@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286731745-18169-1-git-send-email-segooon@gmail.com>
	<20101011120014.GJ9231@rakim.wolfsonmicro.main>
	<20101011121555.GA32652@albatros>
	<20101011123609.GL9231@rakim.wolfsonmicro.main>
	<20101011125056.GA25041@albatros>
In-Reply-To: <20101011125056.GA25041@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ian Lartey <ian@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>

On Mon, Oct 11, 2010 at 04:50:56PM +0400, Vasiliy Kulikov wrote:

> It is not greppable situation to simply change the behavior of all
> drivers.  I was looking for memory leak bugs in drivers/net/ and fixed
> some of them.  Manual looking through _all_ drivers takes much more
> time.  In general I try to search for repeatable bugs with coccinelle,
> but it is rare case.

The method you're using to generate the patches is pretty much
orthogonal to anything else, except of course in the case where you're
also submitting the automation for checking (which is useful where
possible).
