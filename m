From: Thierry Reding <treding@nvidia.com>
Date: Tue, 21 Apr 2015 09:36:11 +0000
Subject: Re: [patch] drm/nouveau/platform: checking for IS_ERR() instead of NULL
Message-Id: <20150421093609.GG7379@ulmo.nvidia.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Cp3Cp8fzgozWLBWL"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150421092507.GB12098@mwanda>
In-Reply-To: <20150421092507.GB12098@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Vince Hsu <vinceh@nvidia.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2015 at 12:25:07PM +0300, Dan Carpenter wrote:
> iommu_domain_alloc() returns NULL on error, it doesn't return error
> pointers.
>=20
> Fixes: 58fd9375c2c5 ('drm/nouveau/platform: probe IOMMU if present')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Indeed:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVNhoIAAoJEN0jrNd/PrOhywsQALKltBpuuiJMc6zdU433Aj51
RH2SwDymi55cqQMhLDua0bX0R+HZOY4oJXk/R+KI+oVdlAK/zjWMCY9k5z7hoYXj
WHHao06q5i4u4U47STpiM6lCUC7wCuRSl8u9CD/qnnkPCyYqk4oHCLWOCnGQzN4I
TKpAnwQhIa3pNcETNIqftsp3gFF/wnZimTYu+szFIRhbSlM+WlOI4r82NImqukWw
eUtEHX9RC7oS38KKW4UA4SHi8BdaTMbUCHD1waZbZxDkVdJMY1/iHqqfcUqbpTcJ
Nb4PcLGKpdWk3/doPkT2Ci5+KeAQkzeDUB7qm0YedZx2S0phC62R02ddatGTEf1E
ew2dzCMHGFpyod936bkfBfoeqgtc4pELJWy2DCkctZlWkBxRPE3zMfiRuXURVBF7
5BYgwdmRkw05BN02/MC4i62myVWVS08Jl/MZUyPLviwYIvYg4gIVTTaJNndITkBm
LFxpGdvPEZ/8oc6AknFXdGVpNOD2K9m4BFGvIkZd0JZTLX0oyjkAAa0f9mFJceuR
OsMpq8BN3ButlgQuCegidj/EDMmw6F3rC7eDppzyxAz51mphPaa1XaFg/2dxWKZy
R0+gmdDIPrF9HRh92kwg/AzfMbmBZHYRNNB/d05mb8NrCI/aLUiIL57h0/0LvVcs
ewc8ro+KdVP7g2n2y9Sw
=Lysc
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--
