From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 29 Feb 2008 06:14:35 +0000
Subject: Re: [PATCH 2/9] drivers/acpi/asus_acpi.c: Correct use of.and &
Message-Id: <20080229061435.GE19198@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262142120.18200@ask.diku.dk> <7C626792-02A6-4BE6-B5F2-D75899F3990C@hell.org.pl> <47C5ABFB.3050607@googlemail.com> <20080228215503.b942bb3c.akpm@linux-foundation.org> <20080229061023.GD19198@parisc-linux.org>
In-Reply-To: <20080229061023.GD19198@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Pearson <devnull.port@googlemail.com>, Karol Kozimor <sziwan@hell.org.pl>, Julia Lawall <julia@diku.dk>, corentincj@iksaif.net, sziwan@users.sourceforge.net, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Len Brown <lenb@kernel.org>

On Thu, Feb 28, 2008 at 11:10:23PM -0700, Matthew Wilcox wrote:
> On Thu, Feb 28, 2008 at 09:55:03PM -0800, Andrew Morton wrote:
> >  	if (invert)		/* invert target value */
> > -		led_out = !led_out & 0x1;
> > +		led_out = !led_out;
> >  
> >  	if (!write_acpi_int(hotk->handle, ledname, led_out, NULL))
> 
> But now you're writing 0xffffffff instead of 1.  I think the suggestion
> of led_out ^= 1 was the correct one.

! is not ~
! is not ~
! is not ~
....

I'll go to sleep now.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
