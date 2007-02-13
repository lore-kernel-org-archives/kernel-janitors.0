From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Tue, 13 Feb 2007 10:38:48 +0000
Subject: Re: [KJ] anyone interested in the "power of 2" stuff?
Message-Id: <1171362408.20656.6.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2007-02-13 at 04:46 -0500, Robert P. J. Day wrote:
> On Tue, 13 Feb 2007, Vignesh Babu BM wrote:
> 
> >
> > I have a doubt:
> > There are instances as follows:
> >
> > if(!iobase_reg && !is_power_of_2(iobase_reg))
> > ---where we are checking for 0 at 2 places-both inside and outside of
> > is_power_of_2
> >
> > But the n & (n-1) is just one step.
> > Is this not more optimised?
> >
> > What would you suggest here?
> 

> and while that might seem *superficially* almost the same thing,
> semantically it's quite different.
Agreed.

> 
> it might be worth defining a macro:
> 
>   #define at_most_one_bit_set(n)      ((n) & ((n) - 1))
> 
> thoughts?
> 
> rday
> 

There are around 80 instances of code similar to the above. So instead
of a macro why not do an inline function?
And btw where would it go?

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
