From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Thu, 14 Feb 2008 22:16:44 +0000
Subject: Re: [PATCH 2/6] fs/direct-io.c: Use DIV_ROUND_UP
Message-Id: <200802142316.44985.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0802141614050.1185@pc-041.diku.dk> <84144f020802141018i235d3adfu13a84d124dc3964e@mail.gmail.com> <Pine.LNX.4.64.0802142049510.19977@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802142049510.19977@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Nishanth Aravamudan <nacc@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello,

> > >  Is it just me, or does
> > >
> > >         ((user_addr + iov[seg].iov_len + PAGE_SIZE - 1)/PAGE_SIZE - user_addr/PAGE_SIZE)
> > >
> > >  not simplify to
> > >
> > >         = ((iov[seg].iov_len + PAGE_SIZE - 1)/PAGE_SIZE + user_addr/PAGE_SIZE - user_addr/PAGE_SIZE)
> > >
> > >         = ((iov[seg].iov_len + PAGE_SIZE - 1)/PAGE_SIZE)
> > >
> > >         = DIV_ROUND_UP(iov[seg].iov_len, PAGE_SIZE)
> > >
> > >  CMIIW.
> > 
> > I double-checked this and I believe you're correct. It's simpler to
> > see when you do:
> > 
> >   x = user_addr
> >   y = iov[seg].iov_len
> >   z = PAGE_SIZE
> > 
> > So
> > 
> >   (x + y + z - 1)/z - x/z
> > 
> >   = [x + (y + z - 1)]/z - x/z
> > 
> >   = [xz + z(y + z - 1)]/z^2 - x/z
> > 
> >   = x/z + (y + z - 1)/z - x/z
> > 
> > And the rest follows from your simplifications.
> 
> It doesn't work:
> 
>  ((3+4+5-1)/5) - (3/5) = 2
>  ((4+5-1)/5) = 1

Logic was wrong but conclusion was right :) and so was Nishanth:

(a + b) + c = a + (b + c)

and

k   l   k + l
- + - = -----
m   m     m

thus:

(user_addr + iov[seg].iov_len + PAGE_SIZE - 1) = user_addr + (iov[seg].iov_len + PAGE_SIZE - 1)

and


user_addr + iov[seg].iov_len + PAGE_SIZE - 1   user_addr
-------------------------------------------- - ---------                  PAGE_SIZE                     PAGE_SIZE


user_addr   iov[seg].iov_len + PAGE_SIZE - 1   user_addr
--------- + -------------------------------- - --------- = 
PAGE_SIZE               PAGE_SIZE              PAGE_SIZE


iov[seg].iov_len + PAGE_SIZE - 1
--------------------------------
           PAGE_SIZE


or even more:


iov[seg].iov_len - 1
-------------------- + 1
     PAGE_SIZE


Regards,

	Mariusz
