From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 19 Dec 2006 09:50:37 +0000
Subject: Re: [KJ] Any comments to this patch?
Message-Id: <Pine.LNX.4.64.0612190446090.19141@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1020532404-1166521837=:19141"
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612190135o3b94b1a0rec261c908711423@mail.gmail.com>
In-Reply-To: <80ec54e90612190135o3b94b1a0rec261c908711423@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1020532404-1166521837=:19141
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Dec 2006, Daniel Marjam=E4ki wrote:

> --- linux-2.6.19.1/kernel/auditfilter.c	2006-12-11 20:32:53.000000000 +01=
00
> +++ newlinux/kernel/auditfilter.c	2006-12-15 15:52:30.000000000 +0100
> @@ -636,10 +636,9 @@ static struct audit_rule *audit_krule_to
>  	struct audit_rule *rule;
>  	int i;
>
> -	rule =3D kmalloc(sizeof(*rule), GFP_KERNEL);
> +	rule =3D kzalloc(sizeof(*rule), GFP_KERNEL);
>  	if (unlikely(!rule))
>  		return NULL;
> -	memset(rule, 0, sizeof(*rule));
>
>  	rule->flags =3D krule->flags | krule->listnr;
>  	rule->action =3D krule->action;

already in the tree.

> @@ -667,10 +666,9 @@ static struct audit_rule_data *audit_kru
>  	void *bufp;
>  	int i;
>
> -	data =3D kmalloc(sizeof(*data) + krule->buflen, GFP_KERNEL);
> +	data =3D kzalloc(sizeof(*data) + krule->buflen, GFP_KERNEL);
>  	if (unlikely(!data))
>  		return NULL;
> -	memset(data, 0, sizeof(*data));
>
>  	data->flags =3D krule->flags | krule->listnr;
>  	data->action =3D krule->action;

NAK.  note that, for whatever reason, the space allocated by kmalloc()
is larger than that which is being zeroed by the memset() call.  if
there's no good reason for that and it could all be zeroed, then it
would be fine.

rday
--8323328-1020532404-1166521837=:19141
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--8323328-1020532404-1166521837=:19141--
