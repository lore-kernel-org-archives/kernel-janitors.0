From: Eric Anholt <eric@anholt.net>
Date: Thu, 17 Dec 2015 19:48:09 +0000
Subject: Re: [patch 3/3 -next] drm/vc4: fix an error code
Message-Id: <8737v0x3eu.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151217124020.GC27382@mwanda>
In-Reply-To: <20151217124020.GC27382@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

--=-=-=
Content-Type: text/plain

Dan Carpenter <dan.carpenter@oracle.com> writes:

> "exec->exec_bo" is NULL at this point so this code returns success.  We
> want to return -ENOMEM.
>
> Fixes: d5b1a78a772f ('drm/vc4: Add support for drawing 3D frames.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks!  All 3 of these are Reviewed-by: Eric Anholt <eric@anholt.net>

I've pulled them to my -next tree, which I'll send to Dave once we get
the CONFIG_PM_SLEEP bits sorted out.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWcxF5AAoJELXWKTbR/J7oNI8QAJxAJcMtMJBE84j5cezShc3T
9mUDubaw5KqIg76y6LIRmPd3eFqqdKl0Nng0bdj4KWQEoYF4pNMlc+d2J+ok7Btl
DfxIaCfzMeLtzaAYSriq/w3PPLMFDQsrgWFaYczK9WlCfVMPw+w3xZQATB3uRtUD
bck3p2O9seT0BxeeGVJSQhS/bBo2ipDmCWSIPWlWN9o4I2Emt3bqAppyawZfneP0
zbpiU/sdsnB54ne6i3UW5LZKozIhCty7ht0cMuB7zSnVIQDG73N8+CJV49f6hB3w
xOqqhUn3YjldPWtBbNSlcO0/YfEc8iuvUCne+sCBtW1jsO5faFycc4ep1QXBD8vL
rWKOizehyNQVeqHX2yLpDTrSqiIiX0XEJYAkZBOvfGuwkA2sYCD/l5A1qHTkgHsO
IMPOoJuxWaub4Ou0bCE139ZfExrHGYZC9yvsfHa1/HPzlmzJwU+Gxw4qYEmB4YV7
0JsjTHAMKwliHstl4ygXfnxkPv7MySi8n7elt1k06Pf7wla++8ZLhUDCXbvGPHuV
+VuoZFrv35W56Xud5TDoCONakY2OGCIweL/afmhsF6LAfqsGx2BRu5Wv9w0O8C+r
8tUKocDWvFLn5HFd9hF+9efmIXTuq2YrVbhrYCQPHAbZk3GTSn9JokjnLfGaY9aT
OnctAz+imaO+JR2WjERD
=CtYn
-----END PGP SIGNATURE-----
--=-=-=--
