Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60EF266B52
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Jul 2025 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752517447; cv=none; b=ElrOaiMmunIf+u7upX2xJchV2xShWlESrHdxdcifEWALIcUJfT2u6A0pP65F/31+yXdGkRBE3keFIjyv0imkn8m/nNFvfJw4hKIDWoLIEsXEAfGZ8wKAAIQ/8Mi7i5Ad/m3hRm3bnSc8UrUeyu6k5GOmlhP3q+3vxAw68wQgaN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752517447; c=relaxed/simple;
	bh=H6tH93kgW4IioQ1p6lWDUTCwsY2fj+GJQ20J7ACRuMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYU+pU+J1YFoz/CghJgdgKzWaIApwtjzXz6Tx/DDfDmza+kWUB/1qUeTSaxXWT+8mtsOJaLna3DTZ9UlMLlL5Qvl0AZMV/pSyMTksq2tOvnfmTEKSPJT6wy7mxIk+g6amOJBE3Ywl7P5ISIrHkSeOMaLxuFrxnhUqXCEko0xb8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=DuXtdlsU; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="DuXtdlsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1752517435; x=1753122235; i=christian@heusel.eu;
	bh=DE+SVDTwNSJmZtJ8zChY75oEyGV2lVUDRWAm7/mihBE=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DuXtdlsUNFM8/bnXgeLPqykKaaiqdEFmgny+zAofETsWEwKXquDxQ054RKUfJKeV
	 67S6RQwEN2V6l4DMSbhGtP3NvgdvZHLOmzfr4DV/Zs5tTbdkkxkgymL/R2KUpHoaa
	 hRz0+cfIjJs1pJ59zj+13EYldcQTfiDMJ9yMISkvAYxtOYBqb1U7leYW6HZFxaPWH
	 qObi5atlEC1h/drhIkZJtbDGMeR0ugO+d/J1gWAwnX2T3nCBrvxhUJsESbTx8GxZS
	 sJyHHbD80QZ4xotsFdPcUf/u0dJOx0VVQpYvIfbBeJpvg2mBSg1FoZmQvoH1Fe8gT
	 +T1j257TkAM2+VslNA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([80.187.67.178]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MOAFl-1uHFUA0aFd-00Iy36; Mon, 14 Jul 2025 20:23:55 +0200
Date: Mon, 14 Jul 2025 20:23:54 +0200
From: Christian Heusel <christian@heusel.eu>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] i2c: Fix grammatical errors in i2c_msg documentation
Message-ID: <35070a1e-925c-4c46-b839-30f8012ec69f@heusel.eu>
References: <5034bf7a-e415-478d-912f-5442bdb28143@stanley.mountain>
 <20250714154339.4740-1-viswanathiyyappan@gmail.com>
 <20250714154339.4740-2-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dowcpq2kbg6lftuu"
Content-Disposition: inline
In-Reply-To: <20250714154339.4740-2-viswanathiyyappan@gmail.com>
X-Provags-ID: V03:K1:IQK2SGo4FKHYcC6QtDEVmS2KiLZIvkY3kVjEWmYJrqwgb9+vwpi
 HoRlhBx12lNpJM9l2iz91VeFQStbaLsQPeb1P8gaCBpGyYZtFL75LxelyRPb15pXkLDhjUf
 Il46I2rwJC+B5ZV2BowopbYaAzWtiOBupejZWCFUlqOUruJ1B0qw/mnb1SEhGZE0cGdV1vG
 Yv4CyRS1Cqw7ZxxWpqXFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+nw/7thFHsU=;1G0J48hhQjAiE7X7A19NMolOjoQ
 gH0GOOlyE9Fe82VfyhVfTZRKb/GLwvq/dSXGsbkbBsAQL+BJa+5cIFl+YzocItJVuTAKbz7FN
 vDS6R9DLbCNWKQ7d5TWDPFKL2dfoFs+YjW3iz49xCneHvdiwE3rev8bHpCjnEfG3xpZJTY3Tc
 zSdtc8EGpRylA7ZB1Uco9QBLc9rCkO/cNlHifUeoStBVmLMisvUihL2p7w3l7tvWd1NXvNXks
 N9lQVA3Th9WgDdxw0Cy5kzhFG6LSRPoCqCGbRwETD478J/1itMPZi91ZBjTOtqh72dfgLsdE1
 yAh8BjV8izqtodUSLAByu0N8dm785LSJuoEh3NtvMJPHtWJMlaXq1JwRGEPOfrXu+T6r1U15q
 8WT8aBU48F9TwoinwxwACZQLPWFGZRHixcWNFR92awvljrrAtShePwncWRejSAvN4d28JmrPC
 f7EjQCsupsAed5bj2hmkLXw2OZ9iNMLtP1o1StB0mKkHP7LZDMVZ/YTInvVPJxnzbj4sB2eMh
 ITUfb88QUyYyeRMuOUO4W0C4VbRdpBDqr6sGVfvXw6gAUePt+2qnrFQHpe8j3MPYKPSCYpPFQ
 45JjSPmo9TeAZTpBa3/kV6Ed5GuDO4WQBjjFN2HuEO5BCF1WpJjbooDgUV4mAeOMDZLs4psMe
 +PBmC0qjTH7eoN194KXZJL5LJbN+PG7xOYVZ8kKibBvcja2EdCHN1bIgPPmWpEvxeSF08qaX7
 tfp0iwZGJX3DZ5RlsjG2ur1YU4BKT34ZdaW6+3FPp+4s/vyHfRcrfdyzlV1sNeHqTPhXGriDZ
 oXm1K3no0Hgc0lyXCXbc0ZCsMRKTsybBLtXt0duxaqXnfhw4t61Jt2LnXCP55H+wg/3Ut4632
 5rp4StcwuDc5PlgOTW6IFYypKSgY1RMMOFqqTwGtHjseqEYbFmXUu/Jxmvv4Ls/H6Poj/n2M5
 DkDBMf5vZDI9xQvCli+e72fDirbwK33xBrw83yuv6f5QDj9OobEaUDaiu9poK3DiizqOuDXVJ
 PxhFMacbssotjCQ7nRdd9UwCKrrAAdkGGBWl8mxxDzt+cYo0kqqNJONEDQX7g2r6ZseKNVl1b
 7NQpQUFbxCGtIjRBprUpkd8fqPvEQZ9bQ/NBDzWcJcJ4d8u6Xl+/EtZn6mqWSvdKXITdEvByK
 YXMxvyb/HjKRtJ8/l1B8ppFQGY9iZrn3vhTF9u1cvM7xbHfEjYNOzaIWLm4FhnzBVUnQcFQdC
 R8IGtgcS5ePBgwq9VFY2MJIAwq3w7cxNVdjR6/f+B09HbSzTPA3HeUh8td5+O3Uih2MHpEOxI
 Dx+iWO+F5dwJcislU2AeQ5QKHDxhEoQxzQ/wfMbWv3O8jx8766uw0tc5PfOl2rpu44QRdNOQs
 awZ9QeDm6f7LkPMrGIpl/OQ7xlC9AzvAjNTkydaIjBJgUoK/SKIFbiPqxvFJuaXA/pMaIwHJy
 KYDXPRN8dJqGdHaNSJ+KqFDtXbgjn84jAv7A52CCwwhYkSpVfwC+KSU8biM1npOt8fxwHRlW1
 hcJ/FGYqs27wo4tG1+jTHTh0uvF9YH4mwqdMF84rJ/zs/eiymRjV30jz881BMA==


