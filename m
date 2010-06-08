From: Eric Paris <eparis@parisplace.org>
Date: Tue, 08 Jun 2010 20:20:31 +0000
Subject: Re: [patch 5/7] selinux: fix error codes in cond_policydb_init()
Message-Id: <AANLkTikdWwqR-Q4EjO-kziUr1W1OoKGxzmCyiAaEFJaI@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607210816.GU5483@bicker>
In-Reply-To: <20100607210816.GU5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jun 7, 2010 at 5:08 PM, Dan Carpenter <error27@gmail.com> wrote:
> It's better to propagate the error code from avtab_init() instead of
> returning -1 (-EPERM). =A0It turns out that avtab_init() never fails so
> this patch doesn't change how the code runs but it's still a clean up.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/cond=
itional.c
> index f0de637..7447be0 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c
> @@ -117,10 +117,14 @@ int evaluate_cond_node(struct policydb *p, struct c=
ond_node *node)
>
> =A0int cond_policydb_init(struct policydb *p)
> =A0{
> + =A0 =A0 =A0 int ret;

I know, I'm being pedantic, but int rc, not int ret;  All of the rest
of the code uses rc.

> +
> =A0 =A0 =A0 =A0p->bool_val_to_struct =3D NULL;
> =A0 =A0 =A0 =A0p->cond_list =3D NULL;
> - =A0 =A0 =A0 if (avtab_init(&p->te_cond_avtab))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> +
> + =A0 =A0 =A0 ret =3D avtab_init(&p->te_cond_avtab);
> + =A0 =A0 =A0 if (ret < 0)

if (rc)   not if (rc < 0)


> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>
> =A0 =A0 =A0 =A0return 0;
> =A0}

-Eric
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
