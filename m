Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA58E2868AB;
	Sun, 26 Jul 2026 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785074149; cv=none; b=oOSc53FUQkpIzGqgtTRYB+caEnk3WJA68Uinwdb5jBXqSbcuXExFufvm9kb91sU3PDsQvC2xIUajaccYTRQJuQDSakHl5fqm44T8LO5sYVFuJKBkVw5TNtz/MuCQQrdxaHceUfE7aYmE+So4yCILNPkveaeFgMfVcdgnjzAhWJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785074149; c=relaxed/simple;
	bh=73fmwHqkPo2fY359Jo5j89QNiOTLuTicXrlFNaBaAsU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DjsXLBPUNgCHTz+VlbelZ9KYayPREunVJesweZryaxWXEbtDzPqdTQKAJUSH8bg2YqnbUXEN5A5bUIQYwo60qPsGczyHAXevaLOMhu//AopXQkXX6N5dwfTtpHgZVR+t+05BJOGDEqg1QtMUAppGi4BjYSlRtc1xxXhfAUy0faE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VwPnLX1r; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="VwPnLX1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785074144; x=1785678944; i=markus.elfring@web.de;
	bh=RR6r5AZ34B7aXs/bhvANG3FWkIZlhqUSyn7mINRdT7k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VwPnLX1rAfaAd1Hs1bgcmnloCW+lZZ6Jcw/yNaxw32kjCgA6knt/XCgqzrVLl4Wq
	 FPOjsB9sVztO/GTEJilVUh1n2R0QaP6sRSI2/EPwChRIsryhUH9cA7wlm52v2KDZ7
	 YwsQORhPzS8qNHTkd+rbsrHP2C2vcQFveG2TyKdeqfXjJX8z9bklulpdIqUNDh57y
	 wxYxxTiVglJoC7K/Tdg40/vEogYqtjd+UY6EgOIj/0qwKwivzfrN5mTIOawaApDJJ
	 gDaWb1fLCbR1JOPtlOIe6bsHkgl3g8GMx4s8Pfp9ZP2yulvB52GZVfupbGwZDbOzb
	 KkzgCDokf+axaPNk3w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdwNW-1xLgBi1lzC-00p0SN; Sun, 26
 Jul 2026 15:55:44 +0200
Message-ID: <c5a73800-59cd-4870-ae57-11fe832054b9@web.de>
Date: Sun, 26 Jul 2026 15:55:33 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [cocci] [PATCH 1/3] coccinelle: mini_lock: improve performance
 when searching loops
To: Sang-Heon Jeon <ekffu200098@gmail.com>, cocci@inria.fr,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260725113303.691676-2-ekffu200098@gmail.com>
Content-Language: en-GB, de-DE
In-Reply-To: <20260725113303.691676-2-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oWR/PCWKUaAw1M3Y0B7mS/V82h7mPG9EktgmgyexyV8l+bCUstI
 pKhqnLzPSKdWxpsh2fTyUg6rYyidYl5n+JWtCbaN4/UykF/I0s7xOXUTShsjXajA+JE9MSA
 koeX5Rhz9kK0bBI9rS0JYKu+bG7EapYdbA83uh8SDTSwNrmfUVa3maLTMwlwD14IWEbejkC
 cA+noiBnnwHNW9+wKH0nA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AnkwQJ1Q8QA=;GzNYR37c4n6Q76jXkrRLYu4+LhI
 +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
 =

=E2=80=A6
> +++ b/scripts/coccinelle/locks/mini_lock.cocci
> @@ -53,11 +53,31 @@ spin_lock_irq@p1
>  spin_lock_irqsave@p1
>  ) (E1@p,...);
> =20
> -@looped@
> +@err_candidate exists@
> +expression E1;
> +position prelocked.p;
> +position up !=3D prelocked.p1;
> +position rc;
=E2=80=A6

Can it help a bit to avoid the repetition of the type
for a few metavariables?

+position prelocked.p, up !=3D prelocked.p1, rc;


Regards,
Markus
