From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Oct 2018 06:41:01 +0000
Subject: Re: [PATCH] net/mlx5: allocate enough space in
Message-Id: <20181022064100.rtqh6z6nmy3bacr6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019200638.dea3r4uocbij6d6j@kili.mountain>
 <CAJ3xEMhwcYYDWWLropG95T6TyE62OfJS+oPAFDZKLOVJSurNRQ@mail.gmail.com>
 <CAJ3xEMjZ8WQu2cj_QgU9RoZvUZu7X2Szh6-Si6KZU-qMBFqwHQ@mail.gmail.com>
 <20181022052336.fr4kvd7idba5d2om@mwanda>
 <CAJ3xEMj5NPo-BJ2t_xno+R5O6R0_i3CU0Dig3_Wakop0xLa8CQ@mail.gmail.com>
In-Reply-To: <CAJ3xEMj5NPo-BJ2t_xno+R5O6R0_i3CU0Dig3_Wakop0xLa8CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Or Gerlitz <gerlitz.or@gmail.com>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Paul Blakey <paulb@mellanox.com>, kernel-janitors@vger.kernel.org, Linux Netdev List <netdev@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>

On Mon, Oct 22, 2018 at 09:18:43AM +0300, Or Gerlitz wrote:
> On Mon, Oct 22, 2018 at 8:23 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Sun, Oct 21, 2018 at 01:56:26PM +0300, Or Gerlitz wrote:
> > > I will re-post your patch, this time to netdev since the original
> > > commit is there
> > > and so should be the fix, thanks for reporting/fixing!
> >
> > I didn't realize it had been posted to netdev already so I deliberately
> > left that off the CC.  If Dave hasn't applied the original (he probably
> 
> you didn't post it to netdev, I don't see how he could have got it
> 

I meant commit 328edb499f99 ("net/mlx5: Split FDB fast path prio to
multiple namespaces").  It turns out that Dave has applied that, but I
was expecting to see his S-o-B on it.

It's hard for me to know which tree patches are applied to.

Also I see that I screwed up the subject.  Thanks for fixing that.

regards,
dan carpenter
