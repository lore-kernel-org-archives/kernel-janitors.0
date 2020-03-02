From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2020 12:38:59 +0000
Subject: Re: [PATCH] spi: bcm63xx-hsspi: Really keep pll clk enabled
Message-Id: <20200302123859.GC4166@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZmUaFz6apKcXQszQ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228213838.7124-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200228213838.7124-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: f.fainelli@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, jonas.gorski@gmail.com, linux-arm-kernel@lists.infradead.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 28, 2020 at 10:38:38PM +0100, Christophe JAILLET wrote:

> To be honest, I don't see why we need to keep pll clk, or hsspi clk
> enabled during the lifetime of the driver. My understanding of the code is
> that it is only used to get the 'speed_hz' value in the probe function.
> This value is never refreshed afterwards.
> I don't see the point in enabling/disabling the clks. I think that they
> both could be disabled in the probe function, without the need to keep
> track in the bcm63xx_hsspi structure, neither during pm cycles or the
> remove fucntion.

If the device has a clock there's a good chance it's needed for the
device to operate and that disabling it will save a little power when
the device isn't doing anything.

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5c/mMACgkQJNaLcl1U
h9Cwewf+LaiDuAFWakLpTKZ/xUwqWqdMeVhPJMgEYCToIfMYYsMsBLLvE57s71+Z
Se4OYGwCbmz75sJq7KZTHEt7TStQ0Wfwtb2VTQ6e1nhoT0q6Vh/p0Xos0dapsFkw
sERlnAbZzf0t9rrXQB6yLjBPnU9X8iS/tatAOYylTZb3g2KO31ZxT1/jg6op1+us
bK4fcoLF+8W2G5leWAr9rn0YOTycey9CtBLnsyB6YUWGkUBx7rGhdW6sO2VWFcpy
WkrryYV+AudPf1OU0PEtdS8acdzB6QCxIzTjyXwZXDyDlcYF9VVMrAuvMZy/XoPn
rb3dzStyqbqmU+y0ZF4jWo+HDIeKig==
=mNDy
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
