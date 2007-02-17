From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 17 Feb 2007 13:58:39 +0000
Subject: Re: [KJ] why so many more "down()" than "down_interruptible()"
Message-Id: <200702171458.40276.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702170754290.23563@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702170754290.23563@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Saturday 17 February 2007 14:00, Robert P. J. Day wrote:
> =A0 that's not what i see. =A0just counting the calls under drivers/, it
> looks like there's about four times as many calls of down() as
> down_interruptible(). =A0is there some reason that the actual stats
> differ so markedly from the claim in love's book? =A0just curious.

Using down_interruptible is hard: You need to be in a place where
you can return -EINTR (or -ERESTART*) to user space, and you need
to undo everything that your function did before the down_interruptible
failed.

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
