From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 09 Feb 2007 07:56:23 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <1171007063.10391.5.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2007-02-09 at 08:15 +0100, Richard Knutsson wrote:
> Vignesh Babu BM wrote:
> > Mehul like I said...xdr4.c needs a simple macro that does not check type
> > at all. 
> >
> > But the macro that would work in xdr*.c would look something like the
> > below:
> >
> > #define min_s(x,y) ((x)>(y)?(x):(y))
> >
> >
> > So either we modify min/max in kernel.h - this means a lot more cleanup
> > or add another macro say min_s/max_s --- s for simple :) 
> >
> > Unless we don't do that, it may not be possible to cleanup files like
> > xdr*.c
> >   
> What about __min/__max? At least I usually read the '__'-prefix as 
> something that is a subset of something (and most likely less secure).
> I wrote about this in "[KJ] [RFC] Regarding min/max" (07-02-03) bit 
> since I was not able to find an example I took it as a mistake on my part.
> 
> Richard Knutsson
> 

Richard are you suggesting a name like __min/__max? That would be great.
-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
