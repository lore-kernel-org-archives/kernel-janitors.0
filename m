From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 08 Nov 2017 13:04:17 +0000
Subject: Re: [PATCH 2/2] scripts: coccinelle: api: detect identical chip data arrays
Message-Id: <alpine.DEB.2.20.1711082104070.2708@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1507490321-24900-1-git-send-email-Julia.Lawall@lip6.fr>
 <1507490321-24900-3-git-send-email-Julia.Lawall@lip6.fr>
 <CAK7LNAQKOK5fbkq9AcSzmHc+qJLxAwB0Hy5eYy389uMnvah7uA@mail.gmail.com>
In-Reply-To: <CAK7LNAQKOK5fbkq9AcSzmHc+qJLxAwB0Hy5eYy389uMnvah7uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr



On Tue, 7 Nov 2017, Masahiro Yamada wrote:

> 2017-10-09 4:18 GMT+09:00 Julia Lawall <Julia.Lawall@lip6.fr>:
> > This semantic patch detects duplicate arrays declared using BQ27XXX_DATA
> > within a single structure.  It is currently specific to the file
> > drivers/power/supply/bq27xxx_battery.c.  Nevertheless, having the script in
> > the kernel will allow others to check their code if the data structures
> > change in the future.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
>
> Applied to linux-kbuild/misc.

Thanks!

julia
