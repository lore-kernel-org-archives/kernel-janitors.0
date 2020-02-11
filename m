From: Saeed Mahameed <saeedm@dev.mellanox.co.il>
Date: Tue, 11 Feb 2020 21:44:21 +0000
Subject: Re: [PATCH] net/mlx5: Remove a useless 'drain_workqueue()' call in 'mlx5e_ipsec_cleanup()'
Message-Id: <CALzJLG_Nyub5YJpP+b=7B128QHOir-vyDs_yrsSoHEPHTfP1bw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126175104.17948-1-christophe.jaillet@wanadoo.fr> <f9b066c7-e59a-9106-da57-a7c0ffc36d9b@mellanox.com>
In-Reply-To: <f9b066c7-e59a-9106-da57-a7c0ffc36d9b@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Pismenny <borisp@mellanox.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Saeed Mahameed <saeedm@mellanox.com>, "leon@kernel.org" <leon@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Jan 27, 2020 at 12:08 AM Boris Pismenny <borisp@mellanox.com> wrote:
>
>
> On 1/26/2020 7:51 PM, Christophe JAILLET wrote:
> > 'destroy_workqueue()' already calls 'drain_workqueue()', there is no need
> > to call it explicitly.
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c
> > index cf58c9637904..29626c6c9c25 100644
> > --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c
> > +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c
> > @@ -433,7 +433,6 @@ void mlx5e_ipsec_cleanup(struct mlx5e_priv *priv)
> >       if (!ipsec)
> >               return;
> >
> > -     drain_workqueue(ipsec->wq);
> >       destroy_workqueue(ipsec->wq);
> >
> >       ida_destroy(&ipsec->halloc);
> LGTM

applied to net-next-mlx5
Thanks!
