From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 11 Oct 2010 10:40:09 +0000
Subject: Re: [patch] ASoC: soc: snprintf() doesn't return negative
Message-Id: <20101011104009.GB9231@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101011035416.GD5851@bicker>
In-Reply-To: <20101011035416.GD5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, Jassi Brar <jassi.brar@samsung.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@nokia.com>, Liam Girdwood <lrg@slimlogic.co.uk>

On Mon, Oct 11, 2010 at 05:54:17AM +0200, Dan Carpenter wrote:
> In user space snprintf() returns negative on errors but the kernel
> version only returns positives.  It could potentially return sizes

I'm not going to apply this.  snprintf() returns a signed type, checking
that the return value is a reasonable thing to do here - at worst we're
wasting a few cycles in code that's nowhere near a hot path, at best
we're robust in the face of a decision to add error reporting to
snprintf() so it's hard to see this change as an improvement.

> larger than the size of the buffer so we should check for that.

> -	if (ret >= 0)
> -		ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
> +	if (ret > PAGE_SIZE)
> +		ret = PAGE_SIZE;
> +
> +	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);

The PAGE_SIZE part of the change has an issue too, the code immediately
preceeding this is:

	list_for_each_entry(codec, &codec_list, list)
		ret += snprintf(buf + ret, PAGE_SIZE - ret, "%s\n",
				codec->name);

so it's rather late to be worrying about PAGE_SIZE after the loop.

Please also try to be a bit more thoughtful in your use of
get_maintainers; try to have a look at why people have come up and
consider if it's really sensible to include them.
