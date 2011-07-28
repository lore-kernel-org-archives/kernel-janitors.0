From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Date: Thu, 28 Jul 2011 18:33:19 +0000
Subject: Re: [PATCH 1/2] drivers/misc/cb710/core.c: Add missing pci_dev_put
Message-Id: <20110728183319.GC24120@rere.qmqm.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1311870407-22461-1-git-send-email-julia@diku.dk>
In-Reply-To: <1311870407-22461-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 28, 2011 at 06:26:46PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> Pci_get_slot calls pci_dev_get, so pci_dev_put is needed before leaving t=
he
> function.
[...]
> --- a/drivers/misc/cb710/core.c
> +++ b/drivers/misc/cb710/core.c
> @@ -41,7 +41,7 @@ static int __devinit cb710_pci_configure(struct pci_dev=
 *pdev)
> =20
>  	pci_read_config_dword(pdev, 0x48, &val);
>  	if (val & 0x80000000)
> -		return 0;
> +		goto out;
> =20
>  	if (!pdev0)
>  		return -ENODEV;

The good fix is to use pci_get_slot() before the !pdev0 condition above.
I'll send a patch shortly.

Best Regards,
Micha=B3 Miros=B3aw
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
