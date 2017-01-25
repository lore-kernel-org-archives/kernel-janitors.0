From: Clemens Ladisch <clemens@ladisch.de>
Date: Wed, 25 Jan 2017 07:40:27 +0000
Subject: Re: [alsa-devel] [PATCH 6/7] dmasound_core: Move two assignments for the variable "ret" in state_ope
Message-Id: <5701efac-3c37-8b6c-fbe7-89a54e988998@ladisch.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f2404d64-27c8-4afa-b893-fc72601c0136@users.sourceforge.net>
 <b4d0b274-23ac-4369-7119-a77e5108578b@users.sourceforge.net>
In-Reply-To: <b4d0b274-23ac-4369-7119-a77e5108578b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, Martin Koegler <martin.koegler@chello.at>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

SF Markus Elfring wrote:
> A local variable was set to an error code in two cases before a concrete
> error situation was detected.

And why would that be a problem?

http://yarchive.net/comp/linux/error_jumps.html

> -	ret = -EBUSY;
> -	if (state.busy)
> +	if (state.busy) {
> +		ret = -EBUSY;
>  		goto out;
> +	}


Regards,
Clemens
