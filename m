From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 17 Feb 2007 18:48:51 +0000
Subject: Re: [KJ] using "mutexes" in place of semaphores
Message-Id: <200702171948.52018.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702170735460.23474@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702170735460.23474@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Saturday 17 February 2007 17:39, Robert P. J. Day wrote:
> waitaminnit. =A0you're not claiming that a currently-locked semaphore is
> exactly equivalent to a completion, are you?
>=20
> as i read it, calling "complete()" on a completion will wake *all*
> processes waiting for that completion, no? =A0not just one, as a
> semaphore would.
>=20
> so i'm assuming what you're saying is that, in many places where you
> see a "sema_init(sem, 0)", it would be *appropriate* to have used a
> completion instead, is that what you meant? =A0thanks.
>=20
Right, I looked at three instances where sema_init(sem, 0) was used,
and two of them use it only to do what a completion does.

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
