From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 10:54:46 +0000
Subject: Re: [KJ] [PATCH 7/21] polling loops: change exit condition to
Message-Id: <4392CAF6.1000807@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4392357F.30209@gmail.com>
In-Reply-To: <4392357F.30209@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Daniel Marjam=E4ki wrote:
> Patch for: drivers/ieee1394/sbp2.c
>=20
> Are you sure about this line
> +	end_time =3D jiffies + msecs_to_jiffies(timeout);
>=20
> To me it seems timeout means nr of jiffies, not milliseconds.
>=20
> Look at line 1286 in the file for example..
> 	/* Wait up to 20 seconds */
> 	if (sbp2util_down_timeout(blabla, 20*HZ)) {

you are right, this line should look like this:
end_time =3D jiffies + timeout;

regards,
Marcin Slusarz
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
