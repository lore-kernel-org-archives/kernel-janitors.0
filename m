From: Jaswinder Singh <jaswinder@infradead.org>
Date: Sun, 06 Jul 2008 05:16:25 +0000
Subject: Re: [linux-dvb] [PATCH] Remove fdump tool for av7110 firmware
Message-Id: <1215320665.2768.15.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214139259.2994.8.camel@jaswinder.satnam>
	 <200807060315.51736@orion.escape-edv.de>
In-Reply-To: <200807060315.51736@orion.escape-edv.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Oliver Endriss <o.endriss@gmx.de>
Cc: linux-dvb@linuxtv.org, LKML <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Woodhouse <dwmw2@infradead.org>, Mauro Carvalho Chehab <mchehab@infradead.org>

Hello Oliver,

On Sun, 2008-07-06 at 03:15 +0200, Oliver Endriss wrote:
> Jaswinder Singh wrote:
> > There's no point in this, since the user can use the BUILTIN_FIRMWARE
> > option to include arbitrary firmware files directly in the kernel image.
>=20
> NAK!=20

=EF=BB=BFI think you are watching two weeks old patch.

Please check updated patch from :-

http://git.infradead.org/users/dwmw2/firmware-2.6.git?a=3Dcommitdiff;h=CF85=
2ae7e54eaf8944e1e734321fa6d5285379f1

And give us your valuable comments.

> This option allows to compile the firmware into the _driver_,

We also compile firmware without fdump.

> which is very useful if you want to test various driver/firmware
> combinations. =EF=BB=BFHaving the firmware in the _kernel_ does not help!
>=20

For testing purpose kernel/drivers source tree is not suitable.
Please find some other suitable place.

> Well, I am tired to fight for this option in the kernel every other
> month. :-(
>=20

yeah I understand, fighting with Truth is not easy ;)

Thank you,

Jaswinder Singh.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
