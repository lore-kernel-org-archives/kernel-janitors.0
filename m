From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 16 May 2014 22:47:33 +0000
Subject: Re: [PATCH v2] ARM: imx: fix error handling
Message-Id: <20140516224733.GA4323@lianli>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400234045-6022-1-git-send-email-emilgoode@gmail.com>
 <20140516192451.GP16662@pengutronix.de>
 <20140516222108.GI8897@mwanda>
In-Reply-To: <20140516222108.GI8897@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org


On Sat, May 17, 2014 at 01:21:08AM +0300, Dan Carpenter wrote:
> On Fri, May 16, 2014 at 09:24:51PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > I didn't check if it is easily possible, but converting this file to use
> > platform_device_register_full might simplify it considerably.
>=20
> In a separate patch, though, please.

Will consider another patch.

>=20
> >=20
> > I'm not sure this fix is critical, because the problem happens if an
> > allocation during boot fails. But still, if you want to get this fix
> > into a stable release, you should simplify it, i.e. don't do the code
> > reorganisations. (Also the "more clear" part seems to be subjective, I
> > like the error handling better as it is now. But that might only be me.)
>=20
> Emil's error handling is done exactly in the correct way...  The error
> path and success path are separate.  Unwinding in the reverse order.
> The label names describe the label locations.  Most days I spend hours
> looking at linux kernel error handling and I can assure you that
> sensible labels like this are a rare and wonderful gift.
>=20
> It's hard for me to imagine how anyone could defend the original error
> handling.  The label was "err".  The error handling was randomly plopped
> in the middle of the success handling.  Whenever I see new "creative"
> error handling like this it drives me nuts because obviously it's going
> to be buggy like a swamp picnic.

Thank you for the colorful reply, I guess there is no need for me to
further defend my choice of labels :)

Best regards,

Emil Goode
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
