From: Eric Paris <eparis@parisplace.org>
Date: Tue, 08 Jun 2010 20:22:22 +0000
Subject: Re: [patch 7/7] selinux: fix error codes in symtab_init()
Message-Id: <AANLkTikr7ijGrtZ6_Fk9yCcg5KPE2rs1loyQmk_Rcggr@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607211103.GW5483@bicker>
In-Reply-To: <20100607211103.GW5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jun 7, 2010 at 5:11 PM, Dan Carpenter <error27@gmail.com> wrote:
> hashtab_create() only returns NULL on allocation failures to -ENOMEM is
> appropriate here.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Eric Paris <eparis@redhat.com>

>
> diff --git a/security/selinux/ss/symtab.c b/security/selinux/ss/symtab.c
> index bcf9f62..160326e 100644
> --- a/security/selinux/ss/symtab.c
> +++ b/security/selinux/ss/symtab.c
> @@ -36,7 +36,7 @@ int symtab_init(struct symtab *s, unsigned int size)
> =A0{
> =A0 =A0 =A0 =A0s->table =3D hashtab_create(symhash, symcmp, size);
> =A0 =A0 =A0 =A0if (!s->table)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> =A0 =A0 =A0 =A0s->nprim =3D 0;
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
