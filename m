From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 08 Jan 2004 19:40:04 +0000
Subject: Re: switch identation was: Re: [Kernel-janitors] [PATCH] Fix
Message-Id: <20040108114004.7181555c.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040107164516.50bcd936.rddunlap@osdl.org>
In-Reply-To: <20040107164516.50bcd936.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, 08 Jan 2004 05:36:20 -0200 Luiz Fernando Capitulino <lcapitulino@pr=
efeitura.sp.gov.br> wrote:

|=20
| Hi Randy,
|=20
| Em Qua, 2004-01-07 =E0s 22:45, Randy.Dunlap escreveu:
|=20
| > | >>  Should I rediff ?
| >=20
| > No.  But that
| > +	if(! pdev_is_sata(dev)) {
| > is really ugly (the spacing in "if(! " part of it).
| >=20
| > And all this warning needs to fix it is an additional semi-colon, like:
| >=20
| > -sata_skip:
| > +sata_skip:;
| >=20
| > although I don't disapprove of the intent of your patch.
|=20
|  So, I will rediff only for the "if(! ". Ok ?

OK, I'll merge that, except that if and switch are not functions,
so we usually put a space after them and before the opening '('
[yes, I'm slightly disagreeing with acme's proposed switch formatting].

|=20
| > I prefer to use switch() formatting as acme has suggested, but
| > changing it in source files that are currently maintained should go
| > thru their maintainer(s) IMO.
| >=20
| > For source files that are basically unmaintained, I don't mind
| > pushing formatting changes.
|=20
|  Should it go to TODO file ?

Sure, I'll add that.

--
~Randy

--
~Randy
MOTD:  Always include version info.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
