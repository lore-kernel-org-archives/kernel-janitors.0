From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 11 Oct 2010 20:57:40 +0000
Subject: Re: [patch] ASoC: soc: snprintf() doesn't return negative
Message-Id: <s5hpqvg1m7v.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101011035416.GD5851@bicker>
	<20101011104009.GB9231@rakim.wolfsonmicro.main>
	<20101011164038.GE5851@bicker>
	<20101011185148.GB22355@opensource.wolfsonmicro.com>
	<20101011194502.GK5851@bicker>
In-Reply-To: <20101011194502.GK5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, Jassi Brar <jassi.brar@samsung.com>, kernel-janitors@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Peter Ujfalusi <peter.ujfalusi@nokia.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

At Mon, 11 Oct 2010 21:45:02 +0200,
Dan Carpenter wrote:
> 
> On Mon, Oct 11, 2010 at 07:51:48PM +0100, Mark Brown wrote:
> > In actual fact quite a few devices have enough registers to be
> > truncated, meaning that it's not only possible but likely we'll exercise
> > the cases that deal with the end of buffer.  If snprintf() is returning
> > values larger than buffer size it was given we're likely to have an
> > issue but it seems that there's something missing in your analysis since
> > we're never seeing WARN_ON()s and are instead seeing the behaviour the
> > code is intended to give, which is to truncate the output when we run
> > out of space.
> > 
> > Could you re-check your analysis, please?
> 
> That's odd.  I'm sorry, I can't explain why you wouldn't see a stack
> trace...  The code is straight forward:
> 
>         /* Reject out-of-range values early.  Large positive sizes are
>            used for unknown buffer sizes. */
>         if (WARN_ON_ONCE((int) size < 0))
>                 return 0;
> 
> It would still give you truncated output but after the NULL terminator
> there would be information leaked from the kernel.  If the reader
> program had allocated a large enough buffer to handle the extra
> information it wouldn't cause a problem.

Well, actually we should fix either:

- check the return of snprintf() at each time properly,

	list_for_each_entry(dai, &dai_list, list) {
		int len = snprintf(buf + ret, PAGE_SIZE - ret, "%s\n", dai->name);
		if (len < 0)
			return len;
		ret += len;
	}

- or just assume it's never negative (as is on Linux kernel code)

In either case, a negative check after for loop is superfluous.

And, when no negative return value is assured (or filtered out like
above), there can't be overflow, too.  snprintf() fills the string
at most the size including NUL-char.  OTOH, it returns the size that
doesn't include NUL-char.


Takashi
