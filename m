From: David Brownell <david-b@pacbell.net>
Date: Mon, 21 Apr 2008 20:14:09 +0000
Subject: Re: ehci tests unsigned variables against 0
Message-Id: <200804211314.09537.david-b@pacbell.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080419145812.GN20637@parisc-linux.org>
In-Reply-To: <20080419145812.GN20637@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 21 April 2008, Matthew Wilcox wrote:
> > -ENOPATCH
> 
> Yeah ... I didn't bother with one.  Let's try now:

If you send this as a proper patch to linux-usb@vger,
you can add

Acked-by: David Brownell <dbrownell@users.sourceforge.net>

> 
> diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
> index 64ebfc5..55a2c73 100644
> --- a/drivers/usb/host/ehci-dbg.c
> +++ b/drivers/usb/host/ehci-dbg.c
> @@ -454,9 +454,7 @@ static void qh_lines (
>  				(scratch >> 16) & 0x7fff,
>  				scratch,
>  				td->urb);
> -		if (temp < 0)
> -			temp = 0;
> -		else if (size < temp)
> +		if (size < temp)
>  			temp = size;
>  		size -= temp;
>  		next += temp;
> @@ -465,9 +463,7 @@ static void qh_lines (
>  	}
>  
>  	temp = snprintf (next, size, "\n");
> -	if (temp < 0)
> -		temp = 0;
> -	else if (size < temp)
> +	if (size < temp)
>  		temp = size;
>  	size -= temp;
>  	next += temp;
> 
> > ... although if that's the case, I'd think that the *snprintf()
> > signatures are incorrect:  they should return "unsigned" not "int".
> > If that were done, I think even GCC could be made to report such
> > issues; one wouldn't need less-common tools like coccinelle.
> 
> We can take it up with ANSI, but I'm not sure they'll be interested in
> changing the return type of snprintf ...

I don't care so much about ANSI as about <linux/kernel.h>,
at least in this context...

- Dave
