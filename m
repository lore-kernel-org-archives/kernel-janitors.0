From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 29 Feb 2008 06:19:48 +0000
Subject: Re: [PATCH 2/9] drivers/acpi/asus_acpi.c: Correct use of.and &
Message-Id: <20080228221948.2602527a.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262142120.18200@ask.diku.dk>
	<7C626792-02A6-4BE6-B5F2-D75899F3990C@hell.org.pl>
	<47C5ABFB.3050607@googlemail.com>
	<20080228215503.b942bb3c.akpm@linux-foundation.org>
	<20080229061023.GD19198@parisc-linux.org>
In-Reply-To: <20080229061023.GD19198@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Mark Pearson <devnull.port@googlemail.com>, Karol Kozimor <sziwan@hell.org.pl>, Julia Lawall <julia@diku.dk>, corentincj@iksaif.net, sziwan@users.sourceforge.net, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Len Brown <lenb@kernel.org>

On Thu, 28 Feb 2008 23:10:23 -0700 Matthew Wilcox <matthew@wil.cx> wrote:

> On Thu, Feb 28, 2008 at 09:55:03PM -0800, Andrew Morton wrote:
> >  	if (invert)		/* invert target value */
> > -		led_out = !led_out & 0x1;
> > +		led_out = !led_out;
> >  
> >  	if (!write_acpi_int(hotk->handle, ledname, led_out, NULL))
> 
> But now you're writing 0xffffffff instead of 1.  I think the suggestion
> of led_out ^= 1 was the correct one.
> 

!0 is 1, not 0xffffffff.

IOW, ! != ~ ;)


