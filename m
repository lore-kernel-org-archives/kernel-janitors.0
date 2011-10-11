From: Paul Moore <paul@paul-moore.com>
Date: Tue, 11 Oct 2011 21:20:11 +0000
Subject: Re: [patch] cipso: remove an unneeded NULL check in cipso_v4_doi_add()
Message-Id: <CAHC9VhRMy-DbbkXSSWQPh8QgHAm5xzZ1qWJaYLiOERPagDfrbQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111011132228.GA27127@elgon.mountain>
In-Reply-To: <20111011132228.GA27127@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, kernel-janitors@vger.kernel.org

On Tue, Oct 11, 2011 at 9:22 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> We dereference doi_def on the line before the NULL check. =A0It has
> been this way since 2008. =A0I checked all the callers and doi_def is
> always non-NULL here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/net/ipv4/cipso_ipv4.c b/net/ipv4/cipso_ipv4.c
> index 2c2a98e..86f3b88 100644
> --- a/net/ipv4/cipso_ipv4.c
> +++ b/net/ipv4/cipso_ipv4.c
> @@ -476,7 +476,7 @@ int cipso_v4_doi_add(struct cipso_v4_doi *doi_def,
> =A0 =A0 =A0 =A0doi =3D doi_def->doi;
> =A0 =A0 =A0 =A0doi_type =3D doi_def->type;
>
> - =A0 =A0 =A0 if (doi_def =3D NULL || doi_def->doi =3D CIPSO_V4_DOI_UNKNO=
WN)
> + =A0 =A0 =A0 if (doi_def->doi =3D CIPSO_V4_DOI_UNKNOWN)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto doi_add_return;
> =A0 =A0 =A0 =A0for (iter =3D 0; iter < CIPSO_V4_TAG_MAXCNT; iter++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (doi_def->tags[iter]) {

I'd prefer to keep the NULL check in there as it does afford a little
bit of extra safety and this is management code after all, not
per-packet processing code, so the extra check should have no
observable performance impact.

--=20
paul moore
www.paul-moore.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
