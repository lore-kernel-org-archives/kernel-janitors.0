From: Karsten Keil <isdn@linux-pingi.de>
Date: Fri, 24 Jul 2009 10:55:32 +0000
Subject: Re: [PATCH 3/5] drivers/isdn: Drop unnecessary NULL test
Message-Id: <200907241255.33013.isdn@linux-pingi.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907122204140.22658@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907122204140.22658@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: isdn4linux@listserv.isdn4linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


ACK, thanks for spotting this.

I will include this in my next patchset.

Karsten

On Sonntag, 12. Juli 2009 22:05:03 Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>
> The result of container_of should not be NULL.  In particular, in this case
> the argument to the enclosing function has passed though INIT_WORK, which
> dereferences it, implying that its container cannot be NULL.
>
> A simplified version of the semantic patch that makes this change is as
> follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @@
> identifier fn,work,x,fld;
> type T;
> expression E1,E2;
> statement S;
> @@
>
> static fn(struct work_struct *work) {
>   ... when != work = E1
>   x = container_of(work,T,fld)
>   ... when != x = E2
> - if (x = NULL) S
>   ...
> }
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
>  drivers/isdn/hisax/amd7930_fn.c |    2 --
>  drivers/isdn/hisax/hfc_pci.c    |    2 --
>  drivers/isdn/hisax/hfc_sx.c     |    2 --
>  drivers/isdn/hisax/icc.c        |    2 --
>  drivers/isdn/hisax/isac.c       |    2 --
>  drivers/isdn/hisax/w6692.c      |    2 --
>  6 files changed, 12 deletions(-)
...

