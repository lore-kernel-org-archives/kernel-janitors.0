Received: from sonic313-19.consmr.mail.gq1.yahoo.com (sonic313-19.consmr.mail.gq1.yahoo.com [98.137.65.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005622AE45
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.65.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752848978; cv=none; b=ZjttbSnlrxYuZj3v9+O0cshl3wUqqDf6gNt/g8Vj5yU7V97uPvnnvaaLmY/3udwe9souesZ0WNOI7w2zxoEvajkzk6YJwolLDULehOt6SiVaz+8NZDbZCdnv9Wovky+D8fEyxNH/RIo97UrENhQq/FZwTSU7gGHFnC6dVQtYXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752848978; c=relaxed/simple;
	bh=iS24wPjXt19y/WRCUMfJ6nvMkOskbx8JLjLgfk8Km5Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NNQSaJ6ADKv0dV1M+tE2bhtS83fP9z8x9nGeBnP/psEpLj+2TUNhOqU0sl3/Mmk+/YwjsnOpULZe9m+PrW+JxqNFy5H9M4adC92eaG9/AIxEQzpo7xvymEFtmuJKdG3W+fS9OwXUwaXqIJP7Dx+eX3HuBZDPZ+w0BndPLXivygM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=GNGhuxbh; arc=none smtp.client-ip=98.137.65.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="GNGhuxbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1752848976; bh=xlDcm35ixtgi+pbQ7WX1OAnd8ZFAsOTKZLQFPPtefPw=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=GNGhuxbhWhVPXCcLeXY+U9IjCUNVVnJM1g+xgjE1eOmi601PzPQPSHM5g0w3vXpbfySyJ+3MGbg3NkZ7z+ilVcIMfSNRGvJQOtyrzWhMKCw5QpqbXNJ2ZGGFmw1rg+qdMIyuiqpnmtALD6+z9aEqKzflldolZ50bEWRUct7peG/Wng6W/aUsEwGPuTn6L5d0OUDpafjRQ4vIAWhnO3wmHKvSPN/yhNrjNgKgAis/jQmBjPZwn6PI1PIAO7MmkxMo3320vReGWycCeLiDRanaD5H6eGCCORcgKJwxbkZVMOiQ/AHwVG9ux+MIfg/XNavFh2+6uKGkrn4QHW8BezW5SQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752848976; bh=9lYf1yZHd4gKAVbo8LNIS0D4utSigPpK0Bq52pkFcTJ=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=NcnzGzcWFUPv+PZW3fMOHzCLY7gUUlJFFoGAeJ3EDsXHtnLn6JqorA0pHnPioZt0Ii/rLBcL1xy4zAcdvHRrOumyCL6pN0f+/kT20Wid8lPrA64P3jaTLH/oM/EhYCx0xv1WFRJe8cnp4CrxZV7oP9VvFfiqZsIPfJIQb2s6/bXJU3cmqGQREernNmV+FFZN7isX0Iijnb3Bi2YbwYPY13UzwSoAYa7vGDKKvbb/GWy127ubaac4x7GFMWlSqMzZbhn/ehzPHUEoB+zqOULSrJgPu4BZq1xaF8r7CbI6mWEHrGT2CHL8nmzOhFLwp1oC0Qei4+bT6ywidvepOBTFuA==
X-YMail-OSG: bKQ8ojIVM1leJsgBudKeJ77_HG2wHR4fNd6M2bZRgK0zDjtvffMFz7UFUcy1fut
 TrTZXkOA226ZcIePScvhr3HxnPo_PJxFAldTFGWEmtIDZiFNARTlueyfQJ.sNFLrawOJKTe5gTh.
 G8KCIykRkSmFWnnWJnX7UY_2NI_wSCrXFbxRP1U.0m1gCPGwDg9U7EZkDlom2LvCWgk1rLzaI22Z
 fZq1r2O4egmHojzQyfKKszwJMpVpXbagbAp1Cnnh31qnrrcF3Hn_je16TOAvPbl.U7aRIPKEYlZp
 mlvt3sNE1dkdLtzy2bA_3O3fpIje9aRifNTX0o1gB2o9Mc.kunxBG_I2n5mJtk1p0w9PX91OWILB
 iBprVOMHRA26rPyUnEJ3ov457rnBZ6Wdfcz1IaxkUksbeVk0gX0cQM1T4pxxbiM2DxlxxbkbTT80
 fP.MrbB1mVzMM4NN6HMUrGzo7RPH5eMCK4106KDBor3HHDJtxwQZ9ucr6RWtOBTbu_gNHgwBRATo
 JFCUlQ4KRxtZMu3Uyn3MgGVr1gt7POWMZha.DmqOGKEzR7AkKZrHWujeL7qN6p8qWpx5IQuYCwXP
 T..NWwke1xSLjgdyiW8T93UUMQe0kxdpm_E7HmGd77n8yzjPP.QZ.VY_19_6v4gyXqvC.617RaWc
 TITE2Ku8F8L5a8_nj1LiaxM46Ii5n3cnl6r_JTdhIXjE365frbFKNnvG1cvpd1XwLt5AE.Q5o.TV
 ntRRup9RTzPaC9IPoibmoIRgSFME1AaOoziV8JZzQdP_rOhwDF7FgyInGptMXxhx449c6shlxxm3
 LoG9cb9Egm1jwKNKM6K_gM2a8G1FicG_U21P6UWubI.JkGOvF5pib3hn2xXqlw3zXMsnbcOjJjnz
 CD9L91goXTeCUCTXpWfePMtNm6P3nz.pfxzaGbM81JX3imLFb17Y9U7.AzxjRwxOgqzB22DiMmTe
 BPgyXQIgKFsUQKwhE2WI4hEDdfRYcKZZgcSMPC5q4fJBzYYwF5FCtdRBsenFxVv2OMgHUAVS4qDd
 pE8TdyrzGzUg.fLOL4bTnbG3ns9p9BYSC8O_026Mv6QzUGfiIK5KmcrCWz2.X81HdSDO7WRQ0RE_
 ZfdNbJ6L_4zEM7VfK6TR2nJrl7kBa1tYs5MNtqCkySdD.KAx.RXpTrkCJLqIj5ZQmzPXNlRFeQ7g
 6MkjW.Hb2gJDXk.8YcOPsd086k9ElRb_ZO4H.hTh.KWxSGBfa3xCNmqf8LuPc0h7fZrrcqUH_XwZ
 CKYxI6ZvxCjxbzhLyZb5mPqWKmrw9WNI9oXkj9lnatfTQfF9mVlUe94NnchiyWyxVENwTBc9xBE2
 U9xeFlon0mXt_wtteeQkUkOc6FHMSy6eGm4L3lmgJjKQxjnNZaVY.PVqZ7mIXlpvEzmNjjxhHg.J
 VDf_fm6E3Y7r8O2oVzcFTfGsrVHE5UmdD9BQV9kMfvG6RkWlfWjXKqHaN.FSlxJ620wdk53z5va_
 DtWZi05ylFcZe0bOZwhmtN1Chc4Wk4mak29z2S5bmAG.J4uasEqsLKPFrMucCmAa2h0lmZ8tJiVa
 uBKyfPgbVgIPMxRkjs.CHpx1LqeWFCC4a2cqHpQcEs9ibUlHzKhobbTA3iPps2PKOy0agn_w94e7
 LEawl0RyLOeBzaEPPzaeC7ZhHvfKOfC5gyhGSw98u3A5J_YjSJEBPCFDFYZg2CWQmtSL4xbIl6yq
 d2NfsQvafcPvWHv8e0Q9zP91HcXAJeBFrT2Netjf8mAX7LeyLLWtsAjcxuuyC5LGIpaDSJfZ_Ep2
 wbo24KScnTtoWiFe0MBgyyBQNfnMBvxHvq8T.vxaXErHvJINMX6cHyhT6Vs3YUSIS3vWERN.YeVN
 .lk0ASVh5etG8RZEEnU20_TeSWVWhJ1MDJQNQ8Y4QbFafJSH42coZml7YBY0Y4TVhOTH3Gzfel3K
 FKmSHpR9mX.hisB1FDRhPKmt1oEBeDWl8Ncyj.jJnMkf.DT6BcbxpSRuv2TKalNsYqQV_WR.My6c
 a2DIhLDpPcHkqA.U14IJ_o570JJ2wuExFuCXwugvJlsteL1LzyvgsxDkYrl2Hzm1fPKuQGDt.Tj6
 LnZEYO_xEwVc3erowyJXXrlTw4KT3sZ7T9NZd6W7TebdUGpETw5eYASXS73M6n22_rpM5iDiH1kJ
 o1skzTIB1AOuUdohcV.EMvo.rwDEHIqRW0uxU7CWxVOkXRq4RGs0wGp2TdRU6tgdY4iAXeSYMg__
 LsdAY0ZNsFoocsg--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: b130b56d-587b-4520-8352-815a588f6d00
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.gq1.yahoo.com with HTTP; Fri, 18 Jul 2025 14:29:36 +0000
Received: by hermes--production-ir2-858bd4ff7b-bdxql (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4f1b9f37bda0b86da932075cedd6bf0d;
          Fri, 18 Jul 2025 13:59:12 +0000 (UTC)
Message-ID: <ea5ac37cfae72d312c47ab1983dd1fcb59edec28.camel@aol.com>
Subject: Re: [PATCH v2] drm/i915: replace DRM_DEBUG_SELFTEST with
 DRM_KUNIT_TEST
From: Ruben Wauters <rubenru09@aol.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Fri, 18 Jul 2025 14:59:10 +0100
In-Reply-To: <20250701115511.5445-1-rubenru09@aol.com>
References: <20250701115511.5445-1-rubenru09.ref@aol.com>
	 <20250701115511.5445-1-rubenru09@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.24187 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On Tue, 2025-07-01 at 12:54 +0100, Ruben Wauters wrote:
> DRM_DEBUG_SELFTEST was removed in commit fc8d29e298cf (drm: selftest:
> convert drm_mm selftest to KUnit) and all functions under it were
> converted to KUnit, under the DRM_KUNIT_TEST option
>=20
> This conversion however did not occur in the Kconfig.debug file in
> the
> i915 directory.
>=20
> This patch replaces the select for DRM_DEBUG_SELFTEST, an option that
> no
> longer exists, with the correct select, DRM_KUNIT_TEST.
>=20
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
> v2 changes:
> - update commit message to contain more detail about the background
> of
> =C2=A0 the change and why it is necessary
> ---
> =C2=A0drivers/gpu/drm/i915/Kconfig.debug | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug
> b/drivers/gpu/drm/i915/Kconfig.debug
> index 1852e0804942..b15b1cecb3aa 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -50,7 +50,7 @@ config DRM_I915_DEBUG
> =C2=A0	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop
> checks)
> =C2=A0	select DRM_DEBUG_MM if DRM=3Dy
> =C2=A0	select DRM_EXPORT_FOR_TESTS if m
> -	select DRM_DEBUG_SELFTEST
> +	select DRM_KUNIT_TEST
> =C2=A0	select DMABUF_SELFTESTS
> =C2=A0	select SW_SYNC # signaling validation framework
> (igt/syncobj*)
> =C2=A0	select DRM_I915_WERROR

Hello, I was wondering if it'd be possible to have this patch reviewed.
Having an incorrect Kconfig entry isn't ideal and it'd be good if this
could be fixed if possible

Thanks

Ruben Wauters
