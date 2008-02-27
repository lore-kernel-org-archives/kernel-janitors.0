From: Julia Lawall <julia@diku.dk>
Date: Wed, 27 Feb 2008 17:41:31 +0000
Subject: Re: [PATCH 2/9] drivers/acpi/asus_acpi.c: Correct use of.and &
Message-Id: <Pine.LNX.4.58.0802271838190.1187@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262142120.18200@ask.diku.dk>
 <7C626792-02A6-4BE6-B5F2-D75899F3990C@hell.org.pl>
In-Reply-To: <7C626792-02A6-4BE6-B5F2-D75899F3990C@hell.org.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karol Kozimor <sziwan@hell.org.pl>
Cc: corentincj@iksaif.net, sziwan@users.sourceforge.net, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 27 Feb 2008, Karol Kozimor wrote:

> On 26-02-2008, at 21:42, Julia Lawall wrote:
> >  	if (invert)		/* invert target value */
> > -		led_out = !led_out & 0x1;
> > +		led_out = !(led_out & 0x1);
> >
> >  	if (!write_acpi_int(hotk->handle, ledname, led_out, NULL))
> >  		printk(KERN_WARNING "Asus ACPI: LED (%s) write failed\n",
>
>
> IIRC we're just supposed to flip the last bit here, so the original
> code is correct.

I spent some time thinking about this one.  The original code is ok if
led_out is always either 0x01 or 0x00.  But what if it is eg 0xc0?  Then
the negation amounts to the negation of a nonzero number, so the result is
0.  So the result of the bit and is 0.  So the last bit is not flipped.
But I don't know what is the range of led_out.  If it is always 1 or 0,
then why bother with the bit and?

julia

