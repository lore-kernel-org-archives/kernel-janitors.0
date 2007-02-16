From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 16 Feb 2007 09:02:00 +0000
Subject: Re: [KJ] [PATCH 1/5] moving to is_power_of_2
Message-Id: <1171615800.27506.102.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2007-02-16 at 19:14 +1100, Darren Jenkins wrote:
> G'day,
> 
> I'm not sure if you are just separating your patches out, but at a
> quick glance this one makes it look like a good candidate for
> roundup_pow_of_two()
> 
> Vignesh Babu BM wrote:
> >      /* Make sure it's a power of two.  */
> > -    while ((window_size & (window_size - 1)) != 0)
> > +    //while ((window_size & (window_size - 1)) != 0)
> > +       while (!is_power_of_2(window_size))
> >         window_size += window_size & ~(window_size - 1);
> >
> 
> and this one for a possible future rounddown_pow_of_two() (which I
> guess is not so interesting).
> 
> >                         /* Find the largest power-of-two */
> > -                       while (temp_size & (temp_size - 1))
> > +                       //while (temp_size & (temp_size - 1))
> > +                       while (!is_power_of_2(temp_size))
> >                                 temp_size &= (temp_size - 1);
> 
> 
> Darren Jenkins

Thnks...Darren. I 'am' creating another patch for round up.

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
