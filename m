Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F423430CD82;
	Mon, 16 Mar 2026 10:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657578; cv=none; b=MpvSOAo/XByvsDNmmKd22WBmDm7jZwc5cN1S6kAkFgQe88NIEARHimQl0kOo8MYxZvDBfQWVZzvcMJTvecDuAmdSqw+4fKpBJ8aPSF888PudoU4yUHDQYty9Q5Vx7Fk8GXOB2O3b9JhIpYosHxNXDU5nvBgL0qVHlYQoadXvkKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657578; c=relaxed/simple;
	bh=igVpcl4/f6b28dZqzXJ3ntXWnWjPWFOO9ecHar39Ybs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsEANceiEyvpBNp8sI/4yRrVgKdzae7kAowVB/PKbHHeoXUr1TqqG7V42WxuU/SDMbtOhPpjblSdgintslhlRICifLzYPbiTb4NOTMjsxusYg3Rx9nVH1Km1XHbua2WwnalzZ9fWDhuRq1uKDs/yJO02+fwHdN2IauG02pCX2VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQBQh9Kt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQBQh9Kt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1111CC19421;
	Mon, 16 Mar 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773657577;
	bh=igVpcl4/f6b28dZqzXJ3ntXWnWjPWFOO9ecHar39Ybs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQBQh9Kt7wmOUo0lltf9QGtIwMVyHZQnzHugjKPwPpaM1GrPrf924Y5RDmVf/xl/8
	 +eHIZlDfVDjyfTDnVgybqbmdNCZofXa6fcUL11Ev5Lx264PGOkw5rlxhfyNnsMCTL/
	 oKmBh6WJCGHsZnIDcGL+ZJQqY/qdfrZ49GSZ3Khs8isXc/1Nb3j0BZqzPjrKc8/X0I
	 PqXHwo9u58KmwTGO+sYASTX19ULt9CJ1DLJaWMJxYSFH3nhy5yKukQ6wBlreFGs8Xf
	 RTvEOySqWD5sZQfbjo/zsXydZd13aAWa2GCRwBFr9BHohftWg0eGocx7ae2zNc4uNQ
	 n0MUdg0tjbSCg==
Date: Mon, 16 Mar 2026 11:39:33 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, cocci@inria.fr, 
	Nicolas Palix <nicolas.palix@imag.fr>, Kees Cook <kees@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Subject: Re: [v2] scripts/coccinelle: Add script for using ARRAY_END()
Message-ID: <abfdDqYbRWZ6UNjB@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
 <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>
 <aa7XD-rk_KWQvTQX@devuan>
 <abblv3nCut5aRk7q@devuan>
 <0c5eded9-f56a-434c-a04f-b229945ae4c5@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="54decdtviyiimcq3"
Content-Disposition: inline
In-Reply-To: <0c5eded9-f56a-434c-a04f-b229945ae4c5@web.de>


--54decdtviyiimcq3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, cocci@inria.fr, 
	Nicolas Palix <nicolas.palix@imag.fr>, Kees Cook <kees@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Subject: Re: [v2] scripts/coccinelle: Add script for using ARRAY_END()
Message-ID: <abfdDqYbRWZ6UNjB@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
 <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>
 <aa7XD-rk_KWQvTQX@devuan>
 <abblv3nCut5aRk7q@devuan>
 <0c5eded9-f56a-434c-a04f-b229945ae4c5@web.de>
MIME-Version: 1.0
In-Reply-To: <0c5eded9-f56a-434c-a04f-b229945ae4c5@web.de>

Hi Markus,

On 2026-03-16T08:18:17+0100, Markus Elfring wrote:
[...]
> =E2=80=A6
> > 	+++ b/arch/powerpc/kernel/rtas.c
> > 	@@ -555,10 +555,8 @@ static struct rtas_function rtas_function_table[]=
 __ro_after_init =3D {
> > 		},
> > 	 };
> > 	=20
> > 	-#define for_each_rtas_function(funcp)                                =
       \
> > 	-       for (funcp =3D &rtas_function_table[0];                       =
        \
> > 	-            funcp < &rtas_function_table[ARRAY_SIZE(rtas_function_tab=
le)]; \
> > 	-            ++funcp)
> > 	+#define for_each_rtas_function(f)                                    =
 \
> > 	+       for (f =3D rtas_function_table; f < ARRAY_END(rtas_function_ta=
ble); ++f)
>=20
> Are there development challenges to reconsider for macro definitions?

I've seen cases within macros that were correctly reported, so it's not
an issue with macros.

> =E2=80=A6
> > 	+++ b/drivers/net/wireless/intel/iwlwifi/mei/net.c
> > 	@@ -43,7 +43,7 @@ static bool iwl_mei_rx_filter_eth(const struct ethhd=
r *ethhdr,
> > 			return false;
> > 	=20
> > 		for (filt =3D &filters->eth_filters[0];
> > 	-            filt < &filters->eth_filters[0] + ARRAY_SIZE(filters->eth=
_filters);
> > 	+            filt < ARRAY_END(filters->eth_filters);
> > 		     filt++) {
> > 			/* Assume there are no enabled filter after a disabled one */
> > 			if (!(filt->flags & SAP_ETH_FILTER_ENABLED))
>=20
> Will any loops become better supported?

I've seen cases within loops that worked correctly, so it's not an issue
with loops.

After debugging like Julia suggested, it was indeed what Julia guessed:
some files can't be parsed correctly, at places unrelated to this.
There's nothing we can do to improve the patch.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--54decdtviyiimcq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmm33d4ACgkQ64mZXMKQ
wqm3Ig//VTIw0MfrevcDnVojqpoLgYkgVu5sSa9BFr8xaGHqsLg5A8aj6JkgUOL4
keVhKsFy3nNNTmCHeEYSj2zcjkeFFbTfqv9ZmT5BoPRhSMsVji2IkhG7IR9mkK6a
XV5Dx+ZZEAWuPu9ydJc5tDsHVViqP9FXsR4WQTYoYiQ57M55GugWByEuS11M1U6z
q8OU92MZAoJbRClRNJp+095JAlIb455mJcK1Mhn50bgaIAAnkMJAg/8XsQa3vpN2
QokH0+QC75lLdNz7tA8ho/8gm6Y6020SEdFCuFjnD1M+DxY5cI2nOtsVnAph5qXj
Pm8mgsDsmK4UwnEDGX5VJNIzoUCIZfE6Bmk+2Lgm5kOZakDT8fDMOe9jYysIrvDx
i/V8T3WLU35C3D3nW6UHvybE7ODe0xkwX+8eHqCSTXJwrxDlEhq73dyl2fHURcKW
UkANszES1VStZV5eieT5gc5bWZKYuFCGyWj8v5a2NKgOvGzjVLQ4aYbhQDWv3E/h
NZM1lz/tgfHnrUBH2FmuEFBoNZa441uyWot1Cn4n13chtW8YdOGxVvHQ854QlPRS
nZgSPSU3EpzgQ3fO3RZ0pd4NShLkuEc5COAtdi75HjVygQVls8nQ8x+1FoW6HZZJ
89p+M0FaUopvATfko7CeWzyrTSO0ytgiSgI+A0mxiibnfWt9TZE=
=u7B5
-----END PGP SIGNATURE-----

--54decdtviyiimcq3--
