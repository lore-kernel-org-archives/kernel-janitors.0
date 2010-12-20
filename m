From: Lars-Peter Clausen <lars@metafoo.de>
Date: Mon, 20 Dec 2010 20:04:54 +0000
Subject: Re: [patch -next] power/gpio-charger: check for kzalloc() failure
Message-Id: <4D0FB6E6.2060608@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101220130856.GZ1936@bicker>
In-Reply-To: <20101220130856.GZ1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Anton Vorontsov <cbouatmailru@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/20/2010 02:08 PM, Dan Carpenter wrote:
> Return -ENOMEM if kzalloc() fails.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/power/gpio-charger.c b/drivers/power/gpio-charger.c
> index fccbe99..06a74f0 100644
> --- a/drivers/power/gpio-charger.c
> +++ b/drivers/power/gpio-charger.c
> @@ -87,6 +87,8 @@ static int __devinit gpio_charger_probe(struct platform_device *pdev)
>  	}
>  
>  	gpio_charger = kzalloc(sizeof(*gpio_charger), GFP_KERNEL);
> +	if (!gpio_charger)
> +		return -ENOMEM;
>  
>  	charger = &gpio_charger->charger;
>  

Hi

This is now the 4th patch or so fixing this issue. I send the first one[1], together
with some other fixes[2][3], a month ago.

Anton could you please pick them up?

Thanks
- - Lars

[1] http://lkml.indiana.edu/hypermail/linux/kernel/1011.2/02029.html
[2] http://lkml.indiana.edu/hypermail/linux/kernel/1011.2/02028.html
[3] http://lkml.indiana.edu/hypermail/linux/kernel/1011.2/02030.html

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk0PtuYACgkQBX4mSR26RiOCRQCfdKUdpAjX2GxAJuGVekZDiyjx
j3IAnRCS562ud3Ali/B5V1gWNeBHcxNj
=M4Vg
-----END PGP SIGNATURE-----
