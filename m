From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 30 Jan 2004 11:04:35 +0000
Subject: Re: [Kernel-janitors] [PATCH] Fix warning in drivers/net/pppoe.c
Message-Id: <1075460675.10428.2.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1074874158.5269.3.camel@telecentrolivre>
In-Reply-To: <1074874158.5269.3.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Em Qui, 2004-01-29 =E0s 17:05, Luiz Fernando Capitulino escreveu:

> +
>  	err =3D -ENOMEM;
> -	if (!p)
> +	if (!(err =3D pppoe_proc_init()))
>  		goto out_unregister;

 I did a study thing in the handling of 'err', I will rediff.

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
