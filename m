Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B888315623B
	for <kernel-janitors@vger.kernel.org>; Wed,  4 Sep 2024 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436415; cv=none; b=oHaX8vppTQsIT3lCnP7ptq3Vd0ifu/WNiK13WCMwowg0WIb50OFg/TUEM4LFv8M4RvjRM0cdl/aAulWhwnc6INjEWS6mDb3AdUBPZggWzxQBK37NAdi2WHU4tLu5uoX5SqxBpLqykhfv2ASvPTqLt2qE9SLEdEbkQZVTIT6Vm4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436415; c=relaxed/simple;
	bh=B51hGM3CAVZL9cU8YLB0/zEd6YzKLjXSypp/PMTO3gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBeqGfJv1n0DGNdJA850wkvn4OhMVHvYI1zrbzGwyJyVpJ4wZAfHHkom0C4Zmy7CcbRhgYo7S95Zc69wnliL936EukHf15cH699wGooECMhpsxtAMW0jc+9Jhu2GakUdImZU+y4GUVtneF0LUXXnBTN6zPB2R6/WpzIo3UcJMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=P+XPZ8xZ; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="P+XPZ8xZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1725436407; x=1726041207; i=christian@heusel.eu;
	bh=B51hGM3CAVZL9cU8YLB0/zEd6YzKLjXSypp/PMTO3gY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=P+XPZ8xZVVzm9qccqrITDySYozYw/sE7XYiHAxe/4YuUSksAYI+dZluzXJIMjgTn
	 xYmJWteSqq24+ZMjvp+IEt+hr8ozV7VuPTEa9woA6P7ngTYa88sfslO7+q0lG/i2+
	 efsEPIb4I4ixyz+V1TNlNtTgF+OvhGqR1aREbHHSGLerYFGLrHJiOKGtwSYhLSHap
	 /3NVaVQtuXj/feAMa6ri++6fLOuETNGCHNhy31BHJ/zsj4xc9zhc3Zvcah7Ory9co
	 AgcVoZkq/bgesW7fm7rNrFAjMTFrHyZtitg55AqdTMqLsuDTYF1gi1Fg8aqAaN2bj
	 HZJe+t+WKu6xCesMng==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.142.132]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M8C8J-1siABo05zv-006dTM; Wed, 04 Sep 2024 09:53:27 +0200
Date: Wed, 4 Sep 2024 09:53:25 +0200
From: Christian Heusel <christian@heusel.eu>
To: Su Hui <suhui@nfschina.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: ping
Message-ID: <44b52118-7694-41b3-83b8-ddf8c7080a6b@heusel.eu>
References: <a0294eec-723d-a564-9df3-9945ea2c6050@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y3ll2jzmrksalwkw"
Content-Disposition: inline
In-Reply-To: <a0294eec-723d-a564-9df3-9945ea2c6050@nfschina.com>
X-Provags-ID: V03:K1:JuZLJuPnziVg+DEse/e5f9WZTiT1PENKRf6FtBvLQYwAjUcgsNu
 5hTlcxB7m7H4JljvqGfiVR5G/V5BiZt0hjv5NT3380MNLx/cQsP34ap/KX55lA7JcVTUs/u
 GSRbGeTX//4COlAyvbRjqQB/0voKHDM9I4Tk/o3F2+d/rYaIFPxLMsyhSDPF8ohvSS0FEGe
 Kn7duJ4bgFrQFeHp2vFHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0NSwrWMgFpY=;mjzVOLyHecRkyFSF4le4h0fY/hA
 SJKrmhd59a+MC1p9/8HR7SA7RUfFTuxV1dZNDX00HQAn+B/p9l/G3P9hooN9xad1yyhaHTcm1
 BV6vAqwr6VYp+3jk/gwIl/38wGXuRZtK10ikSGqcwa40oE7ysizO3CRPdgYiS0Ov56NAUS1g+
 zh1ZrV4YL2ZQaM10kfu3ZEA9QaAGguVWjoDE97I5TQYEdk3obhEP3Aow9/EkphBSqYpG6gOBL
 DOXyMpXSN59sUDdSc0WMKkR8fUE2/zta+dpMGFXdMvrYzRMaJmoiR5FmEDPAFOyUGgN2VTJey
 CE/7j6MijFgaol7SOpysoZXNjsbriXz2eiGM5JZ9w8FYBQhi7S4mMU3PxxsEyBlorhLdy5lqq
 RKDnRdZ988WVThwncikPQ1M88NyCgCpunixIvElQqmMMBehIfCX6Vdvdrxe7bf7RSM2PcYuxO
 Qz4F5LBcnIggkk3geqmWJ1jurWuJwTqJ+fXLVfIyLtRPHHaFENRN9be70ogL7BYdpWIwa+s89
 jubrb3OXWix3s6ydFjHzNBp85EX0wHCFlO9KvJVT8YHA08Y3KoZ2jOF3rirgHEcJCpqlpNuuD
 U8DV/1lT/Q7mskHWqWLsCmFU5wPM7eBZMRWV3ievrG03zXfHh1EaeoM19wW+TZyZm/4neP6Tn
 cM1i3f1IZix0GWMPtUniDR2qK/coOrauA//Yd9GtvXIzaCFmSOWh5dJvAhlfZaAiYHhQbF6EB
 r/eJJX5uTobQc6m2JG9fSYY/Jtkw6KjKQ==


--y3ll2jzmrksalwkw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/09/04 02:20PM, Su Hui wrote:
> ping test
>=20
>=20

pong

--y3ll2jzmrksalwkw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmbYEfUACgkQwEfU8yi1
JYWIWQ/8CYH0Xit0ztDjI9yuoNNJjlXhq5Rk23t1OQhR2VFWw91KjR/bt7Swjrvf
bhBTsveTYQtSXVvDV96ApvWToTQLn09kqhQWL9GbRbY0FiRAJq52hcinid1dRMIG
uT7QWwDOyBQyg9sGsK81yEi8HK+iwgIIBpvGXwxI4hfhord8zE3KWEi1kt9Ljf1o
GFvTBx25R5arIDcBv+2lDxcrKzvxSvH5ZHW8IvcDrPtmQXxxpyJlwU4rg0ZlLwvJ
Z4IwdcvahsDFGF/fOue6N9bgUCe/CkZ97UPZJPYYp4u7840rbsowxQQOn1cmczL/
1XMFOfiP7v9/Ypozj92hrIes1Q7dEcKDamDp80rreMzUaffEYdXc1TrNGyOLPI5W
GHt231CoJbABOy2MevM46b4ZYF61wR9lF3PxOukUxcf17ERVDJVIZSJhARsEYph2
5dAnspgpdVGdrOE8225Nif8mjsDeU/dCkZ2HiF2WSw8OKrze5SHroFTCWEzL9Suh
A/v6dNAyuUGHLOCUfmiJVP5smmsCJNAMIF/tbyqFVhNGYXsk7dYTozUdlENtpp81
LIN8DMe2wUQP5ikW5h4IfbOtlgbwIZYxKjokQpYLFNwrzeoRjzjcdK0VjXWe8I3z
GrjudiacxBb9m9dGysoklJ2Pg8QgMc/G7T3yWSehM8rxWQStOv0=
=/A46
-----END PGP SIGNATURE-----

--y3ll2jzmrksalwkw--
