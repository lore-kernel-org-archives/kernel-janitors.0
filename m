From: Marek Vasut <marek.vasut@gmail.com>
Date: Wed, 26 May 2010 19:13:37 +0000
Subject: Re: [PATCH 7/17] arch/arm/common: Add missing spin_unlock_irqrestore
Message-Id: <201005262113.38450.marek.vasut@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261756000.23743@ask.diku.dk>
	<201005261907.06198.marek.vasut@gmail.com>
	<20100526184358.GC6232@n2100.arm.linux.org.uk>
In-Reply-To: <20100526184358.GC6232@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Dne St 26. kv=C4=9Btna 2010 20:43:58 Russell King - ARM Linux napsal(a):
> On Wed, May 26, 2010 at 07:07:06PM +0200, Marek Vasut wrote:
> > Why are "readl"s protected by spinlock anyway ? Can't we just move the
> > locking past the code above ?
>=20
> Good question - and there seems to be a deadlock waiting to happen -
> sa1111_wake() re-takes the same lock.
>=20
> I think we should kill all the spinlock in sa1111_resume().

Russell, Julia, check the patch I posted. Comments are welcome.

btw. Russell, killing the spinlock in resume might be overkill. If there wa=
s any=20
reason for that being there, it was for the write ops so I'd rather keep th=
ose=20
locked. Anyone with actual hardware available should look into that though.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
