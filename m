From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 05 Oct 2017 19:13:22 +0000
Subject: Re: [PATCH] coccinelle: api: detect duplicate chip data arrays
Message-Id: <alpine.DEB.2.20.1710052113090.2626@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1506861768-5734-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAK7LNAQK7w3FBxJUhX3Vn48XsUT7jQzGDC7kzCx2r-yWm0CdEw@mail.gmail.com>
In-Reply-To: <CAK7LNAQK7w3FBxJUhX3Vn48XsUT7jQzGDC7kzCx2r-yWm0CdEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr



On Fri, 6 Oct 2017, Masahiro Yamada wrote:

> 2017-10-01 21:42 GMT+09:00 Julia Lawall <Julia.Lawall@lip6.fr>:
> > This semantic patch detects duplicate arrays declared using BQ27XXX_DATA
> > within a single structure.  It is currently specific to the file
> > drivers/power/supply/bq27xxx_battery.c.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
>
> Applied to linux-kbuild/misc.

Thanks for picking it up.

julia

> Thanks.
>
>
> --
> Best Regards
> Masahiro Yamada
>
