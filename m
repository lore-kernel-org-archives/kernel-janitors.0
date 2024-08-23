Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12C14AD30
	for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 16:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428949; cv=none; b=ShNnPGHI2CbiXZb8ZWdAapEWe/oBMgs7GWu8Q8z+xf+FDzvBPbEhXebeuCf1hstV28D7XscWje0jmz7I4EQzw8/B9e31yyhzgBG0VYkAFw/mfkCC2ik/IagF2AaES9P6eblijT2lzyX/dekh1Zv3qBJHDvjkSHhPbjjHbq1jh30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428949; c=relaxed/simple;
	bh=d/qAONad33R0jZNDEjz+rr+CKv6vN/+BTiZ2PyG+I5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7q9W43lNFAwK3cfqF3y5gqAHHojIti8tmPaCZaRimDZ3xw8LgT5AeZB+A7exdDcQfHxtm1aVRYfCKle3ni78P+IzCJXzFumQL07prAu/zVi9Ey3PtjXc89rmtOSmbb6B4735v/tfUqdWZz9E066fJ9fIm2g2Ln55paWy+Bus24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSoFFUWZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSoFFUWZ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53438aa64a4so972740e87.3
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428945; x=1725033745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+byIGe4g18ARlIGzsWCBhessTlbszeK6bqUvyBPezWg=;
        b=xSoFFUWZuRg5/1cu/BXWg8hPzasdO3dO3eM3+DS/oBzVLp9/uzG1twKLqt6c8Nu+eY
         2+i/8YR8QmBl32L5k/B3YYXTnJ2pWfVs5wuRUNy/509E2OCKrYAW1kd4OowNkpQlVFF9
         oRWaYbPHsBp09hOMelV0Gd/JPk7uPc/dxDyePpAs/ClmIeY7QljU2hxkURGD0ge6bfBw
         qgohEcREqxomjreW+tCvYELEcnb1SLD7FwoxCi+sSt+fpxLuGX3Frco9bQ75rSmn5tSx
         EL/XaNmjoEptSK27S6sxdMZOZ03IqE0UmRZs3yCZ/2T7rYAG/uZSNufhmb+g27s03r43
         INcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428945; x=1725033745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+byIGe4g18ARlIGzsWCBhessTlbszeK6bqUvyBPezWg=;
        b=A5LAEZDbxO0IzW5SkdChGdr9/H8GVcnJFUKypOSgMWz4JsdLkKZ2ESYIJoJ+N07SRo
         qCFGfg+NOTKqC2DR3xaZlAK2IenU5h2CX5wcT95sRZ0E/YlNJK8QlSbFxDbkQO8Yw7jk
         kiXtYMF9ochn6mcU+gflv9bpDzQueMFQdgQLY5anHEZewqgdNoMG/VeRrzPFzChRsGZk
         meVuIdKZ3hn5/tY713MFcuTA06/qJ3FEdQK67Pq/yTBxTQ39kgoJFZTgOb46UIsC4Jce
         Um0V0uLcceMvW9ShUGkq+E/aFCNYs5l1MGfyfhh9id6Gx5prrGQAAa5OCC2kMRooZiRO
         TBxA==
X-Forwarded-Encrypted: i=1; AJvYcCWA6uwF6xk7ElR7c8Af4rHDu0oWpBYb749VviX2hLBzH4eFKajFiqlK//oNIsEzeG5cZRjaeNmOrUWddtnmww8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfG8AGq0efbzgoDzL8oSbKXR293LDSCi2Kz6SRTH3+JpbOcHP
	1NE7YLjx/IQmczDluNIiiidJYnGpFhx3Ar6kQtkMW6UF0QjSnXBWDPw9nJe5HCEpjbhNDIrWDVL
	LYAPXtFeVKBfZ4Icj2HMdIyblS8G/8AfkSaVcAQ==
X-Google-Smtp-Source: AGHT+IEbEoxnoSIsIcOXGYvvsido0gU280o9EgFhYynNtmAq+4AgzMA3KAh37jKek70/MtZreE52cxmgz9LwgewK5p8=
X-Received: by 2002:a05:6512:e9d:b0:533:47ca:974f with SMTP id
 2adb3069b0e04-5343883a0e6mr1568421e87.27.1724428944837; Fri, 23 Aug 2024
 09:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:02:14 +0200
Message-ID: <CACRpkdYUaqtqQ7mggRu6BFTs9cP-jsvqFhHv939jGSjZ4F6MCA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: meson: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 8:05=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> The following structures are not modified in these drivers.
>   - struct meson_bank
>   - struct meson_pmx_bank
>   - struct meson_pmx_func
>   - struct meson_pmx_group
>   - struct meson_pinctrl_data
>   - struct meson_axg_pmx_data
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security.

Patch applied.

Yours,
Linus Walleij
