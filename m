From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Thu, 21 Sep 2006 00:13:19 +0000
Subject: Re: [KJ] [PATCH] Documentation fixes in intel810.txt
Message-Id: <20060920171319.adb5fc5a.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200609210103.10768.reiner@reiner-h.de>
	<20060920161546.7d009c9e.rdunlap@xenotime.net>
	<200609210132.54818.reiner@reiner-h.de>
In-Reply-To: <200609210132.54818.reiner@reiner-h.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiner Herrmann <reiner@reiner-h.de>
Cc: adaplas@pol.net, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Thu, 21 Sep 2006 01:32:54 +0200 Reiner Herrmann wrote:

> > >  
> > > -   g. "hsync1/hsync2:<value>" 
> > > -	select the minimum and maximum Horizontal Sync Frequency of the 
> > > -	monitor in KHz.  If a using a fixed frequency monitor, hsync1 must 
> > > +   g. "hsync1/hsync2:<value>"
> > > +	select the minimum and maximum Horizontal Sync Frequency of the
> > > +	monitor in kHz.  If using a fixed frequency monitor, hsync1 must
> > 
> > Why small 'k'?  Is that some standard?
> > I prefer KHz but I'm flexible.
> 
> Those prefixes are case-sensitive (i.e. m = milli and M = Mega).
> The abbreviation for kilo is a lowercase k.

Yep, unfortunately.  so there goes history.  oh well.  :)

> So here is a corrected version of the patch (with some more fixes I just detected).

one small comment below.

> Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
> ---
> diff -uprN -X linux-2.6.18/Documentation/dontdiff linux-2.6.18/Documentation/fb/intel810.txt linux-work/Documentation/fb/intel810.txt
> --- linux-2.6.18/Documentation/fb/intel810.txt	2006-09-20 05:42:06.000000000 +0200
> +++ linux-work/Documentation/fb/intel810.txt	2006-09-21 01:30:37.000000000 +0200

> -   i. "voffset:<value>"	
> -        select at what offset in MB of the logical memory to allocate the 
> +   i. "voffset:<value>"
> +	select at what offset in MB of the logical memory to allocate the
>  	framebuffer memory.  The intent is to avoid the memory blocks
>  	used by standard graphics applications (XFree86).  The default
> -        offset (16 MB for a 64MB aperture, 8 MB for a 32MB aperture) will
> -        avoid XFree86's usage and allows up to 7MB/15MB of framebuffer
> -        memory.  Depending on your usage, adjust the value up or down, 
> -	(0 for maximum usage, 31/63 MB for the least amount).  Note, an 
> +	offset (16 MB for a 64MB aperture, 8 MB for a 32MB aperture) will

You could make "<number> MB" be consistent (preferably with space there).
Otherwise looks good to me.  Thanks.

> +	avoid XFree86's usage and allows up to 7MB/15MB of framebuffer
> +	memory.  Depending on your usage, adjust the value up or down,
> +	(0 for maximum usage, 31/63 MB for the least amount).  Note, an
>  	arbitrary setting may conflict with XFree86.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
