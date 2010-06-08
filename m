From: Eric Paris <eparis@parisplace.org>
Date: Tue, 08 Jun 2010 20:12:18 +0000
Subject: Re: [patch 3/7] selinux: fix error codes in cond_read_av_list()
Message-Id: <AANLkTiklqMcfpYDI-ZS5ePzV7AL4s-V2GTQQ_NzV2g6v@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607210554.GS5483@bicker>
In-Reply-To: <20100607210554.GS5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jun 7, 2010 at 5:05 PM, Dan Carpenter <error27@gmail.com> wrote:
> After this patch cond_read_av_list() no longer returns -1 for any
> errors. =A0It just propagates error code back from lower levels. =A0Those=
 can
> either be -EINVAL or -ENOMEM.
>
> I also modified cond_insertf() since cond_read_av_list() passes that as a
> function pointer to avtab_read_item(). =A0It isn't used anywhere else.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

I'm not in love with this one.  The change in cond_read_av_list() is
fine, but the style and completeness in cond_insertf I think is even
worse.  My biggest problem is the fact that you sent an error code at
the top and just sorta leave it.  There are still lots of

if (function())
        goto err;

which really should be

rc =3D function()
if (rc)
        goto err;

I'd rather keep the crap we have today than introduce a new style of
error code handling....

-Eric
>
> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/cond=
itional.c
> index acaa6cd..4c39f19 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c
> @@ -263,7 +263,7 @@ static int cond_insertf(struct avtab *a, struct avtab=
_key *k, struct avtab_datum
> =A0 =A0 =A0 =A0struct cond_av_list *other =3D data->other, *list, *cur;
> =A0 =A0 =A0 =A0struct avtab_node *node_ptr;
> =A0 =A0 =A0 =A0u8 found;
> -
> + =A0 =A0 =A0 int ret =3D -EINVAL;
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * For type rules we have to make certain there aren't any
> @@ -317,8 +317,10 @@ static int cond_insertf(struct avtab *a, struct avta=
b_key *k, struct avtab_datum
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0list =3D kzalloc(sizeof(struct cond_av_list), GFP_KERNEL);
> - =A0 =A0 =A0 if (!list)
> + =A0 =A0 =A0 if (!list) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0list->node =3D node_ptr;
> =A0 =A0 =A0 =A0if (!data->head)
> @@ -331,7 +333,7 @@ static int cond_insertf(struct avtab *a, struct avtab=
_key *k, struct avtab_datum
> =A0err:
> =A0 =A0 =A0 =A0cond_av_list_destroy(data->head);
> =A0 =A0 =A0 =A0data->head =3D NULL;
> - =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 return ret;
> =A0}
>
> =A0static int cond_read_av_list(struct policydb *p, void *fp, struct cond=
_av_list **ret_list, struct cond_av_list *other)
> @@ -346,7 +348,7 @@ static int cond_read_av_list(struct policydb *p, void=
 *fp, struct cond_av_list *
> =A0 =A0 =A0 =A0len =3D 0;
> =A0 =A0 =A0 =A0rc =3D next_entry(buf, fp, sizeof(u32));
> =A0 =A0 =A0 =A0if (rc < 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
>
> =A0 =A0 =A0 =A0len =3D le32_to_cpu(buf[0]);
> =A0 =A0 =A0 =A0if (len =3D 0)
> @@ -361,7 +363,6 @@ static int cond_read_av_list(struct policydb *p, void=
 *fp, struct cond_av_list *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &=
data);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (rc)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return rc;
> -
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0*ret_list =3D data.head;
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
