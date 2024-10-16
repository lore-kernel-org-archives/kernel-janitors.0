Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D95A18B49B
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107096; cv=none; b=cRDSCkJG/jSz53euIb+MWidNaNZf+0R2P9AsPqGCk4rNVHMbIQQAf498/vUPVirpSMZGVBnOD9bQwr+N09ierXP47ltqIDdRLiaeLmexMxi7gOCEyhJd8BF7L/OUBU5e0+XYtSwsvWlCTOujh+UcQTcAJ2mejpvm4A7Bokv2DVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107096; c=relaxed/simple;
	bh=HKdeUruuQt6tmnr8RqhBs4A0W9peonkT1mwUkF6kp0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E37YxGw4ZCpH2z+26XbIZhEDvpjRnbe+NRkXrc9P8G2T1z5OBqxJ3hlmPL5h3Qph/PoBZ4iGkHTrtOqCdjTK0pcap8vhqxOVkTl5OeybusO4rZQoGMuh+kEOrZBbBUTh9nwnHJcO/5iEeSOSr8Wh7GCzeHEu4wfYLfbCuENBERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tl81W5mM; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tl81W5mM"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2e508bd28so2447187b3.2
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 12:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729107093; x=1729711893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKdeUruuQt6tmnr8RqhBs4A0W9peonkT1mwUkF6kp0Q=;
        b=Tl81W5mMy6m1ze5VpvNgYl4cBEZKK6jA/KEXvPLODB/TtoexjHpEVYIfT+8qyPm1Ga
         0oj6Y2rlCn5/VdzFQ05oW8c0s5KjdBPl73qKsJSrG/qeMEdGqw9I8JQjpy4Nf+WTzslX
         t2mZXiWGnbSM+qFhNcsglWGPIVx+5nVbAy527IWKQrX05C0pjP8x23MHSpfPOgZ8oq5Y
         GNyS0NACoVzs8Nv5cuybjycNCjEY9h0xcFymmeBVRQTxAof56Ubln8RhY8+olQaP3vpk
         xar3Rm0/QxeyTV5h2pvtUF9n/+J7iT9lDW8O1TxbfJcdCOOueUGBwlZ8KRGOn8km+dTG
         moqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107093; x=1729711893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKdeUruuQt6tmnr8RqhBs4A0W9peonkT1mwUkF6kp0Q=;
        b=WNlfUmHb+r09XqB2MIMHL80JI1B9DPSE2ZmG08LPIleckMGUxsVpycz0ngJJ8lHSgS
         eAEzjYTlent+JujvPCSPpQDihLgIQ614OD8V/88szRmfxOOoOZFnqNpK23DoDIHwXetg
         dilPGYNdUKgVKbHNLLS2de6ohK1qr6/8bYqzzRN2kDaQfsvUolg7vFNpONT0+IZ3wO08
         16Fu15KaKXFN4j/jWzfHi1nNyLdq09d4eaZw4337i5aW8XMs9cdizUIkmM+cjbMKZGaD
         JS/d4BCxQAIBbeCiE5LLHYKROd1z1y023/DvXPXwnvpRLEfkvboyEZzRsitP3MK3Ja/R
         M11w==
X-Forwarded-Encrypted: i=1; AJvYcCXLaFgrZZ0pdoi8pR3sOIOFlukFEIoSld0qqQJ+iOcWA8osTyo2PV6E52FqeF+sz9IbqZgAaDJXKO97tSfM1cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDBiToUKsTOqUsb89GaZ2NMBWfoCxv9Z+Hvy0rqfXTb3w/c3Dh
	iWz8M0M4sAQrie6RqgWqmG+56aAQWK/TisWSXDfgtpCO1ZfIZv1hml3WkJG9TjQzv3H9ZwDA8kc
	C72ubTUzrcyoSo5YeAs+V+wWrdVW/B798CAqhdA==
X-Google-Smtp-Source: AGHT+IEfazOyIOYKe6O7/B0E/863g1TCnOGYzblSEZ50USkJojuTTGw6xgDiEhcc3FeeiHPALgKRQd4IOs6OQp4o8tI=
X-Received: by 2002:a05:690c:6288:b0:6e3:410e:bb84 with SMTP id
 00721157ae682-6e3d40cb773mr54288407b3.20.1729107093430; Wed, 16 Oct 2024
 12:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016155655.334518-1-colin.i.king@gmail.com>
In-Reply-To: <20241016155655.334518-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:31:21 +0200
Message-ID: <CACRpkdYhsnRSOgdrDKp7BNqE4TpY3r--cPByFMsq0VRRjW-sAA@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: th1520: Fix potential null pointer
 dereference on func
To: Colin Ian King <colin.i.king@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 5:56=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> The initialization of muxtype deferences pointer func before func
> is sanity checked with a null pointer check, hence we have a null
> pointer deference issue. Fix this by only deferencing func with
> the assignment to muxtype after func has been null pointer checked.
>
> Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied, added Reported-by Kees since he mailed about this too.

Yours,
Linus Walleij
