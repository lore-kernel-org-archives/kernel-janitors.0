From: David Fries <david@fries.net>
Date: Thu, 11 Jun 2015 23:41:33 +0000
Subject: Re: [patch] [patch 2/2 v2] w1: use correct lock on error in w1_seq_show()
Message-Id: <20150611234133.GM27260@spacedout.fries.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150602121255.GA20149@spacedout.fries.net>
 <20150604090412.GE22838@mwanda>
 <1064021434036660@web13o.yandex.ru>
In-Reply-To: <1064021434036660@web13o.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Campbell <mattrcampbell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Jun 11, 2015 at 06:31:00PM +0300, Evgeniy Polyakov wrote:
> Hi
>=20
> 04.06.2015, 12:04, "Dan Carpenter" <dan.carpenter@oracle.com>:
> > I noticed there was a problem here because Smatch complained:
> >
> > =A0=A0=A0=A0=A0=A0=A0=A0drivers/w1/slaves/w1_therm.c:416 w1_seq_show() =
warn:
> > =A0=A0=A0=A0=A0=A0=A0=A0inconsistent returns 'mutex:&sl->master->mutex'.
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Locked on: line 416
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Unlocked on: line 413
> >
> > The problem is that we lock ->mutex but we unlock ->bus_mutex on error.
> > David Fries says that ->bus_mutex is correct and ->mutex is incorrect.
> >
> > Fixes: d9411e57dc7f ('w1: Add support for DS28EA00 sequence to w1-therm=
')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Looks good to me, Greg please pull this serie into your tree, if you hadn=
't yet.
> Am I right that this is a stable tree material too?

I would expect the answer to be no.  This is a fix to a new feature
that is in gregkh/char-misc but not yet in Linus's tree.

--=20
David Fries <david@fries.net>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
