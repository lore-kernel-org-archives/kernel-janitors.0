From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 11 Oct 2010 12:36:09 +0000
Subject: Re: [PATCH] ASoC: wm8804: fix error handling code
Message-Id: <20101011123609.GL9231@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286731745-18169-1-git-send-email-segooon@gmail.com>
	<20101011120014.GJ9231@rakim.wolfsonmicro.main>
	<20101011121555.GA32652@albatros>
In-Reply-To: <20101011121555.GA32652@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ian Lartey <ian@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>

On Mon, Oct 11, 2010 at 04:15:55PM +0400, Vasiliy Kulikov wrote:
> On Mon, Oct 11, 2010 at 13:00 +0100, Mark Brown wrote:

> > ...it's not clear to me that this change is an improvement - it'll make
> > the driver more fragile in the face of errors, I don't see a benefit in
> > refusing to register the variant for one bus if the other fails?

> I tried to implement your variant with depca driver in past, but it was
> rejected by David Miller:
> http://lists.openwall.net/netdev/2010/07/12/9

I disagree with David here, and in any case if you're going to make a
style change like this they really ought to be applied over all drivers
rather than just a few individual ones.
