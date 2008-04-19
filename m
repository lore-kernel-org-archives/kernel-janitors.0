From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 19 Apr 2008 14:58:13 +0000
Subject: ehci tests unsigned variables against 0
Message-Id: <20080419145812.GN20637@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 18, 2008 at 09:08:55PM +0200, Julia Lawall wrote:
> I found 63 occurrences of this problem with the following semantic match
> (http://www.emn.fr/x-info/coccinelle/):
> 
> @@ unsigned int i; @@
> 
> * i < 0
> 
> I looked through all of the results by hand, and they all seem to be 
> problems.  In many cases, it seems like the variable should not be 
> unsigned as it is used to hold the return value of a function that might 
> return a negative error code, but I haven't looked into this in detail.
> 
> In the output below, the lines that begin with a single start contain a 
> test of whether an unsigned variable or structure field is less than 0.
> The output is actually generated with diff, but I converted the -s to *s 
> to avoid confusion.

> diff -u -p a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
> *** a/drivers/usb/host/ehci-dbg.c 2008-03-12 14:13:14.000000000 +0100
> @@ -454,7 +454,7 @@ static void qh_lines (
>  				(scratch >> 16) & 0x7fff,
>  				scratch,
>  				td->urb);
> *		if (temp < 0)
>  			temp = 0;
>  		else if (size < temp)
>  			temp = size;
> @@ -465,7 +465,7 @@ static void qh_lines (
>  	}
>  
>  	temp = snprintf (next, size, "\n");
> *	if (temp < 0)
>  		temp = 0;
>  	else if (size < temp)
>  		temp = size;

These tests will never trigger and should simply be removed.  Linux's
kernel snprintf function conforms to C99 and never returns 0.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
