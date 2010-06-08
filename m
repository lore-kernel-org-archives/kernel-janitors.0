From: Eric Paris <eparis@parisplace.org>
Date: Tue, 08 Jun 2010 20:01:37 +0000
Subject: Re: [patch 2/7] selinux: propagate error codes in cond_read_list()
Message-Id: <AANLkTim8f4CMkM-gbIzeRfPc8CHMId3QvOcoNBZ-GsLq@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607210319.GR5483@bicker>
In-Reply-To: <20100607210319.GR5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jun 7, 2010 at 5:03 PM, Dan Carpenter <error27@gmail.com> wrote:
> These are passed back when the security module gets loaded.
>
> The original code always returned -1 (-EPERM) on error but after this
> patch it can return -EINVAL, or -ENOMEM or propagate the error code from
> cond_read_node(). =A0cond_read_node() still returns -1 all the time, but I
> fix that in a later patch.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Eric Paris <eparis@redhat.com>

>
> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/cond=
itional.c
> index 4a4e35c..acaa6cd 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c
> @@ -446,7 +446,7 @@ int cond_read_list(struct policydb *p, void *fp)
>
> =A0 =A0 =A0 =A0rc =3D next_entry(buf, fp, sizeof buf);
> =A0 =A0 =A0 =A0if (rc < 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
>
> =A0 =A0 =A0 =A0len =3D le32_to_cpu(buf[0]);
>
> @@ -455,11 +455,13 @@ int cond_read_list(struct policydb *p, void *fp)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
>
> =A0 =A0 =A0 =A0for (i =3D 0; i < len; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D -ENOMEM;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0node =3D kzalloc(sizeof(struct cond_node),=
 GFP_KERNEL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!node)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (cond_read_node(p, node, fp) !=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D cond_read_node(p, node, fp);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rc < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (i =3D 0)
> @@ -472,7 +474,7 @@ int cond_read_list(struct policydb *p, void *fp)
> =A0err:
> =A0 =A0 =A0 =A0cond_list_destroy(p->cond_list);
> =A0 =A0 =A0 =A0p->cond_list =3D NULL;
> - =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 return rc;
> =A0}
>
> =A0/* Determine whether additional permissions are granted by the conditi=
onal
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
