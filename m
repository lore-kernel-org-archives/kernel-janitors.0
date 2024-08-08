Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421F61487C3
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Aug 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723111562; cv=none; b=a6ks3jeBp+hZJS9URf+zmXtnYoXJ8il7c1Yi33lkdWKt2dy+DGAhd3vgBSVhkMqgsnf84B9HoFvSWduCtjPo2yWkJ7ZgGWy6H5kULHySamQd0LLyN35kzsfkL7oknb+9Cg9tzzKN9tn15MLbJf2+DfG/K+LdStUBrK6oq7dVOZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723111562; c=relaxed/simple;
	bh=6hv5xKMBa4EVOIETsZgjUJj1tDj/hE5EZ3N7WS+BMmU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=giAAnYHc9VDobKWwDQjuiVtSWoNl0NnPYokx8ZAZBEY9ASajKTAT0fi4kU2ZaZopnP0BJmFjSyTVcdaK+l/tKIV122Vo6Xp5hTIZMbr0H4jth+hnZY7dVigAAnSTnG99fV7qgexItw95m2O4ys1ks/N4XA9Bn3YXH6Wckcn/Yl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n4HxHa5y; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n4HxHa5y"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3687fd09251so400798f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Aug 2024 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723111558; x=1723716358; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qPsQ8QVE2zEks663h1JC5K+bSl/B5g3BfpyLqR4k0g=;
        b=n4HxHa5yTpH9UzfsbLnDthna3m6hI9+Ph9C11hPNDhuFyxyvZWvcquKzyHlfgW+zCm
         rAM1IqSmCWhEpo7d4miB0Lz/P14bOUBykfZCtviX7G5WOp91C5cliuxD/vE2H8lWEYqa
         ELWGQlXHECzDSmzBsGXOlJa6L/5p0Umh7ilLKhbk5+D6OmyieophBIespy/24cRMawGR
         E5V8KopGRrH4aAinUudbK5pTvfi1XKH72VPkGSLvQjzk9mg1qeij79k5Tl2zf7DIXezD
         23IFklpluLBYy9ZVbPNK5Qqz3W8POP2kQ657Vb+WrHiageXZYF0OjeMa32u47Kf2eUWh
         3CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111558; x=1723716358;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qPsQ8QVE2zEks663h1JC5K+bSl/B5g3BfpyLqR4k0g=;
        b=KBWEFog0sCe7aJHN2D1tg/zPtTXevlI7+a6PfN3u0cHKpvpynfIW5klAaJISW1t2dK
         S9WNcDKzTAY94uv1Pe31IKJ4TJ7JOeaXuT8Q5dNeCbMokdb9Xv1m4ToOCWS5/Q5v5uZ3
         tFgy0AMzotUlPp5YWQm/Q2x/MKZ7Fz58vRLX+Dy8ry9a8+Byk372Y5uhAnrTS4u1bX5i
         W4LjHBtx7TldmLWTGN6w5106d5q/0q6GXXp9K/TTc1hQVdK3c/nCvalMMk1r78dXbq+t
         J7ldbIceX1cvhCxkMFFt2kKLAX4VNWcHIrnYSpDG0OE6BqbRoqFoH2/azc7xv/1SB7Fb
         /+5g==
X-Forwarded-Encrypted: i=1; AJvYcCV4tN420SryxWZjGQ5JGDx901y9Wdsb5XlLt1R9P6pJUAVzM+2oT8Zrvq5K+1dVnlaYEwCUI8CGeNA1q73Ytyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAIFxSflUngoME3SEXVOFs+nodEEV8AIY0ARAueP1s9pRG2D3Y
	1iB57HOZoswzwrNgvR+V7XLc98efiQn+CzTCidL6xwVJOPEToXFrbxsLWXhvb5o=
X-Google-Smtp-Source: AGHT+IHuYbrCTlKt5TCgiFSu5JCjZWHBFhE44QTQFbwLXgNURs2glTBXxCRbpAs970Ya85dt2iUAZw==
X-Received: by 2002:a05:6000:259:b0:368:4e98:6e9e with SMTP id ffacd0b85a97d-36d275900a9mr806392f8f.63.1723111558368;
        Thu, 08 Aug 2024 03:05:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27209a5esm1390336f8f.80.2024.08.08.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:05:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org,
  linux-gpio@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] pinctrl: meson: Constify some structures
In-Reply-To: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
	(Christophe JAILLET's message of "Wed, 7 Aug 2024 20:05:36 +0200")
References: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
Date: Thu, 08 Aug 2024 12:05:57 +0200
Message-ID: <1jplqjxray.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 07 Aug 2024 at 20:05, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

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
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

On the vim3l:
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
