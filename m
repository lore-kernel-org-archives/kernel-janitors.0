From: Stefan Sperling <stefan@binarchy.net>
Date: Mon, 08 Nov 2004 19:50:37 +0000
Subject: Re: [KJ] how can I declare a char[][] module parameter?
Message-Id: <20041108195037.GB7576@dice.seeling33.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041107212209.GA11291@dice.seeling33.de>
In-Reply-To: <20041107212209.GA11291@dice.seeling33.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Nov 08, 2004 at 06:35:40PM +0100, Arnd Bergmann wrote:
> On S=FCnndag 07 November 2004 22:22, Stefan Sperling wrote:
> > This is the best conversion I came up with, but it discards information:
> >=20
> > =A0 =A0 module_param_array(name, charp, WAVELAN_P_NAME_LEN, 0444);
> >=20
> > How can I declare an array of char*, without loosing the
> > information that each char* points to a buffer of IFNAMESIZ bytes?
>=20
> You don't need that information. The parameter is used in only one
> place, and there, you can use strncpy instead of memcpy to access
> it.

I'll use strlcpy.

While this is not a very generic solution (i.e. does not apply to
all possible cases where a module parameter is a char[][]), it is
adequate enough in my case :-)

Thanks a lot for your help!
stefan
--=20
Give me a fish and I will eat today.
Teach me to fish and I will eat forever.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
