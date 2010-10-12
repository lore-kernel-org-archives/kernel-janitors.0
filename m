From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Tue, 12 Oct 2010 09:56:05 +0000
Subject: Re: [patch] ASoC: soc: snprintf() doesn't return negative
Message-Id: <20101012095605.GC30933@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101011035416.GD5851@bicker>
	<20101011104009.GB9231@rakim.wolfsonmicro.main>
	<20101011164038.GE5851@bicker>
	<20101011185148.GB22355@opensource.wolfsonmicro.com>
	<20101011194502.GK5851@bicker> <s5hpqvg1m7v.wl%tiwai@suse.de>
	<20101012093506.GB30933@rakim.wolfsonmicro.main>
	<s5hvd57eo60.wl%tiwai@suse.de>
In-Reply-To: <s5hvd57eo60.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Dan Carpenter <error27@gmail.com>, Jassi Brar <jassi.brar@samsung.com>, kernel-janitors@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@nokia.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Tue, Oct 12, 2010 at 11:49:27AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> Argh, yes, I'm (again) confused by that behavior.
> The problem is the potential buffer overflow, indeed.  snprintf()
> returns the size that would be printed.  Thus a safe code would be
> like:
> 
> 	list_for_each_entry(dai, &dai_list, list) {
>  		int len = snprintf(buf + ret, PAGE_SIZE - ret, "%s\n", dai->name);
>  		if (len < 0)
>  			continue;
>  		ret += len;
> 		if (ret >= PAGE_SIZE) {
> 			ret = PAGE_SIZE;
> 			break;
> 		}
> 	}

Yes, this form is better for that variant of the loop - that is safe and
legible without relying on current implementation details of snprintf().
