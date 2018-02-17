From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Date: Sat, 17 Feb 2018 10:50:16 +0000
Subject: Re: [PATCH 0/4] usb: gadget: fotg210-udc: Fixes and cleanup
Message-Id: <alpine.LNX.2.00.1802171142240.10047@T420s>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1598662189-1518864616=:10047"
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1515791144.git.christophe.jaillet@wanadoo.fr> <871shqbnln.fsf@linux.intel.com> <p5sksu$4pc$1@blaine.gmane.org>
In-Reply-To: <p5sksu$4pc$1@blaine.gmane.org>
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1598662189-1518864616=:10047
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Christophe

On Mon, 12 Feb 2018, Christophe Jaillet wrote:

> Le 12/02/2018 =C3=A0 09:48, Felipe Balbi a =C3=A9crit=C2=A0:
> >=20
[..]

> > way around :-) First fixes, then cleanups. The reason is that fixes can
> > get accepted during -rc cycle, but cleanups must wait until the next
> > merge window.
> >=20
> > Please fix up your patches, otherwise I'll have to apply the entire
> > series for v4.17
> >=20
>=20
> I agree with you. I will be more careful in the future.
> However, I will not re-send an updated version. Development on this drive=
r
> does not seem to be very active.

=2E.. not quite right.
This driver and the fotg210-hcd is *currently* under my observation, I=20
want to add a phy/otg driber on top of these.
Feel free to CC me if you want to resend these patches.

With "not very active" makes me happy, so I don't break not much.
And if anyone ask, I have some devices to test, of cource ;-)

Greetings
Hans Ulli Kroll

--8323329-1598662189-1518864616=:10047--
