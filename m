From: Matthew Wilcox <willy@debian.org>
Date: Wed, 16 Jun 2004 14:12:47 +0000
Subject: Re: [Kernel-janitors] please comment on this patch
Message-Id: <20040616141247.GM20511@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70474838878147472=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
In-Reply-To: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============70474838878147472==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 15, 2004 at 07:57:32PM -0700, Kristen Carlson wrote:
> For removing check_region from drivers/char/esp.c

Better than most first attempts, but some problems.  Mostly inherent in the
original driver ;-)

It's quite a bizarre driver really.  It has a list of io port addresses:

        int esp[] = {0x100,0x140,0x180,0x200,0x240,0x280,0x300,0x380};

and then a do..while loop like this:

        i = 0;
        offset = 0;

        do {
                info->port = esp[i] + offset;
                if (!autoconfig(info, &region_start)) {
                        i++;
                        offset = 0;
                        continue;
                }
...
                if (offset == 56) {
                        i++;
                        offset = 0;
                } else {
                        offset += 8;
                }
        } while (i < NR_PRIMARY);

ie we have two loops that have been turned into one.  Blech.

Now we have autoconfig() itself.  We don't need interrupts disabled while
calling request_region() [indeed, this is actually a bug -- request_region()
calls kmalloc(GFP_KERNEL)].  So autoconfig() should look more like:

static _INLINE_ int autoconfig(struct esp_struct * info, int *region_start)
{
        int port_detected = 0;
        unsigned long flags;

	if (!request_region(*region_start, info->port - *region_start + 8,
			"esp serial"))
		return -EIO;

	save_flags(flags); cli();
...

Personally, I dislike the port_detected flag.  I would do that part as:

	if (serial_in(info, UART_ESI_BASE) == 0xf3) {
		serial_out(info, UART_ESI_CMD1, 0x00);
		serial_out(info, UART_ESI_CMD1, 0x01);
		if ((serial_in(info, UART_ESI_STAT2) & 0x70) != 0x20)
			goto not_present;
...
	}

	restore_flags(flags);
	return 1;

 not_present:
	release_region(*region_start, info->port - *region_start + 8);
	restore_flags(flags);
	return 0;
}

The big thing that concerns me about the original driver is:

                        if (ports && (ports->port == (info->port - 8))) {
                                release_region(*region_start,
                                               info->port - *region_start);
                        } else
                                *region_start = info->port;

This seems to be an attempt to combine all the contiguous port ranges
into one.  Your patch breaks this as we'll always end up with the region
being released when we fail to discover the last consecutive port.
But the original code was so obfuscated, I can't really blame you for
missing this one.

I think it's probably better to ignore this previous "feature" of the driver.
No other driver (that I know of) does this, and we can simplify the driver
as follows:

	if (!request_region(*region_start, info->port - *region_start + 8,
			 "esp serial"))
becomes
	if (!request_region(info->port, 8, "esp serial"))

We can lose the region_start variable entirely (every use of it becomes
obsolete across the entire driver).  espserial_exit() needs to be changed
to go along with this new scheme.

Somebody really needs to step up and maintain this driver (preferably
someone with hardware).  It won't work on SMP with 2.6 and it needs to
be converted to use the new serial core (drivers/serial/)

Hope that was useful.

>  
> --- linux-2.6.6.kc/drivers/char/esp.orig	2004-06-15 11:40:24.643063272 -0700
> +++ linux-2.6.6.kc/drivers/char/esp.c	2004-06-15 11:43:27.223306856 -0700
> @@ -2369,9 +2369,21 @@ static _INLINE_ int autoconfig(struct es
>  	/*
>  	 * Check for ESP card
>  	 */
> +	if (ports && (ports->port == (info->port - 8))) {
> +		release_region(*region_start,
> +			       info->port - *region_start);
> +	} else
> +		*region_start = info->port;
> +
> +	if (!request_region(*region_start,
> +		       info->port - *region_start + 8,
> +		       "esp serial"))
> +	{
> +		restore_flags(flags);
> +		return -EIO;
> +	}
>  
> -	if (!check_region(info->port, 8) && 
> -	    serial_in(info, UART_ESI_BASE) == 0xf3) {
> +	if (serial_in(info, UART_ESI_BASE) == 0xf3) {
>  		serial_out(info, UART_ESI_CMD1, 0x00);
>  		serial_out(info, UART_ESI_CMD1, 0x01);
>  
> @@ -2387,19 +2399,6 @@ static _INLINE_ int autoconfig(struct es
>  					info->irq = 4;
>  			}
>  
> -			if (ports && (ports->port == (info->port - 8))) {
> -				release_region(*region_start,
> -					       info->port - *region_start);
> -			} else
> -				*region_start = info->port;
> -
> -			if (!request_region(*region_start,
> -				       info->port - *region_start + 8,
> -				       "esp serial"))
> -			{
> -				restore_flags(flags);
> -				return -EIO;
> -			}
>  
>  			/* put card in enhanced mode */
>  			/* this prevents access through */
> @@ -2410,8 +2409,11 @@ static _INLINE_ int autoconfig(struct es
>  			serial_out(info, UART_ESI_CMD1, ESI_WRITE_UART);
>  			serial_out(info, UART_ESI_CMD2, UART_MCR);
>  			serial_out(info, UART_ESI_CMD2, 0x00);
> -		}
> -	}
> +		} 
> +	} 
> +	if (!port_detected)
> +		release_region(*region_start,
> +				info->port - *region_start + 8);
>  
>  	restore_flags(flags);
>  	return (port_detected);
> 
> 
> Thanks!
> Kristen
> 
> 
> -- 
> WWXD (What Would Xena Do?) 
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============70474838878147472==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70474838878147472==--
