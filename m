From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 22 Mar 2004 19:34:55 +0000
Subject: Re: [Kernel-janitors] [TRIVIAL] - section drivers/acpi/asus_acpi.c.
Message-Id: <1079984094.28702.8.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079724660.14846.38.camel@telecentrolivre>
In-Reply-To: <1079724660.14846.38.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Randy,

Em Sex, 2004-03-19 =E0s 21:11, Randy.Dunlap escreveu:

> |  asus_hotk_remove() is only called when drivers is being
> | removed.
>=20
> Hm, how did you come to this conclusion?  I don't see that
> as I look at drivers/acpi/scan.c, around line # 262,
> in function acpi_bus_driver_init():   <<< note the "init" >>>
>=20
> 	if (driver->ops.start) {
> 		result =3D driver->ops.start(device);
> 		if (result && driver->ops.remove)
> 			driver->ops.remove(device, ACPI_BUS_REMOVAL_NORMAL);
> 		return_VALUE(result);
> 	}

 yes... I did not saw this, drop it please.

 I need to be more careful doing this little patches. :-|

 thanks,

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
