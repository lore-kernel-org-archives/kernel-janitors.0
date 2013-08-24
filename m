From: Tim Small <tim@buttersideup.com>
Date: Sat, 24 Aug 2013 20:05:49 +0000
Subject: Re: [RFC] r82600_edac: '&' vs '|' typo
Message-Id: <5219121D.9080808@buttersideup.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823131539.GA27612@elgon.mountain>
In-Reply-To: <20130823131539.GA27612@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Yes, this looks like my error.  I still have a copy of the data sheet,
but no access to this hardware to test, but this fix looks like what I
must have intended.

Acked-by: tim@buttersideup.com


Tim.

On 23/08/13 14:15, Dan Carpenter wrote:
> This is a shot in the dark.  Doing the & here seems like not correct
> because "0x1 & 0x2" is zero.  I think '|' is probably intended because
> that's often the case with these.
>
> But this is just a guess.
>
> I'd prefer to leave it the same if no one knows for sure what we're
> trying to do here.
>
> diff --git a/drivers/edac/r82600_edac.c b/drivers/edac/r82600_edac.c
> index 2fd6a54..656eab6 100644
> --- a/drivers/edac/r82600_edac.c
> +++ b/drivers/edac/r82600_edac.c
> @@ -146,14 +146,14 @@ static void r82600_get_error_info(struct mem_ctl_info *mci,
>  	if (info->eapr & BIT(0))
>  		/* Clear error to allow next error to be reported [p.62] */
>  		pci_write_bits32(pdev, R82600_EAP,
> -				 ((u32) BIT(0) & (u32) BIT(1)),
> -				 ((u32) BIT(0) & (u32) BIT(1)));
> +				 ((u32) BIT(0) | (u32) BIT(1)),
> +				 ((u32) BIT(0) | (u32) BIT(1)));
>  
>  	if (info->eapr & BIT(1))
>  		/* Clear error to allow next error to be reported [p.62] */
>  		pci_write_bits32(pdev, R82600_EAP,
> -				 ((u32) BIT(0) & (u32) BIT(1)),
> -				 ((u32) BIT(0) & (u32) BIT(1)));
> +				 ((u32) BIT(0) | (u32) BIT(1)),
> +				 ((u32) BIT(0) | (u32) BIT(1)));
>  }
>  
>  static int r82600_process_error_info(struct mem_ctl_info *mci,

