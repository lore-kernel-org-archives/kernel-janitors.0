From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Thu, 08 Jan 2004 20:13:45 +0000
Subject: Re: switch identation was: Re: [Kernel-janitors] [PATCH] Fix warning
Message-Id: <20040108201345.GX3062@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040107164516.50bcd936.rddunlap@osdl.org>
In-Reply-To: <20040107164516.50bcd936.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Em Thu, Jan 08, 2004 at 11:40:04AM -0800, Randy.Dunlap escreveu:
> On Thu, 08 Jan 2004 05:36:20 -0200 Luiz Fernando Capitulino <lcapitulino@=
prefeitura.sp.gov.br> wrote:
>=20
> |=20
> | Hi Randy,
> |=20
> | Em Qua, 2004-01-07 =E0s 22:45, Randy.Dunlap escreveu:
> |=20
> | > | >>  Should I rediff ?
> | >=20
> | > No.  But that
> | > +	if(! pdev_is_sata(dev)) {
> | > is really ugly (the spacing in "if(! " part of it).
> | >=20
> | > And all this warning needs to fix it is an additional semi-colon, lik=
e:
> | >=20
> | > -sata_skip:
> | > +sata_skip:;
> | >=20
> | > although I don't disapprove of the intent of your patch.
> |=20
> |  So, I will rediff only for the "if(! ". Ok ?
>=20
> OK, I'll merge that, except that if and switch are not functions,
> so we usually put a space after them and before the opening '('
> [yes, I'm slightly disagreeing with acme's proposed switch formatting].

not at all, if I proposed something like:

	switch(foo) {
.
.
.

I'd be nuts 8)


	switch (foo) {
	case bar:
		__bar();
		break;
	case baz:
		__baz();
		break;
	default:
		printk(KERN_ERR "whatever\n");
		break;
	}

Is how I write my code and fix other's :)

- Arnaldo

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
