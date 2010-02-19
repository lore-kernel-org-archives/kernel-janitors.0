From: Clemens Ladisch <clemens@ladisch.de>
Date: Fri, 19 Feb 2010 08:29:05 +0000
Subject: Re: [patch] oxygen: clean up. make precedence explicit
Message-Id: <4B7E4BD1.3040106@ladisch.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

> This doesn't change anything, but I think it makes the code clearer.
> It silences a smatch warning:
> sound/pci/oxygen/oxygen_mixer.c +91 dac_mute_put(7) warn: add some parenthesis here?

That message doesn't say why some parentheses should be added.
And it's a question; how do I give it the answer "no"?  :-)

> -	changed = !value->value.integer.value[0] != chip->dac_mute;
> +	changed = (!value->value.integer.value[0]) != chip->dac_mute;

This doesn't look any clearer to me; I don't think that the unary
negation operator could be thought to have lower precedence than "!=".

Why does smatch warn about this combination?  Do such errors actually
happen?


Regards,
Clemens
