From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 19 Mar 2004 16:02:19 +0000
Subject: Re: [Kernel-janitors] [PATCH] 81 patches for strings
Message-Id: <1079712138.10822.8.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040319150659.GA20615@localhost>
In-Reply-To: <20040319150659.GA20615@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Carlo,

Em Sex, 2004-03-19 =E0s 12:06, Carlo Perassi escreveu:
> Hi.
> With some scripting and manual check, I patched 81 files
> from
> [const] char *foo =3D "blah";
> to
> [const] char foo[] =3D "blah";

 what about check the result with the size program ?

 a script can do that...

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
