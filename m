From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 04 Mar 2004 15:38:11 +0000
Subject: Re: [Kernel-janitors] [PATCH 2/3] - De-uglification work for dr
Message-Id: <1078414691.24048.31.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078342458.14557.40.camel@telecentrolivre>
In-Reply-To: <1078342458.14557.40.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Walter,

Em Qui, 2004-03-04 =E0s 05:54, WHarms@bfs.de escreveu:

> a little question:
> in interpret_errors() there is a switch()
>=20
> case 0x80 etc its possible to replace th 0x80 with some define
> like ST0_ERROR or so ?

 Yes.

 The floppy driver needs a lot of work like that. I started with
four patches to see if I'm doing the right thing.

> a lot of printk() have no KERN_*

 Other thing to be changed. :-)

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
