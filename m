From: Stephen Frost <sfrost@snowman.net>
Date: Tue, 25 Apr 2006 00:31:49 +0000
Subject: Re: [KJ] [PATCH] net/ipv4/netfilter/ipt_recent.c 2.6.17-rc2-git5
Message-Id: <20060425003149.GB4474@ns.snowman.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8535585435787586=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <444C4F8E.4050001@gmail.com>
In-Reply-To: <444C4F8E.4050001@gmail.com>
To: kernel-janitors@vger.kernel.org


--===============8535585435787586==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lnVMkuWesP54AAVe"
Content-Disposition: inline


--lnVMkuWesP54AAVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Matthew Wilcox (matthew@wil.cx) wrote:
> I don't know; you may be right.  Let's see if the author can explain why
> he's kmallocing instead of skb_allocing

Honestly, and I know this is terrible, but, this was my first real
kernel module and I don't think I knew about alloc_skb().  I don't
recall seeing alloc_skb() in the module I was baseing mine off of but
it's possible that module didn't have any reason to use it.  No, I don't
remember which module I was copying (might have been psd?).

Thanks for looking into this.  I don't see any particular reason not to
use alloc_skb(), especially if it's in general the appropriate thing to
do in netfilter modules.

	Thanks again,

		Stephen

> > --- /usr/src/linux-2.6.17-rc2-git5-orig/net/ipv4/netfilter/ipt_recent.c=
=20
> > 2006-04-23 16:47:53.000000000 -0500
> > +++ /usr/src/linux-2.6.17-rc2-git5/net/ipv4/netfilter/ipt_recent.c=20
> > 2006-04-23 23:50:50.000000000 -0500
> > @@ -304,7 +304,7 @@
> >        strncpy(info->name,curr_table->name,IPT_RECENT_NAME_LEN);
> >        info->name[IPT_RECENT_NAME_LEN-1] =3D '\0';
> >=20
> > -       skb =3D kmalloc(sizeof(struct sk_buff),GFP_KERNEL);
> > +       skb =3D alloc_skb(sizeof(struct sk_buff),GFP_KERNEL);
> >        if (!skb) {
> >                used =3D -ENOMEM;
> >                goto out_free_info;
> > @@ -323,7 +323,7 @@
> >=20
> >        kfree(skb->nh.iph);
> > out_free_skb:
> > -       kfree(skb);
> > +       kfree_skb(skb);
> > out_free_info:
> >        kfree(info);
> >=20
> >=20
> > While reading the function alloc_skb(), you can request it to be
> > a certain size. But why would anyone want to allocate a different
> > size than sizeof(sk_buff)? Unless there is something I'm missing
> > here, why don't we just remove the size parameter altogether?
> > _______________________________________________
> > Kernel-janitors mailing list
> > Kernel-janitors@lists.osdl.org
> > https://lists.osdl.org/mailman/listinfo/kernel-janitors

--lnVMkuWesP54AAVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFETW31rzgMPqB3kigRAv9lAJ9aS07KHPSNd/5R7NE8IpDG65gjQgCfV0ua
YVwY5JU0pOp31Hf+5vwBVPA=
=5IpR
-----END PGP SIGNATURE-----

--lnVMkuWesP54AAVe--

--===============8535585435787586==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8535585435787586==--
