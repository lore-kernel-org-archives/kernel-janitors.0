From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 10 May 2015 20:03:21 +0000
Subject: Re: type mismatch
Message-Id: <alpine.DEB.2.02.1505102203120.2055@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1505101517100.2645@hadrien>
In-Reply-To: <alpine.DEB.2.10.1505101517100.2645@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 10 May 2015, Dan Carpenter wrote:

> I don't really have a strong opinion either way...  It's unlikely that
> we will introduce a bug here and if we did, I think it would be caught
> immediately in testing.
> 
> It's pretty common to treat the first member of a struct as special.
> What annoys me is when people do
> 
> struct foo {
> 	int one, two, three;
> 	whatever;
> };
> 
> memcpy(&foo.one, src, sizoef(struct foo));
> 
> Argh!?  These triger buffer overflows warnings in Smatch and I don't
> see the point since &foo.one is less readable than &foo!  Oh well, I
> think these were common enough, I had to treat it as idiomatic and add a
> special case for them.

OK, thanks.

julia
