From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 08 Jan 2004 07:36:20 +0000
Subject: Re: switch identation was: Re: [Kernel-janitors] [PATCH] Fix
Message-Id: <1073547380.2192.11.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040107164516.50bcd936.rddunlap@osdl.org>
In-Reply-To: <20040107164516.50bcd936.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Randy,

Em Qua, 2004-01-07 =E0s 22:45, Randy.Dunlap escreveu:

> | >>  Should I rediff ?
>=20
> No.  But that
> +	if(! pdev_is_sata(dev)) {
> is really ugly (the spacing in "if(! " part of it).
>=20
> And all this warning needs to fix it is an additional semi-colon, like:
>=20
> -sata_skip:
> +sata_skip:;
>=20
> although I don't disapprove of the intent of your patch.

 So, I will rediff only for the "if(! ". Ok ?


> I prefer to use switch() formatting as acme has suggested, but
> changing it in source files that are currently maintained should go
> thru their maintainer(s) IMO.
>=20
> For source files that are basically unmaintained, I don't mind
> pushing formatting changes.

 Should it go to TODO file ?

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
