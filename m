Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F6B1E47A5
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731576995; cv=none; b=jD8PdbtgAprjgkXAI5FzCt+qrqbmqHxEmKfqJkMU/bPlJn9aRthqQz1VfqFgcJKlzXFFVQzTOk6BFTrEsjxZQ2KVlGDhf5U1ngCGgzlBsLp6Kb+enEOzF0geGsNmVFc7uXYv2UTPIEg2SwI3L8Qgjt3ybVdbgHkNUm4v4B2nl84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731576995; c=relaxed/simple;
	bh=csv1M4CyQEt/RntGtEVuXcsMRsZzag2MnVexJKsM2FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DY+hJVKFasmP5CwsCdfG6kPEEYxWpYs83FeSDxlsut2j1/qWNuap4/rv2aGvo5E3EWJPCNIfySMB6MxyHqERNaBk3N7l48ybfOe0etiTHyFn4q163kKD9VqEDpJc412+O3uiwQWqsq/bZb+D3uwA89QbR8zNWeSFdRIfpYJA3Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gx5NQb/T; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gx5NQb/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=csv1
	M4CyQEt/RntGtEVuXcsMRsZzag2MnVexJKsM2FQ=; b=Gx5NQb/TxsG39PJI4OhA
	xRaUrIyqf333IARNcupnlejQk4X6MHmE3Wr7TUBRmwgFklhYfiuU88viTRZqm8/w
	mCDoPaf88yi8w2Cxh1OTkhX1ggWpW1rIWwmm9u5ptm8YxpKvK/ePGPoAZlG39enq
	Humfby3mdyfb3UhUl3M/omJ/NOmcK1F9ix+ucWifYHX5HuHn8Y2nLS1GvnBaEdOp
	vPauj+/bAPpfAWmWbzdcOucRgoqAaawAauaBPkD+a/6mBZClID+zZQ+HPzfobHhx
	Fg1QP3KU96oAZ+Z2sroeydqDpN7umWZeVHoFYRyvf4+oFeMchvcJOsQTqnV+Deqy
	xQ==
Received: (qmail 3106452 invoked from network); 14 Nov 2024 10:36:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Nov 2024 10:36:30 +0100
X-UD-Smtp-Session: l3s3148p1@3gFpL9wmZLRehhtH
Date: Thu, 14 Nov 2024 10:36:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] Documentation: i2c: Constify struct i2c_device_id
Message-ID: <ZzXEnp5fi01ePWnP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-i2c@vger.kernel.org
References: <c8e6da4adb7381ee27e8e11854c9d856382cdc93.1731445244.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x5iuvD6cL/QxHzcL"
Content-Disposition: inline
In-Reply-To: <c8e6da4adb7381ee27e8e11854c9d856382cdc93.1731445244.git.christophe.jaillet@wanadoo.fr>


--x5iuvD6cL/QxHzcL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 10:01:00PM +0100, Christophe JAILLET wrote:
> Constify the i2c_device_id structure in the doc to give a cleaner starting
> point.
>=20
> Also remove an empty line which is usually not added.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-next, thanks!


--x5iuvD6cL/QxHzcL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc1xJ4ACgkQFA3kzBSg
Kba90w/9EEUbK0gVlZeKrg6mlUDTaRW6Qpve4CK7/6E0z7kTdFDGttEbequD7CZj
PGh5hTdCxsuJ311klMedkx+tm4uGONubPVlKhKTk9UEXV2xSIb0gFm3E0f7nQvLm
GEX5n9up9Mg0DmLYgiOjWgLqq7r2OgzN9IxgRk/BtK/zAQsMSDzVN6J1Ep5sxUNK
1Ju461QXUFYEGcsoqZk1FLYIK7eguDxJtGnCpFI/hUjUBpCOgDvSvOT7E0ZCHArS
kJo1E1tE8xo8Fntp2WWwSGudbWuawt+VnV/IeMJledSCywR4IHgxQgjrNu+DPj6N
YADdB25vMv0jByzmjCc40BHixKA19Wf6cZTIZ3uo9DunKCi17/kw1cnZFlWEjz8t
2hY1AXIebniHT2AWe6JdA+pisX6HbFqsk2gPDCWfUVfZO+1ExEcS4tZmUCqolgb9
bPgrmUE1424aizH6zKSMyWFz1lMSJR9h02f9VW0F0hTr5nJMldmEfHuaJl8fDOKX
Da8sAnK2Tk8u/rLeFP5A/zKNLE9DQx1AO1UJ9UpORDTw/IUyrl5VpRSl5LusbHZ9
jLFaZPnEqMFnqCywFkDf234xLlEoq/YSM6BvMbFOExNRb9sw36o2F3U6xVZQB5ZY
o7h4HHy9k4+g0wRg8Tnnv1tCGamJfdKplFrKayiOA3XLDb/Hjps=
=0J7m
-----END PGP SIGNATURE-----

--x5iuvD6cL/QxHzcL--
