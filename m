From: "Jean Delvare" <khali@linux-fr.org>
Date: Thu, 23 Feb 2006 08:57:36 +0000
Subject: Re: [KJ][Patch] fix coding style in fscpos.c
Message-Id: <ovJNjWwy.1140685056.7356660.khali@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140611727.7778.8.camel@localhost.localdomain>
In-Reply-To: <1140611727.7778.8.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi Adrian,

On 2006-02-23, Adrian Bunk wrote:
> > >  	/* Range: 0..255 */
> > > -	if (v < 0) v = 0;
> > > -	if (v > 255) v = 255;
> > > +	if (v < 0)
> > > +		v = 0;
> > > +	if (v > 255)
> > > +		v = 255;
> >
> > Not worth the effort IMHO. The original code is pretty readable as it
> > is so I wouldn't change it.
>
> It's against the kernel coding style.
>
> There many several cases with several ways to express something pretty
> readable (opening braces being an religious example), but the goal is
> to stick with one way to express something throughout the whole kernel.

I didn't mean to say otherwise. I request submitters of new drivers and
patches to comply with CodingStyle and even with the kernel guide to
space. I'm quite picky about it actually, just ask these submitters and
they'll tell you. I also wholeheartedly accept a cleanup patch,
including coding style, as the first patch of a patchset improving any
given driver, as it makes the next patches easier to work on and review.

However, I don't see much benefit in patches randomly fixing one coding
style mistake in a random driver, unless that mistake was making the
code especially unclear or error prone. The overhead to my workload and
in the driver history is simply not worth the gain. This was the meaning
of my reply.

--
Jean Delvare

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
