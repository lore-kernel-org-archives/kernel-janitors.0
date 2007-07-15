From: Simon Arlott <simon@fire.lp0.eu>
Date: Sun, 15 Jul 2007 09:53:45 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <4699EEA9.6070709@simon.arlott.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com>
In-Reply-To: <1184489571313-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Cheng <crquan@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 15/07/07 09:52, Denis Cheng wrote:
> Signed-off-by: Denis Cheng <crquan@gmail.com>
> ---
>  drivers/net/wireless/wavelan.c |  806 ++++++++++++++++++----------------------
>  1 files changed, 369 insertions(+), 437 deletions(-)

Do people ever check what Lindent does?

> -	} else if (base_addr > 0x100) { /* Check a single specified location. */
> +	} else if (base_addr > 0x100) {	/* Check a single specified location. */

What is Lit doing here?! It's changed "{<space>/*" to "{<tab>/*"...


> -	} else { /* Scan all possible addresses of the WaveLAN hardware. */
> +	} else {		/* Scan all possible addresses of the WaveLAN hardware. */

And again... with two tabs for maximum unreadability. That line is now
90 characters long instead of 75.


> -				       "%s: <-wavelan_probe()\n",
> -				       dev->name);
> +				       "%s: <-wavelan_probe()\n", dev->name);

There are spaces in that line after the tabs...


> -out1:
> +      out1:

NAK: A perfectly valid non-indented label is now indented by 6 spaces.


> -out:
> +      out:

And again.


> -		       dev->name, (unsigned int) dev);
> +		       dev->name, (unsigned int)dev);

Those spaces after the tabs have been ignored...

-- 
Simon Arlott
