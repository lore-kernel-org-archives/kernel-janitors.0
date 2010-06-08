From: Eric Paris <eparis@parisplace.org>
Date: Tue, 08 Jun 2010 20:22:01 +0000
Subject: Re: [patch 6/7] selinux: fix error codes in cond_read_bool()
Message-Id: <AANLkTiksJUjQj46ivUrLhnDhScHzhB1C77JmAkI1nrsN@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607211013.GV5483@bicker>
In-Reply-To: <20100607211013.GV5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jun 7, 2010 at 5:10 PM, Dan Carpenter <error27@gmail.com> wrote:
> The original code always returned -1 (-EPERM) on error. =A0The new code
> returns either -ENOMEM, or -EINVAL or it propagates the error codes from
> lower level functions next_entry() or hashtab_insert().
>
> next_entry() returns -EINVAL.
> hashtab_insert() returns -EINVAL, -EEXIST, or -ENOMEM.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/cond=
itional.c
> index 7447be0..dc5db55 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c

> @@ -244,13 +246,14 @@ int cond_read_bool(struct policydb *p, struct hasht=
ab *h, void *fp)
> =A0 =A0 =A0 =A0if (rc < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
> =A0 =A0 =A0 =A0key[len] =3D '\0';
> - =A0 =A0 =A0 if (hashtab_insert(h, key, booldatum))
> + =A0 =A0 =A0 rc =3D hashtab_insert(h, key, booldatum);
> + =A0 =A0 =A0 if (rc < 0)

If James wants to pull this one I'm ok with it, but I much prefer if (rc)

-Eric
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
