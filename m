From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 18 Sep 2005 02:43:26 +0000
Subject: Re: [KJ] Holding off patches 6 - 20 for a bit
Message-Id: <200509180443.27040.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E80C9DA8-1015-42E3-8B4F-7A9D140B36D2@gmail.com>
In-Reply-To: <E80C9DA8-1015-42E3-8B4F-7A9D140B36D2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On S=FCnndag 18 September 2005 04:27, Jesse Millan wrote:
>=20
> I'll wait to see if there is any feedback before sending the rest.

Could you explain why you think your patches are a good idea? Defining
an extra macro that is only used in a single well-known place appears
a bit pointless to me. Also, looking through the existing drivers,
less than one out of ten is currently doing it this way.

IMHO, we should rather convert those to use the MODULE_*() macros
directly.

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
