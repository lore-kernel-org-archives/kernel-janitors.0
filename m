From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 04 Jan 2021 16:59:53 +0000
Subject: Re: [PATCH] sound: Convert strlcpy to strscpy when return value is unused
Message-Id: <s5hturw7i46.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <58a84d03b714f71d231f9cac04af09a6b97c6f04.camel@perches.com>
In-Reply-To: <58a84d03b714f71d231f9cac04af09a6b97c6f04.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>

On Thu, 31 Dec 2020 20:04:50 +0100,
Joe Perches wrote:
> 
> strlcpy is deprecated.  see: Documentation/process/deprecated.rst
> 
> Change the calls that do not use the strlcpy return value to the
> preferred strscpy.
> 
> Done with cocci script:
> 
> @@
> expression e1, e2, e3;
> @@
> 
> -	strlcpy(
> +	strscpy(
> 	e1, e2, e3);
> 
> This cocci script leaves the instances where the return value is
> used unchanged.
> 
> After this patch, sound/ has 3 uses of strlcpy() that need to be
> manually inspected for conversion and changed one day.
> 
> $ git grep -w strlcpy sound/
> sound/usb/card.c:               len = strlcpy(card->longname, s, sizeof(card->longname));
> sound/usb/mixer.c:      return strlcpy(buf, p->name, buflen);
> sound/usb/mixer.c:                      return strlcpy(buf, p->names[index], buflen);
> 
> Miscellenea:
> 
> o Remove trailing whitespace in conversion of sound/core/hwdep.c
> 
> Link: https://lore.kernel.org/lkml/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Could you resubmit to alsa-devel ML?


thanks,

Takashi
