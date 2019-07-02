From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Jul 2019 12:24:26 +0000
Subject: Re: [PATCH][next] regulator: lp87565: fix missing break in switch statement
Message-Id: <20190702122426.GI2793@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7SrMUQONj8Rl9QNG"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627131639.6394-1-colin.king@canonical.com>
 <20190628143628.GJ5379@sirena.org.uk>
 <4cb0e4ab-66c7-2b3d-27d3-fd5cfde8988f@canonical.com>
 <20190702104420.GD4652@dell>
 <4a0a50be-1465-0554-f787-dec72bc07a00@canonical.com>
In-Reply-To: <4a0a50be-1465-0554-f787-dec72bc07a00@canonical.com>
To: Colin Ian King <colin.king@canonical.com>
Cc: Lee Jones <lee.jones@linaro.org>, Keerthy <j-keerthy@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--7SrMUQONj8Rl9QNG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 02, 2019 at 12:12:10PM +0100, Colin Ian King wrote:
> On 02/07/2019 11:44, Lee Jones wrote:
> > On Fri, 28 Jun 2019, Colin Ian King wrote:

> >> So it applies cleanly against linux-next, I think the original code
> >> landed in mfd/for-mfd-next - c.f. https://lkml.org/lkml/2019/5/28/550

> > Applied, thanks Colin.

> I'm confused, who is the official maintainer of the regulator patches
> nowadays?

Me and Liam but since this patch only applies against Lee's tree he's
applied it there (I didn't think it was worth me picking up the entire
cross tree merge branch Lee prepared for this one fix, if Lee hadn't
picked it up it'd have waited till after the merge window).

--7SrMUQONj8Rl9QNG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0bTPkACgkQJNaLcl1U
h9Blxgf/X/fK5rQM9Xb+Yt492Z9/NCArCSuCI/mxZbI1rmSe+GDcD8h5mV6hd0ok
d5MOzJ6HnMDRxgAZIns3zlNJ+Pm9F86FKrpfEv6Amjd8ykg7Xy9Gb0DsNv2PQnj9
0K9Zf3cD5OBEAM8VusSStT/AvvFxSkejXLjt5nswMdQFN3a7CS16U0aGIZOrd1t+
rROoqa5YQKTb4AF9Tn6+XoVvpy96zd2ixbFPqDeV8EwXJFt6+Y5PJAbSvXfG6HX+
PYOQO/IMeJqfH9jbg8a8GyDdOTYC5rKHKIRPmbZVuRGo7O4WEDpMRFO1PwKiBV/J
hcNdXDspcFdYbwvUUo6Ar3d2F94ScQ==
=aXbp
-----END PGP SIGNATURE-----

--7SrMUQONj8Rl9QNG--
