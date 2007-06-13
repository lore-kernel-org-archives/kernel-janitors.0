From: psr <pradeep.rautela@gmail.com>
Date: Wed, 13 Jun 2007 14:40:31 +0000
Subject: Re: [KJ] [KJ PATCH] Replacing alloc_pages(gfp,
Message-Id: <a901b49a0706130728q1d8f95a5h1d9a7c66a966e3c2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181702562.2282.12.camel@shani-win>
	 <a901b49a0706130312mba8a686m455b5cbf774cc159@mail.gmail.com>
	 <Pine.LNX.4.64.0706130912080.4392@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706130912080.4392@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Shani Moideen <shani.moideen@wipro.com>, netdev@vger.kernel.org, akpm@linux-foundation.org, jgarzik@pobox.com, kernel-janitors@lists.osdl.org

On 6/13/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
[snip]
> >
> > Does this makes any difference anyway? Both are same eventually?
> > What is the rational behind this? Can you please help me
> > understanding this?
>
> since this is one of the TO DO items i added to the list of things at
> the wiki:
>
> http://fsdev.net/wiki/index.php?title=Memory_allocation_cleanup
>
> i'll just toss in my $0.02.  if a short (more convenient) form of a
> routine has been defined, it should be used.  if you have no plans to
> use it, it shouldn't have been defined in the first place.

Oh... agreed

Thanks
--pradeep
>
> in short, make a consistent decision and go with it.
>
> rday
> --
> ====================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://fsdev.net/wiki/index.php?title=Main_Page
> ====================================
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
