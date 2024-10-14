Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266661AB6D8
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915276; cv=none; b=phMyz7RKzGV/K1ShT+9skYmFHFG7DSwAra7qOHLlGjCdS34jKzjKsuXRZJ99xkX2x2ARqrqGYpwn4kFkgao1zwLDnEuRlk39V7xhF+YL3o78IYkGOgUbqyowHh5WwLrRol4dDHssvdVsgUyK+llmT7R8cyMsDm+jqs0J7+f1U3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915276; c=relaxed/simple;
	bh=8wkc9C1C6cW53JJOnzRxotYlTYiKlmG4ZtZhr5qyGAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIpYpn4KJBC6j/q4jKScqp+gwG1YeJviUYEqRUe0xrXSXrfNkgskNpVGeXxAkaVTXtA3o6WZck5y5y5qrymri3+C5Fger0lVw5NH/sZr1hpTEHhI/tBsEEQ+aFtvh8pZfeNndPnletxuKEHgot6sj2YwSOWpQGHox4xz7rPIhxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=zHD1bUNw; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="zHD1bUNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1728915239; x=1729520039; i=christian@heusel.eu;
	bh=XRnhJsCS7h4d/T1SN6hdpWSZaiVdnlEoGFbSJ+TPXRk=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=zHD1bUNwuG1b8+q5g1xCycQnj1KLqYSZ1vGLrgY7f6cJZe8N4dQpN5EJKK+T5q/n
	 DBEdvib8Q+ujP9uNCJm3sZiP958/xY32Un7dMNSe1XDCH1v9cWKiruVNkD22qFZDK
	 F/PjFjhZk6i35leBdLLZ3jSl4evtQVD9vHF/miNro/pNtT/A1nmUpcYg89Su+JMge
	 /6MyKKIt4rYuPUDOw9TvwaJhzsFVVP5pjmDAPdTuIBuAZ1wxGPZQaGOvIz4TTLaQ1
	 ZvP+K6V8gWWH/PXxh42sxi4CqIuB2Ynv2vBL+5hCq13DT4jSya4aAMKzDlbMWC8hh
	 3Cy4ApKz/rEQbEeDOg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([80.187.67.118]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MBUyX-1t65y50scZ-008szu; Mon, 14 Oct 2024 16:08:46 +0200
Date: Mon, 14 Oct 2024 16:08:44 +0200
From: Christian Heusel <christian@heusel.eu>
To: Andrew Mbugua <andrewmbugua388@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Removal of unnecessary cast
Message-ID: <e7781a9f-3ab0-4916-b6e7-2c92dabe97ba@heusel.eu>
References: <20241014112207.688877-1-andrewmbugua388@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oqkbchotlrjqhwng"
Content-Disposition: inline
In-Reply-To: <20241014112207.688877-1-andrewmbugua388@gmail.com>
X-Provags-ID: V03:K1:VWTJn04YWoFQHqC4BGHeedHfo+NliKPh626ysdsuyG9CNQyEzDi
 cV8vSnjgbJR2JViERYrzyCJfMB0yBobZxYow9OKQHM6RToLv91SfaOzQgrrecloCEbmtXfy
 MqM8ixP0tDS+hYRHRJRSDpKmoBstlU4NlZsPQbSZkYObDjJDjuMFviT75GlAFtHv34mCxKc
 xSLO0v0fhTSfUWRsJGgjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9g4UaABb/P8=;dUquOZpxrZmvljlL2egW3gLnFDM
 tqzUbJ0B+UkP24NiAy+Q/HdWOWqRBsWrlA9auAT3TfnNhK44jWXb8JW5+OTbYK90KAQsnGLwV
 ZQvoQTJ44PmtysQuSwwfN9SMRNJLmXcw0jpBT4lftfXWKPcqOXt95L/Y1cyySxRakwnEM+IHs
 s3RrgjEXn5DTscBKibduJJ02kiNVycK6WxEhS77U415GsoA3Xi0WQEoOeH5Hg2QjiEj7YT9gm
 aEq+tpAGQzCS2zHhsVOeM9MCQuUscS+H+26m54JykoyknbQT8qTcP+DSFYA3O5pC9kyWpdf1f
 KaEhlFpbiuQVI0IbJDBLjHXeHlmIr3cdtDiWGH7a2bP+H+5h4BYqZb1cLq3U8JJoX/XGO0pdJ
 fCpOUtFqhVw8OJRpUyp7ZZMXr8fSo88UXWb+qB5wgqsQzquyKRSlw+YMLAsoNOzGAyy3qOR63
 tUtGUfhcNyz3osf/9HGpxrI/G+KefMfB8+uqBMUSn6SAxUuNRf53hUD/VJEscFs7lYjjLLSK4
 /96LoA7kIGKq4d3P0haYsfJgqOempIrxkzI4rG4I8QG0Cz4ejtiTTMksxQ7oHCxLXbZCK25Rb
 FMGJlXZgGRhuINLq6oF0Ol3VpDsJseyJUR0DjnLRK0SfJ5V7HlJ0hws8I35lWsQAQZYz4zx0L
 rkVkT6c0AmsFqDHZdiL0K7pZXFGoCuU5xwlej/be0pybUNWN5BRwXin5CQjErvu35ozNurJlW
 5ZZFsyJMVPVrxTM166PtipjndAfq2lAqQ==


--oqkbchotlrjqhwng
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Removal of unnecessary cast
MIME-Version: 1.0

Hello Andrew!

On 24/10/14 02:22PM, Andrew Mbugua wrote:
> ---

It looks like your change is missing a change description. This usually
contains a short explaination on why the change in the patch makes sense
(i.e. here why the cast can be dropped).

Your patch is also missing the Developers Certificate of origin, i.e.
the "Signed-off-by: ..." line which checkpatch.pl also complains about:

    $ ./scripts/checkpatch.pl --git HEAD
    WARNING: Missing commit description - Add an appropriate one
    ERROR: Missing Signed-off-by: line(s)

All of this is covered by the [submitting patches docs][1], so before
sending another revision of your change maybe go through this.

Cheers,
Chris

[1]: https://docs.kernel.org/process/submitting-patches.html

>  drivers/net/xen-netback/netback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/=
netback.c
> index 5836995d6774..35801828c78b 100644
> --- a/drivers/net/xen-netback/netback.c
> +++ b/drivers/net/xen-netback/netback.c
> @@ -1294,7 +1294,7 @@ static void xenvif_zerocopy_callback(struct sk_buff=
 *skb,
>  	spin_lock_irqsave(&queue->callback_lock, flags);
>  	do {
>  		u16 pending_idx =3D ubuf->desc;
> -		ubuf =3D (struct ubuf_info_msgzc *) ubuf->ctx;
> +		ubuf =3D ubuf->ctx;
>  		BUG_ON(queue->dealloc_prod - queue->dealloc_cons >=3D
>  			MAX_PENDING_REQS);
>  		index =3D pending_index(queue->dealloc_prod);
> --=20
> 2.43.0

--oqkbchotlrjqhwng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmcNJewACgkQwEfU8yi1
JYVfWBAAg+ydCoJoc0/sRO9P5IApmjwoVE4yTY8aeiTK3vY3xZnB8WYoBeQkkJAe
kqq8r+P6NXFcWR5QqmhGmB09HyhFo9WOOTX28Pk7MdK9JVNaDh3Nky5eoFIzd3A8
D+jOFOhdCRaU6+kpY29TZc+UrVjmUiCTrUXH7NJEUk0+SS2wHez4WLQ9kCUUzcQR
wD9dEtol05kOSYEILR4JFba0N3kVGzGv9Ro6uQnE5YT2LIdw211lIrA7Vrj5pAHx
rk5qJO8TNZoUVBkLaJeY/qmd3zcS/h95zYKxPBlPWbz4F+7RfBRW4EtYmXnX4SGw
nwZFAr7AdGme7vp/cbAcIulSKBi/v045vBCtw58xYnuh8T4Tw0Kll+oKxr37qls/
rKcQEY8J2xgx12T7TRTqT2TMBa+UGbQj+b3vH6jBEEbhFuWzFxvVqQxqpBfqlQmu
kmDCIKB7GCqX53rVA8+qg9SWh/UrlyvDJKGtEarRZPrEWKXM3rYOUxsMG5h7ujTk
/3AIeGHiz5J23tqAiCxY/Kq97TOE4SGBX857d28dVfM39V2Xra8OMn3I0TZlofEr
m8hKDfInqyDhOLplox4OopL0c1nPhfl3mWvxd18a3MoLgSaoTF7sRNczw2/DOsWC
lMqZaFYgmLt0NBCcEgO8ixYFw3bbv6BZnKFAmw+spui3Uzpc8cM=
=oyq7
-----END PGP SIGNATURE-----

--oqkbchotlrjqhwng--
