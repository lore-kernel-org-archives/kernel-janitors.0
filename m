From: Eric Paris <eparis@parisplace.org>
Date: Tue, 08 Jun 2010 20:19:18 +0000
Subject: Re: [patch 4/7] selinux: fix error codes in cond_read_node()
Message-Id: <AANLkTilH1Lf34f4FgR8jMk0RqcKSkrf_N2iE5K53HQ2q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607210703.GT5483@bicker>
In-Reply-To: <20100607210703.GT5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jun 7, 2010 at 5:07 PM, Dan Carpenter <error27@gmail.com> wrote:
> Originally cond_read_node() returned -1 (-EPERM) on errors which was
> incorrect. =A0Now it either propagates the error codes from lower level
> functions next_entry() or cond_read_av_list() or it returns -ENOMEM or
> -EINVAL.
>
> next_entry() returns -EINVAL.
> cond_read_av_list() returns -EINVAL or -ENOMEM.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/cond=
itional.c
> index 4c39f19..f0de637 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c
> @@ -392,14 +392,14 @@ static int cond_read_node(struct policydb *p, struc=
t cond_node *node, void *fp)
>
> =A0 =A0 =A0 =A0rc =3D next_entry(buf, fp, sizeof(u32));
> =A0 =A0 =A0 =A0if (rc < 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
>
> =A0 =A0 =A0 =A0node->cur_state =3D le32_to_cpu(buf[0]);
>
> =A0 =A0 =A0 =A0len =3D 0;
> =A0 =A0 =A0 =A0rc =3D next_entry(buf, fp, sizeof(u32));
> =A0 =A0 =A0 =A0if (rc < 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
>
> =A0 =A0 =A0 =A0/* expr */
> =A0 =A0 =A0 =A0len =3D le32_to_cpu(buf[0]);
> @@ -409,6 +409,7 @@ static int cond_read_node(struct policydb *p, struct =
cond_node *node, void *fp)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (rc < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D -ENOMEM;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0expr =3D kzalloc(sizeof(struct cond_expr),=
 GFP_KERNEL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!expr)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
> @@ -417,6 +418,7 @@ static int cond_read_node(struct policydb *p, struct =
cond_node *node, void *fp)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0expr->bool =3D le32_to_cpu(buf[1]);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!expr_isvalid(p, expr)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(expr);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> @@ -428,14 +430,16 @@ static int cond_read_node(struct policydb *p, struc=
t cond_node *node, void *fp)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0last =3D expr;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 if (cond_read_av_list(p, fp, &node->true_list, NULL) !=3D 0)
> + =A0 =A0 =A0 rc =3D cond_read_av_list(p, fp, &node->true_list, NULL);
> + =A0 =A0 =A0 if (rc < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
> - =A0 =A0 =A0 if (cond_read_av_list(p, fp, &node->false_list, node->true_=
list) !=3D 0)
> + =A0 =A0 =A0 rc =3D cond_read_av_list(p, fp, &node->false_list, node->tr=
ue_list);
> + =A0 =A0 =A0 if (rc < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;

I know that lots of the next_entry() calls use if (rc < 0) [unrelated
note I think those need to be fixed too] but most of the code uses if
(rc) and I strongly prefer if (rc) as it's cleaner and faster from a
micro architecture point of view.  Would you mind re-spinning this
one?

-Eric
> =A0 =A0 =A0 =A0return 0;
> =A0err:
> =A0 =A0 =A0 =A0cond_node_destroy(node);
> - =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 return rc;
> =A0}
>
> =A0int cond_read_list(struct policydb *p, void *fp)
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