--dowcpq2kbg6lftuu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] i2c: Fix grammatical errors in i2c_msg documentation
MIME-Version: 1.0

On 25/07/14 09:12PM, I Viswanath wrote:
> Fix the following grammatical errors in i2c_msg documentation:
> 1. Makes only sense in =E2=86=92 Makes sense only in
> 2. may have changed those standard protocol behaviors =E2=86=92
>    may alter the standard protocol behavior
>=20
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
> ---
> No changes since v2 but updated to v3 because of the time elapsed.

I think you have messaged the wrong people as Dan and the
kernel-janitors list are not maintainers for the code you have touched
no one could take your patch.

Instead the following people maintain it:

$ ./scripts/get_maintainer.pl --no-rolestats -f include/uapi/linux/i2c.h
Wolfram Sang <wsa+renesas@sang-engineering.com>
linux-i2c@vger.kernel.org
linux-kernel@vger.kernel.org

Also see the [relevant section][0] in the Submitting Patches document.

Cheers,
Chris

[0]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#select-the-recipients-for-your-patch

--dowcpq2kbg6lftuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmh1SzkACgkQwEfU8yi1
JYUZuA/+MsloL91uCM3rM9d/13dlTttCStsj2j75PIciQSZOipYO8yhEcEn/ydUz
Cch+5s583atQ/V++d/5jHToWO7S8UK2z3641CxV/8HiC+PxPPT/VwqvJERtNuH6s
mVaBoFNBfEJazFFS9ZW5lL1n5wZPkePbGIE8vR3YJvgN4+2BrBaFgIjXVefr/6GA
r1Vb4PLc+ti4uXPF7P6Q2sy0lIKjg/xyt4LYpQ6mRBy8s5qEAwJew/QCqC5t2Stx
Q9UvdfNaVukE1XQxYGyGAKNvQWonL7kTO/VjEEqbZ+Q8sqoMR/Ohzpl9zIWQVXM5
NmTvUukrydDps9oXK44aWkBz8QG69ifZv3tIyGHhWVczEqUUpU/Qw6XdsYr88BxX
nNM3GCyNw0rjS/QVKNEx3OxvvcdHxryCeXTN28NhPSRLLNEKqcfpOW0YlO2SYg67
YYlxD02peYoXcWAQIZWozlUaW+/KMuJramQmS+nq0BLhJ0jFafWTXGcTDyeo7D1w
/Ttym7c/C4lhCEoo2FpaB+qfYdNCykdxZgQ1UPvCceatKVMjDmbn19L3SMhEzHit
9FmQjRqrxBZou/l7NNXh8ObWFlQst80O+iSAuADokwCwx6g99EOo8H4QdbcPwjW/
hTR0GYV3INZBLjOoD9E9BrKB20/jz0r1dybGNLR3SWMe4pDzofA=
=3n1G
-----END PGP SIGNATURE-----

--dowcpq2kbg6lftuu--
