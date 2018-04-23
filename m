From: Eric Anholt <eric@anholt.net>
Date: Mon, 23 Apr 2018 18:26:56 +0000
Subject: Re: [PATCH 16/61] gpu: drm: vc4: simplify getting .drvdata
Message-Id: <87vachhj7z.fsf@anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-17-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-17-wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

--=-=-=
Content-Type: text/plain

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to drm-misc-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlreJXAACgkQtdYpNtH8
nuhrfRAAtsGa94ThjB3penHE1ORa0TEnWyCvBzCk80ZZVXTyBXHL1l1vl0AIBFxD
oHoWFooZYxH0FwpBqFPO1J/y4mVtbkbdOVd9AQZ8yccBiTtuehFMGhCW8RAKSYku
NAgS3GPxx3QOk0Nn/eIQ1stlJi9PbJByUEwUuJwjMxzDcl18/wIrflzR6yjiaIbo
c8XhcTao5yy2oHRfQPwSWPdgzaJaQLCQhFcPgoD4ioCNGdtfzQjWV3stHdIcvKwo
BLlqFyar1+2ReUPNu7TZXpQWeZnP2aW9TAwY14S7/MZzRANcd7HkbMb8ceaUMQHs
+TmhRNtJ//L4jSDhXE7/EZfRGbFyPhx2FZyXvI/UYtU7ZObkUYkW5yC7X7ha47E5
uSLEaR6eTqnM/fuHOlEcubp7xpT2lOA2QKvcnUCp0UeNGp01f5BQkfWhbBqYndNb
CgcaUNhKv7SOEvaIapDtuj/SlTtYEQiFzFcA7725Wfxt57iZusM0XwkzpJtfkDSF
z1ZJmffQVskT+ioUClr8X/5R5yC7f3KMLJQ0L4kYjDnWx4D5qcaWmSavfmhgWG4t
5QI8WrxWcNaMbPTkKxOqYxzN1XFE+oaFww68aCySBaFtBIbWASSjNYN4l1aC3P5y
ZVyIoyN9EhmsHdbCLmBrwQJJSBCnfax8aN2zoMEhwiwawthxJG8=
=v5Lv
-----END PGP SIGNATURE-----
--=-=-=--
