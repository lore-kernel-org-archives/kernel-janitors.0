From: Julia Lawall <julia@diku.dk>
Date: Sun, 30 May 2010 20:50:16 +0000
Subject: Re: Subject: [PATCH] net/ipv6: Use GFP_ATOMIC when a lock is held
Message-Id: <Pine.LNX.4.64.1005302248500.19253@ask.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511516320-1925940719-1275252616=:19253"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005302147310.19253@ask.diku.dk>
 <1275250288.2472.21.camel@edumazet-laptop>
In-Reply-To: <1275250288.2472.21.camel@edumazet-laptop>
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-1925940719-1275252616=:19253
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, 30 May 2010, Eric Dumazet wrote:

> Le dimanche 30 mai 2010 =E0 21:48 +0200, Julia Lawall a =E9crit :
> > From: Julia Lawall <julia@diku.dk>
> >=20
> > A spin lock is taken near the beginning of the enclosing function.
> >=20
> > The semantic patch that makes this change is as follows:
> > (http://coccinelle.lip6.fr/)
> >=20
> > // <smpl>
> > @@
> > @@
> >=20
> > spin_lock(...)
> > ... when !=3D spin_unlock(...)
> > -GFP_KERNEL
> > +GFP_ATOMIC
> > // </smpl>
> >=20
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> >=20
> > ---
> >  net/ipv6/sit.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff -u -p a/net/ipv6/sit.c b/net/ipv6/sit.c
> > --- a/net/ipv6/sit.c
> > +++ b/net/ipv6/sit.c
> > @@ -358,7 +358,7 @@ ipip6_tunnel_add_prl(struct ip_tunnel *t
> >  		goto out;
> >  	}
> > =20
> > -	p =3D kzalloc(sizeof(struct ip_tunnel_prl_entry), GFP_KERNEL);
> > +	p =3D kzalloc(sizeof(struct ip_tunnel_prl_entry), GFP_ATOMIC);
> >  	if (!p) {
> >  		err =3D -ENOBUFS;
> >  		goto out;
>=20
> Nice catch, but what about allocating this outside of the locked
> section ?

I think the proposed patch does not work, because the for loop overwrites=20
p.  That use of p looks like it is completely local to the for loop, so=20
perhaps a new variable p1 could be added to be used there?

julia

> diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
> index e51e650..ff3dd84 100644
> --- a/net/ipv6/sit.c
> +++ b/net/ipv6/sit.c
> @@ -340,6 +340,10 @@ ipip6_tunnel_add_prl(struct ip_tunnel *t, struct ip_=
tunnel_prl *a, int chg)
>  	if (a->addr =3D=3D htonl(INADDR_ANY))
>  		return -EINVAL;
> =20
> +	p =3D kzalloc(sizeof(struct ip_tunnel_prl_entry), GFP_KERNEL);
> +	if (!p)
> +		return -ENOBUFS;
> +
>  	spin_lock(&ipip6_prl_lock);
> =20
>  	for (p =3D t->prl; p; p =3D p->next) {
> @@ -358,19 +362,16 @@ ipip6_tunnel_add_prl(struct ip_tunnel *t, struct ip=
_tunnel_prl *a, int chg)
>  		goto out;
>  	}
> =20
> -	p =3D kzalloc(sizeof(struct ip_tunnel_prl_entry), GFP_KERNEL);
> -	if (!p) {
> -		err =3D -ENOBUFS;
> -		goto out;
> -	}
> =20
>  	p->next =3D t->prl;
>  	p->addr =3D a->addr;
>  	p->flags =3D a->flags;
>  	t->prl_count++;
>  	rcu_assign_pointer(t->prl, p);
> +	p =3D NULL;
>  out:
>  	spin_unlock(&ipip6_prl_lock);
> +	kfree(p);
>  	return err;
>  }
> =20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
---511516320-1925940719-1275252616=:19253--
