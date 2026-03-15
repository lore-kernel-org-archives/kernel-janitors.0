Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76AE23909F;
	Sun, 15 Mar 2026 22:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773612318; cv=none; b=sirSwa564PJLaIGj9C6qj4iWnlQbcryk8AeAG4sK5FQMtBvlu6Kgg/VJHhGPTAV8W1loueR6MV372kmZO+7ot9U2qJV14PYXRMTjzjwrR00qW3Bv7aWHtGTchPCiYwHza9BRkIKVL4xukAuKsG2NXQeoB1sTzYoBV+FQjsQUDcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773612318; c=relaxed/simple;
	bh=Dl+8Bc0DWJ8PtcYorfOJvZatXQ9xUryvBosYQ4fBb/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SM4x2cA1vef0rlK+3l0qav1GxGbflkx8ot/0dv9nQUxrh/Gsw0qmsRs/4ih/RM+0CJ7ng2ebEGYu8UnW9mAT3RcXRMUYv36l2rybJDY/Kb2Yzqctz+D9YjbSNNbRL7CZuyWFUoxAk5SrOmsnR5d02BQyJlPX2Jnwlo30xfWrIM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTCmz5Mi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTCmz5Mi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E4DC4CEF7;
	Sun, 15 Mar 2026 22:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773612317;
	bh=Dl+8Bc0DWJ8PtcYorfOJvZatXQ9xUryvBosYQ4fBb/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTCmz5Miml03UAWk+9g6CZtYQPiJusal+geOpgE5XceV202Lxzfe8rWzdczs+J+qD
	 QkziJZFkqBxPWHkqybT0zVDPOzAfTUmqMnXIuR2pEr5xUdTzP8Ha5uUiOt9AftLiiq
	 L5PcGd6wTAa2u7h9bXYSBdJ/41+Le/DwoAlVnF7P9wdndy4watyOjxF/xMVZfcIkWH
	 8QHv8C8e7fLHJaWa4VR1SU+rUklZMTntmPotAz7kUwKVSAJM0751jJyipkuKPcgpjd
	 sFaKqk/6y7IYpRctBOeJfCNJp9VGfi8vXJCSfehaU4oDfTdoaFyajhxsfa5qJjMBZq
	 d56bs8CELCIhA==
Date: Sun, 15 Mar 2026 23:05:13 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr, 
	Nicolas Palix <nicolas.palix@imag.fr>, Kees Cook <kees@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] scripts/coccinelle: Add script for using ARRAY_END()
Message-ID: <abcsydFAe1S7KR8q@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
 <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>
 <aa7XD-rk_KWQvTQX@devuan>
 <abblv3nCut5aRk7q@devuan>
 <105cf750-4bab-2a39-e62e-debceca68466@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="si2bjrmmkvasqwhc"
Content-Disposition: inline
In-Reply-To: <105cf750-4bab-2a39-e62e-debceca68466@inria.fr>


--si2bjrmmkvasqwhc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr, 
	Nicolas Palix <nicolas.palix@imag.fr>, Kees Cook <kees@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] scripts/coccinelle: Add script for using ARRAY_END()
Message-ID: <abcsydFAe1S7KR8q@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
 <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>
 <aa7XD-rk_KWQvTQX@devuan>
 <abblv3nCut5aRk7q@devuan>
 <105cf750-4bab-2a39-e62e-debceca68466@inria.fr>
MIME-Version: 1.0
In-Reply-To: <105cf750-4bab-2a39-e62e-debceca68466@inria.fr>

Hi Julia,

On 2026-03-15T18:54:32+0100, Julia Lawall wrote:
> > Here are more false negatives that I found manually.  The semantic patch
> > didn't find them.  Does anyone know how we could improve it or why it
> > didn't find them?
>=20
> Typically, some things are not found when Coccinelle is not able to parse
> the relevnt code.  You can see this with the --verbose-parsing option.
> BUG indicates the line where the parsing problem was detected and bug
> indicates the other lines that were ignored due to the parse error.

Ahhh, thanks!  It seems there were issues parsing unrelated code, so not
a problem of the semantic patch.  I'll remove the comment about false
negatives and send v3.


> julia

Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--si2bjrmmkvasqwhc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmm3LRMACgkQ64mZXMKQ
wqksZw/6AmUWEVoAZdvuU4aGOd7QuUuQqPwwo47e42fX1tDVDY5ZrNQT+E2EjB9z
3pSCGFGnooSsUl699VOkDhse34GGiXK6LBea6C6BSc7I+kk0dTf2DpS52FhgTP8L
4FHTRJSLSZx1BvCbechCLCkYmdl70Ag84vp3Y07siinszxcgGe9FN8js7mvZE/yb
U7Nc/q6N8JgATbOfcvjE1H3xnVwHuRO2dvTwCWRhNTNzb/Q0api1+MHJO6A/Jg7X
cET+Gteee6xsOYfZpAf+h2puDRl5JqOpM2vg7dNQYI8k+cl9FZkUGhd6ILQrBk5e
vGxQrpbkVafIGVD22elv/x6R/sO2nAHAD35LpmDL1FxTbz9jUCyAVtebLGxYwLTB
b251mM6gUVgOkcN6NB0XP8WAr3nI0s87KscKBNC2sREcjeZTyj4BFbDpwoL9wo/V
EeTgrWeOhc6h7PTGuytiG2qxPFqy3jwtPPyR+oIFiMRLB6XSPMUOPRD6F8tlzXwE
vJUIV+VtPQ1cdv2foCNnrqcA6HKTDnRedx0vAJBaYpfDZIYtnF5uY3PaRtgdnBnk
jfvf8iQ3cueqY5NESg+ZiA/PTnsi6gcNc16LuowT/6dl4dFCJzEp8w1YAivykS7j
TQw1yVQ4mqBGWAkEc7ThvOtGLU9KSAxB1n51+l25MrlfezTl3AY=
=c/0o
-----END PGP SIGNATURE-----

--si2bjrmmkvasqwhc--
