From: Julia Lawall <julia@diku.dk>
Date: Thu, 14 Feb 2008 19:50:39 +0000
Subject: Re: [PATCH 2/6] fs/direct-io.c: Use DIV_ROUND_UP
Message-Id: <Pine.LNX.4.64.0802142049510.19977@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0802141614050.1185@pc-041.diku.dk> 
 <20080214173850.GC14191@us.ibm.com> <84144f020802141018i235d3adfu13a84d124dc3964e@mail.gmail.com>
In-Reply-To: <84144f020802141018i235d3adfu13a84d124dc3964e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Nishanth Aravamudan <nacc@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 14 Feb 2008, Pekka Enberg wrote:

> Hi Nishanth,
> 
> On Thu, Feb 14, 2008 at 7:38 PM, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> >  Is it just me, or does
> >
> >         ((user_addr + iov[seg].iov_len + PAGE_SIZE - 1)/PAGE_SIZE - user_addr/PAGE_SIZE)
> >
> >  not simplify to
> >
> >         = ((iov[seg].iov_len + PAGE_SIZE - 1)/PAGE_SIZE + user_addr/PAGE_SIZE - user_addr/PAGE_SIZE)
> >
> >         = ((iov[seg].iov_len + PAGE_SIZE - 1)/PAGE_SIZE)
> >
> >         = DIV_ROUND_UP(iov[seg].iov_len, PAGE_SIZE)
> >
> >  CMIIW.
> 
> I double-checked this and I believe you're correct. It's simpler to
> see when you do:
> 
>   x = user_addr
>   y = iov[seg].iov_len
>   z = PAGE_SIZE
> 
> So
> 
>   (x + y + z - 1)/z - x/z
> 
>   = [x + (y + z - 1)]/z - x/z
> 
>   = [xz + z(y + z - 1)]/z^2 - x/z
> 
>   = x/z + (y + z - 1)/z - x/z
> 
> And the rest follows from your simplifications.

It doesn't work:

 ((3+4+5-1)/5) - (3/5) = 2
 ((4+5-1)/5) = 1

julia

