From: walter harms <wharms@bfs.de>
Date: Wed, 24 Jan 2007 18:10:20 +0000
Subject: Re: [KJ] script to flag "dead" CONFIG variables
Message-Id: <45B7A10C.5010500@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

hi robert,
are you aware of ifnames ? it is part auf the autoconf tools
and lists all the #if #elif etc.

that should surface all important vars and a compare with kconfig should sh=
ow up
any dead variables.
bonus points for collecting all #defines also.

re,
 wh



Robert P. J. Day wrote:
>   it's all written up here:
>=20
> http://www.fsdev.dreamhosters.com/wiki/index.php?title=DEad_CONFIG_variab=
les
>=20
> rday
>=20
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
