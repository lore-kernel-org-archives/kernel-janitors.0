From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 29 Feb 2008 21:33:20 +0000
Subject: Re: [PATCH 2/9] drivers/acpi/asus_acpi.c: Correct use of.and &
Message-Id: <20080229133320.1ec95e84.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262142120.18200@ask.diku.dk>
	<7C626792-02A6-4BE6-B5F2-D75899F3990C@hell.org.pl>
	<47C5ABFB.3050607@googlemail.com>
	<20080228215503.b942bb3c.akpm@linux-foundation.org>
	<47C849B8.1000902@googlemail.com>
In-Reply-To: <47C849B8.1000902@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Pearson <devnull.port@googlemail.com>
Cc: sziwan@hell.org.pl, julia@diku.dk, corentincj@iksaif.net, sziwan@users.sourceforge.net, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, lenb@kernel.org

On Fri, 29 Feb 2008 19:06:48 +0100
Mark Pearson <devnull.port@googlemail.com> wrote:

> Andrew Morton wrote:
> >> Seems an odd way of doing:
> >>
> >> 	led_out ^= 0x01;
> > 
> > It does.
> > 
> >> It this due to some optimisation?
> > 
> > Surely not ;)
> >
> ;) Thought so - one doesn't like to be too presumptuous ;)
> 
> > That code has been there for many years.
> > 
> > I changed the patch to this:
> > 
> > --- a/drivers/acpi/asus_acpi.c~drivers-acpi-asus_acpic-correct-use-of-and
> > +++ a/drivers/acpi/asus_acpi.c
> > @@ -610,7 +610,7 @@ write_led(const char __user * buffer, un
> >  	    (led_out) ? (hotk->status | ledmask) : (hotk->status & ~ledmask);
> >  
> >  	if (invert)		/* invert target value */
> > -		led_out = !led_out & 0x1;
> > +		led_out = !led_out;
> >  
> >  	if (!write_acpi_int(hotk->handle, ledname, led_out, NULL))
> >  		printk(KERN_WARNING "Asus ACPI: LED (%s) write failed\n",
> > _
> > 
> > 
> 
> Is the ! operator architecture/compiler dependent?

It shouldn't be.

> or can one always say that
> !NON_ZERO_VALUE = 0 and !0 = 1?
> 

I always have ;)  I expect it's in the C standard somewhere.
