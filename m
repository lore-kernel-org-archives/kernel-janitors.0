From: Julia Lawall <julia@diku.dk>
Date: Tue, 10 May 2011 07:57:27 +0000
Subject: Re: [PATCH] drivers/mmc/card/block.c: fix potential null dereference
Message-Id: <Pine.LNX.4.64.1105100955580.4600@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4DC7F4AB.90607@gmail.com> <Pine.LNX.4.64.1105091631400.15483@pc-004.diku.dk>
 <4DC802C0.9040302@gmail.com> <Pine.LNX.4.64.1105091713080.15483@pc-004.diku.dk>
 <4DC8117C.7060200@gmail.com> <Pine.LNX.4.64.1105091811320.15483@pc-004.diku.dk>
 <BANLkTinhy7QwE0a40efJhHazmGSgitKVdw@mail.gmail.com>
In-Reply-To: <BANLkTinhy7QwE0a40efJhHazmGSgitKVdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Vladimir Motyka <vladimir.motyka@gmail.com>, cjb@laptop.org, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 10 May 2011, Andy Shevchenko wrote:

> On Mon, May 9, 2011 at 7:12 PM, Julia Lawall <julia@diku.dk> wrote:
> > I guess there is also a point at which idata has been successfully
> > allocated but idata->buf has not.
> And? kfree() simple ignores NULL pointers.

Unnecessarily calling a function suggests that calling that function is 
necessary when it is not.  But it is probably not a big deal, especially 
for a well known function like kfree.

julia

> I would prefer to see previous version of patch, but let maintainer to choose.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
