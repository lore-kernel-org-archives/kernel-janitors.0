From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Sat, 10 Feb 2007 05:49:28 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <1171085849.10391.23.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2007-02-09 at 23:28 +0100, Richard Knutsson wrote:
> Mehul Jani wrote: 
> > I believe Vignesh had confirmed the patch.....
> >  
> > So now this is going to be crazy we have 3 pairs of min/max to deal with
> >  
> > min()/max()
> > min_t()/max_t()
> > __min()/__max()
> >  
> > Can the first one be considered *redundant*
> min()/max()? That is our crown-jewel. I think the order above is then 
> one how to implement min/max. Use ex min() when possible. If min() does 
> not work, use min_t(). If min_t() does not work, use __min() (if it will 
> be accepted, that is). But you have to be more careful when using 
> __min() since it can have side-effects.
> > I was wondering that from the very first. calling MACRO(MACRO()) 
> > somehow is dirty....Any suggestions !! 
> Why? Calling function1(function2()) is ok (right?) and also when dealing 
> with pci-ids you use macros in macros. And the way __min() is in min() 
> and min_t() is also just common practice to reduce multiple declarations.
> 
> Richard Knutsson
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors

Mehul I have tested the patch-compiles cleanly.
-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
