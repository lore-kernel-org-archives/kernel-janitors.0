From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Sep 2015 09:21:04 +0000
Subject: Re: [PATCH 1/2] ASoC: qcom: change PTR_ERR argument
Message-Id: <20150917092104.GN11268@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="dzI2QqkSBOAresgT"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440957911-7687-1-git-send-email-Julia.Lawall@lip6.fr>
 <1440957911-7687-2-git-send-email-Julia.Lawall@lip6.fr>
 <20150914180425.GB12027@sirena.org.uk>
 <alpine.DEB.2.10.1509171045100.2399@hadrien>
In-Reply-To: <alpine.DEB.2.10.1509171045100.2399@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org, Patrick Lai <plai@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>


--dzI2QqkSBOAresgT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2015 at 10:46:16AM +0200, Julia Lawall wrote:

> The discussion was about introducing a temporary variable to simplify the
> code.  But that makes a lot of changes, so I think it would be better to
> just apply the original bug fixing patch as is, and then the cleanup could
> be applied on top of that.  I will submit the original patch again.

OK, makes sense - thanks.

--dzI2QqkSBOAresgT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV+oX/AAoJECTWi3JdVIfQhKcH/i1oCiqlLjSxUbMidoS3ULfg
xoXUoPqZhuPjBkyywy0s88b3E4koAZIpo0ZIVrWy/x/PwrrgzHq3vuq5sWKfBnfb
1lPhl3r0KKs77hjLieq8i4F2+WMBhW81h24ryQGCeMvrfyGIJXySZNNbVOw4oP87
ecp+GfkE5KbLDq8rqKLv46yFoa296Nr4gT46sMdVX8YSG40n+jliVEf+2ThqWQMQ
FyZtwmedG7dY4DD1KHKOUvL8mrpjN4nib4NTaKJkqs0RFoDQ0daP08BdDDszdGKy
2k+rTiRk80ktiCY6P0Mu+0ytXoSx3PxXdWRlt3eKz6tfs6aYW7dyX6eIE6HlGwA=
=0Ty7
-----END PGP SIGNATURE-----

--dzI2QqkSBOAresgT--
