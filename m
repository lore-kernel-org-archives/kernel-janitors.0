From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 12 Oct 2010 09:49:27 +0000
Subject: Re: [patch] ASoC: soc: snprintf() doesn't return negative
Message-Id: <s5hvd57eo60.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101011035416.GD5851@bicker>
	<20101011104009.GB9231@rakim.wolfsonmicro.main>
	<20101011164038.GE5851@bicker>
	<20101011185148.GB22355@opensource.wolfsonmicro.com>
	<20101011194502.GK5851@bicker> <s5hpqvg1m7v.wl%tiwai@suse.de>
	<20101012093506.GB30933@rakim.wolfsonmicro.main>
In-Reply-To: <20101012093506.GB30933@rakim.wolfsonmicro.main>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, Dan Carpenter <error27@gmail.com>, Jassi Brar <jassi.brar@samsung.com>, kernel-janitors@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@nokia.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

At Tue, 12 Oct 2010 10:35:07 +0100,
Mark Brown wrote:
> 
> On Mon, Oct 11, 2010 at 10:57:40PM +0200, Takashi Iwai wrote:
> > Dan Carpenter wrote:
> 
> > Well, actually we should fix either:
> 
> > - check the return of snprintf() at each time properly,
> > 
> > 	list_for_each_entry(dai, &dai_list, list) {
> > 		int len = snprintf(buf + ret, PAGE_SIZE - ret, "%s\n", dai->name);
> > 		if (len < 0)
> > 			return len;
> > 		ret += len;
> > 	}
> 
> In this case we're deliberately eating the error since all these files
> are about getting diagnostics out - the code is intentionally soldiering
> on and trying to get as much data out as possible rather than giving up
> on error.

Then replace return with continue.  But, the error doesn't occur in
the case of kernel snprintf(), so it should be no issue.

> > In either case, a negative check after for loop is superfluous.
> 
> In those ones, yes - it's pretty much there for paranoia since the copy
> to userspace is more likely to explode than random memory corruption.

Well, the point is that checking the error at that point is logically
wrong and pointless.  It's not about optimization or such.  It's about
the code logic.

> > And, when no negative return value is assured (or filtered out like
> > above), there can't be overflow, too.  snprintf() fills the string
> > at most the size including NUL-char.  OTOH, it returns the size that
> > doesn't include NUL-char.
> 
> Dan was saying that it would return sizes larger than the string it
> wrote (which is a behaviour of some implementations) which would be
> an issue since it would cause us to pass bad buffer pointers into
> subsequent snprintf() calls.
> 
> I've not had time to look at this properly but Dan's analysis seems off.

Argh, yes, I'm (again) confused by that behavior.
The problem is the potential buffer overflow, indeed.  snprintf()
returns the size that would be printed.  Thus a safe code would be
like:

	list_for_each_entry(dai, &dai_list, list) {
 		int len = snprintf(buf + ret, PAGE_SIZE - ret, "%s\n", dai->name);
 		if (len < 0)
 			continue;
 		ret += len;
		if (ret >= PAGE_SIZE) {
			ret = PAGE_SIZE;
			break;
		}
	}

Or, by assumption of non-negative return,

	list_for_each_entry(dai, &dai_list, list) {
 		ret += snprintf(buf + ret, PAGE_SIZE - ret, "%s\n", dai->name);
		if (ret >= PAGE_SIZE) {
			ret = PAGE_SIZE;
			break;
		}
	}


Takashi
