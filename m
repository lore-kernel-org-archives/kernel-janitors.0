From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 18 Sep 2015 05:35:34 +0000
Subject: Re: [PATCH] coccinelle: tests: unsigned value cannot be lesser than zero
Message-Id: <alpine.DEB.2.02.1509180734350.2064@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442309232-5902-1-git-send-email-a.hajda@samsung.com>
 <55F816BC.5050407@users.sourceforge.net> <55F8204D.3080606@samsung.com>
In-Reply-To: <55F8204D.3080606@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

 >> +{unsigned char, unsigned short int, unsigned int, unsigned long, unsigned long long, size_t, u8, u16, u32, u64} v;

How about adding bool?  I don't currently find any problems with it, but
perhaps some could arise.

julia


> >> +@@
> >> +
> >> +(
> >> +*v@p < 0
> >> +|
> >> +*v@p >= 0
> >> +)
> > How do you think about to use the following SmPL wording instead?
> >
> >  v@p
> > (
> > *< 0
> > |
> > *<= 0
> > )
> >
> > Regards,
> > Markus
> >
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
