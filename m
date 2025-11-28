Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E601721CC44
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345727; cv=none; b=M27BgLRrgyGvYsLl5/2KowQ4GaaZjCj8ra0X2jpoLXnNIaOj5OWscBh8LECXyuK84YXDvxR009zq5I9h7U9lQgdrNnrxWjP1AUaz661uqoQhkvvcRqy2y2RBLxikZrnP82+49jO/rAEoR89zt7MGw/cyQDo9NDGPFpfmca6sfqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345727; c=relaxed/simple;
	bh=TMMmgOQgbpewBnsq36W/7DVUydqERT9TKpdf3BBghG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n01FOdehggunN0vOV3KHHjBV3pu50l8spD3x06VC1S3WrYLAKLcaYMInCA8s1admHCN0EttomS3u+0zRDoaUt0KIV+G7CtNTMv4+YkqLJdsRANGP0lOc1iPKFya5IQBA1QYq59wyaJPuRQZRebdyilD6ruWhCSiZsHn+ei4Z4pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=dbyXe6yv; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="dbyXe6yv"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso4001829a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 08:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764345723; x=1764950523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMMmgOQgbpewBnsq36W/7DVUydqERT9TKpdf3BBghG8=;
        b=dbyXe6yvZLg/SRKz6VuDrkSxoGFaZ/dXuJOyxfphiRX6Jbx9p/F/VA5zIZUd0AnHfH
         stAyl2rJskGSS3/WfduQCptJCxlHupU38/ys/+mrKODaGllhQI9+Pps1fRAKnnvFrVmi
         gfrS49b0JA8qoyxtG1J7fE4f79w9Vkj0s0ZbUUmqMCeyWGx4fkUIYi2HS6l+QPIiNu6E
         uIjaMHMRy4WCaPo/mFo+HPZsF5tG0w+oA0HQlGUUtXCkJYPrUKalYk87K94TzZJwIpsZ
         UEAMHTpkEsJmeM6tAK1PXvgHHObZeHaGrS04fJEDih50LOXPFGv6WCP+sEdFIlxgGjbP
         xL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345723; x=1764950523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TMMmgOQgbpewBnsq36W/7DVUydqERT9TKpdf3BBghG8=;
        b=GJxxuC44pib1ivjHBzaYtmAWomvKcyTDMFDJQw/7P3rdayw94kKBMAKL9OqDVOHdIt
         VSmiDIcgvj84P5X9r5qmGBHfyJM430JUp2RVj/9BI+eSnOumtGmDais6I/8W9GHmq1+/
         LKu3s+Be3m3RY29d2HY1+oMQKtWvg4LmeUg1RDIiyTeYxOkXBpHvtcsYGRJ1kDHeEOLd
         KP4LZYpd6HgGoWAXPnd8IyAeReZqJF3pB38Xs4Qc16OI5FLKnjF8qNgbJ7rCWYQdGwcE
         6LnOBeVb7UJ5+tGxPWxdFgEfURkbUpDINLry/pjH1XCdgjvIP+Uep+lpRfsbIr5P6AEP
         YYeA==
X-Forwarded-Encrypted: i=1; AJvYcCVXCx6imNaFTSEq44iM3HizQ04BbvTK+sBDn+Bof/6gx+6eJTr/DguQhFciPMD0Oav/O+PfdMckGFyvU8hoJoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHss7p+4KZD/OEdyTe70eX8dkTkl6AYRtgc/MuVlyBLuvyGVW0
	PCVG7ZjUTUJaUuIldq0X9DxA/7bgQrYNJNSaYgGUinCoNELgN+kY4zGTL6EBODQHFgI4VHRfc5C
	XRCwatsxsvJhXB0dAvAW0DAXC/jRapjtZd4VTpVTY6g==
X-Gm-Gg: ASbGnctmQKidvml3RUFupPLzycJLcKKvB1yzjXFfiekvvjisX/dfEcOi2wWuWRHP4Bi
	rXNi5SLcldz1fnyHi7YFDLbpkxQ0+wh1aewdCINhsGyKeEryaIrym/ERAM+K1F3UMJeJFCJie2w
	PGjummS5phK6Nb1bfvXI4nabu3H8HlZh03Ofgj8fHlLRH9Db66rPO3u/ldkuHYJoO4BIa+RtDbf
	ZssWpYkx84WsA77ITHjxuVc13OrOnepTBxnNlgqvTcBtcG+SvWCqZVdOO25BchOoQ6Byx6FVRNW
	9ps=
X-Google-Smtp-Source: AGHT+IE8DhdaQ7zFI8SJagCVL8O86a4JRp320iHOQrA2ytc4viByD0arOT33ZLl18J0Yj5cIfVdVHaVTF2BzJjl6fNw=
X-Received: by 2002:a05:6402:23ca:b0:636:2699:3812 with SMTP id
 4fb4d7f45d1cf-64554817594mr24017558a12.0.1764345719949; Fri, 28 Nov 2025
 08:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aSlMc4SS09Re4_xn@stanley.mountain> <CA+CK2bCtFFcRGrtJ2PAkaCiBge6HjXRX9F5oiyBtCjEOOiQ56Q@mail.gmail.com>
In-Reply-To: <CA+CK2bCtFFcRGrtJ2PAkaCiBge6HjXRX9F5oiyBtCjEOOiQ56Q@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 28 Nov 2025 11:01:23 -0500
X-Gm-Features: AWmQ_blbGSAsvhUdsh0PMLH-1wul_WDrFTyBNTlDMevan86dpXjBCsrHWcbLebo
Message-ID: <CA+CK2bAy5JO_jX_vTZ4RsYjUkb9sAjh6zgaEDvVje6062er7=Q@mail.gmail.com>
Subject: Re: [PATCH next] liveupdate: luo_file: don't use invalid list iterator
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 9:38=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> > Fixes: 3ee1d673194e ("liveupdate: luo_file: implement file systems call=
backs")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/r/202511280420.y9O4fyhX-lkp@intel.com/
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Given that this patch is already in nonmm-stable, it should be OK to
apply this fix in one of the RCs.

>
> Thank you,
> Pasha
