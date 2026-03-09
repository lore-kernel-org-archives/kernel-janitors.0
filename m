Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5E438F93A;
	Mon,  9 Mar 2026 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065119; cv=none; b=tM732Ykn9q4WhZ+Vv/nTblo81Ba3LmYOps2AXg7GpnFa5YETyC5aQnlLOsmfiA9kuh1XhC0f7qiaYnFQRvFXA5Ahzyu138kvnuZpZqkqN7FVgQG+JmEfgI3BpUwr4bEJVgFmNKBvbkkgiPl2LwS+h1rxAWnBsHhCkXZPqTCKw/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065119; c=relaxed/simple;
	bh=LbEnWF2lnQ1ghrHjvt8byA47pITCeudS0YPSgjFbc14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heQEF5fYQkCtuJjmHN3oridO2Ur55SE82K1+lc9qtjjYRFv88aTIurOEwivMw1RNTtlmYLRUtHJFKnb/bT5DtDmmuq/g1PTKxg1q0LRH4GeiboaHx9u8+uFSB9yxVTsaBqn6ySndsJrhxwnzbleQdu7ILFuz0jYzfS0rX2MFXgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Hm8rJByZ; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Hm8rJByZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773065110; x=1773669910; i=markus.elfring@web.de;
	bh=ZscBoKzOYu/nr99vWYOcH+ci6xWJkBlwCFCtDm31rUM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Hm8rJByZoKU/0C8GyO2sCq7fzFTEszaY6WuACdyS++ieCMO6b+X5VnYQaSZii4Hw
	 8IIKzWUqnjTPIEQSQHD3H8vmMoLSofi7irS09hCONEROf+tTsj9/qWTxS3I0FBXlt
	 e7Q4LyUyUjTdbB+tSeaz+JPkQf103JKK7cePB3mGqWe3VOpuqJ2xpH6StbGFMRRej
	 Gbz2C6v4fdZd1RpSktx4giCbBf2xkFicxxsM2+NsnkmLFOwhS8FFooUnHMNhYdXNW
	 zITYJK15OopuhoA4SDQbwB9+sIXmEsSNeNbe6ni2vAEwAyGLYCVlUtcU+YRmpjzZ8
	 1mzTNIsAk43no1Lv1w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwA1O-1vghMo092a-00wdgW; Mon, 09
 Mar 2026 15:05:10 +0100
Message-ID: <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>
Date: Mon, 9 Mar 2026 15:05:08 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scripts/coccinelle: Add script for using ARRAY_END()
To: Alejandro Colomar <alx@kernel.org>, cocci@inria.fr
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Kees Cook <kees@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cbfBFrP7d4RBd77+HVO6D+0xMPFFda4CYtd58UU3mhx+WHzHlgu
 n/yvkDibE+mVXeVV0s6sryWxQqARzjWy6ryHTQofwxJLiURL1JNHypMKRi8r9/+DfkVxHsj
 iCRGj/m7ImQQ3fZVXq4vR1rcukSiZ/pqlfsbXYaGz17ZXtkJw/Voyx+7AWIlrapRejQhw3i
 5bByUUGTjeBr0efVIhbiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M+j2LJ7XOVg=;RZsuozZKD1oU7dFogTt43fjUVmS
 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
 3rVTC8HOpIX5FKK8pqcNM0hfjcP+7

=E2=80=A6
> ---
>  scripts/coccinelle/misc/array_end.cocci | 74 +++++++++++++++++++++++++
=E2=80=A6

Some contributors would appreciate patch version descriptions.
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc3#n310


May a subdirectory name be omitted from the subject prefix?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/sc=
ripts/coccinelle/


=E2=80=A6
> +// Comments: No known false positives, but has a few false negatives

Would such information motivate for any further software refinements?


=E2=80=A6
> +@script:python depends on org@
> +p << r.p;
> +@@
> +
> +coccilib.org.print_todo(p[0], "WARNING should use ARRAY_END")
=E2=80=A6

I suggest to reuse the message also from the SmPL report rule.

Regards,
Markus
