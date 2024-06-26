Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175C16191A
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398408; cv=none; b=bdTT6NcuegKX/wkcVr061iFFEzdPDneikvKO7cT0wDEH34TGLUVkHRit3fj0XcLF7GfLn8k+7OzbiwxPUJlV1RIO4pABL2ou/dSWf/DWZ0BqWHPcFT+dLxfQVyS+r6J98kOWvgkowQWMAidVG5oPiMXnuPM7ACOHNUQ4W7YT3A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398408; c=relaxed/simple;
	bh=SOiuO5Fl6G+i9DWSRv/mCUh3g+3xRS6CNTyybI7Wnk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lulWLd3wIbGl7o5WtyWK/EikibXVBWTrbqiTVOzh+q+K1EHlN/SHMaROsZQ/DKC5jY3unNFrhCNMJIQrGE5WygPFcQyfR5NJJKlwUZpYmvEwReyW05SFSPmu1X/A83xCkaUhFOOcptNNgmd+vRnkR+uqkn+6Cg0YKwKTh3fhjJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHbB149Y; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHbB149Y"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cdf2c7454so7496165e87.1
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719398405; x=1720003205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOiuO5Fl6G+i9DWSRv/mCUh3g+3xRS6CNTyybI7Wnk0=;
        b=CHbB149YYvQ7hirS3x2iF+a7DrarXRo2d5iyB+wht7QLHKm+HImw/GaB6ZTMwb9c1f
         GsI+MSiU528QPHm/m27BBrXefq6Xd3j42G16ntw0l1L5AUlLmgUD4c9/ohnVIvIbMwM5
         7wspgKLxz4A0hpwHlk2BkqE0X0VWDG3+BgdxNf/89T7tBvOCwkLN7gsxkcCajta8XA2S
         +G1KxHMKbO9LZjh+xA1Tx7xnloWQK/0cUVhsyaPGNyjVkfx9xH3QBqYviY7YPagr83fQ
         Rxc6LcXzpxQXbEvqiUMxNdBbw8V18MjA1wTxGt/95RTWMg0OMQRzigOOlHdx96UJcl3Y
         DH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398405; x=1720003205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOiuO5Fl6G+i9DWSRv/mCUh3g+3xRS6CNTyybI7Wnk0=;
        b=NTzmYSNW34mgh2+026A5Ledqft9ZnAxG/NUL6/hKqx2Z/HExQzZ0VpeYf/4pCSOOaW
         5h8xFYYRwl68rGkFBQeRDMNjXkiEksJ7pA2UBFKBWP+xeuqvbkkvjPjbb8vLg6i5SEKA
         l4x97bFdWHfVVvcggtIfytoT4vbImWFXnXaih/1dCT1aaIqg0+QUui3cAZf2Zi36FOVp
         RsrO6lVl0bTBRnaHkbGpmByJF0tusT2F98QCEdvuBmw6Wwb8Qt4cHhsJBiplRa2EofRS
         HLEDucl5TPxm4iQVSSMi3ZV9YeFZNuV8KTkUt3PCGlz239mPj+W7YP5gqxjpfmPCuEtm
         pegQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP7stFdA5BwnO/RS8q3aRhyRR+ll2dk27+kA8QurTOF62xcVX2z7KSukETaGnMBgXvM+B8BuGxf5KeWljdnRB0Au2giuKUArIFOvmLc/ZR
X-Gm-Message-State: AOJu0YxsibqnjDKnl9SZzYHEW2rVmCQi+sgdTON96/FR+JIDb4aDEcgY
	PVbzrOZ1Vdrmugu85BzHS6HADj09ASWmYX4MJ1x92Yw+ig9wPduuLYELQ/O/5LyCulHmYqpKxvo
	J6cUlkeR017S9EJLAEamtTElyERhg/ACLl/zvFA==
X-Google-Smtp-Source: AGHT+IEEDLlgKkyLEHb/F4ksXcKqwRKo5110z2q983p4MDz3/i+AYm+GBB6HLyfL9Ci6xvmQwPbQLu94NT1EQjQELFc=
X-Received: by 2002:a05:6512:110f:b0:52c:df8e:a367 with SMTP id
 2adb3069b0e04-52cf4dafc54mr2880823e87.53.1719398405223; Wed, 26 Jun 2024
 03:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1719037737.git.christophe.jaillet@wanadoo.fr> <e7ac0fa83c6100cbe4e0efa90cf99291c2423b10.1719037737.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <e7ac0fa83c6100cbe4e0efa90cf99291c2423b10.1719037737.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:39:54 +0200
Message-ID: <CACRpkdYZfNyekcwo35Ccne7VaEhX+Oeg314piZP23piD+yxLWw@mail.gmail.com>
Subject: Re: [PATCH 3/3] power: supply: ab8500: Clean some error messages
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: sre@kernel.org, jic23@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 9:05=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> There is an useless extra comma at the end of some error messages, remove
> them.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
